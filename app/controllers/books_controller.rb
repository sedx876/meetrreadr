class BooksController < ApplicationController
    before_action :current_user, only: [:new, :edit, :delete] 
    before_action :require_login, only: [:new, :edit, :delete]

    def index 
        @books = Book.all.ordered
      end
  
      def show
        @book = Book.find(params[:id])
        @comment = Comment.new
        @comment.book_id = @book.id
      end
  
    #   def new
    #     @book = Book.new
    #   end

    def new 
        @book = current_user.books.build 
        @book.user_id = current_user.id 
    end

      def create 
        @book = current_user.books.build(book_params)
        @book.user_id = current_user.id
        if @book.save 
            redirect_to book_path(@book) 
        else
            render :new
        end
      end
  
    #   def create
    #     @book = Book.user.id.build(book_params)
    #     #@book = Book.new(book_params)
    #     #@book = @user.book.build
    #     #@book.user.id = @book.id
    #     @book.save
    #     flash.notice = "'#{@book.title}' has been added to the list!"
    #     redirect_to book_path(@book.id)
    #   end

      def edit
        @book = Book.find(params[:id])
      end
  
      def update
        @book = Book.find(params[:id])
        @book.update(book_params)
        flash.notice = "'#{@book.title}' has been update!"
        redirect_to book_path(@book)
      end

      def users_books
        @user_id = current_user.id
        @books = Book.users_books(@user_id).ordered 
      end
  
      def destroy 
        @book = Book.find(params[:id])
        @book.destroy 
        flash.notice = "'#{@book.title}' has been deleted!"
        redirect_to books_path 
      end
  
      private
  
      def book_params
        params.require(:book).permit(:title, :author, :description, :tag_list, :image, :user_id)
      end
end
