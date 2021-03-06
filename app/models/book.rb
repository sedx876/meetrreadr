class Book < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings, dependent: :destroy
  has_attached_file :image
  validates_presence_of :title, :author, :description
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  scope :ordered, -> { order('created_at DESC') }
  scope :search, -> (search) { where("title LIKE ?", "%" + search + "%")}
  
  

  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end
  
  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end

  def self.users_books(user)
    where(user_id: user)
  end

  


end
