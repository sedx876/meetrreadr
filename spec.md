# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
  
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) [has_many :comments has_many :taggings]
  
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) [belongs_to :user belongs_to :books]
  
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)    [has_many :tags through :taggings  has_many :books through :taggings]
  
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) [ User has_many :comments, through: :books]
  
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) [User can build a book listing by supplying a title, author and description as well as making a tag list for a book. A user can leave comments]
  
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)[User validations such as presence of username, email, password. Validates uniqueness of username and email]
  
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)[Ordering booking list by most recently added]
  
- [x] Include signup (how e.g. Devise)[Bcrypt]
- [x] Include login (how e.g. Devise)[Bcrypt]
- [x] Include logout (how e.g. Devise)[Bcrypt]
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) [OmniAuth]
- [x] Include nested resource show or index (URL e.g. users/2/recipes) [books and comments]
  
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) [books and comments]
  
- [x] Include form display of validation errors (form URL e.g. /recipes/new) [edit, new, and delete]

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate