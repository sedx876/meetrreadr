class BooksController < ApplicationController

    def index 
        @books = Book.all 
      end
  
      def show
        @book = Book.find(params[:id])
        @comment = Comment.new
        @comment.book_id = @book.id
      end
  
      def new
        @book = Book.new
      end
  
      def create
        @book = Book.new(book_params)
        @book.save
        flash.notice = "'#{@book.title}' has been added to the list!"
        redirect_back_or_to book_path(@book)
      end

      def edit
        @book = Book.find(params[:id])
      end
  
      def update
        @book = Book.find(params[:id])
        @book.update(book_params)
        flash.notice = "'#{@book.title}' has been update!"
        redirect_to book_path(@book)
      end
  
      def destroy 
        @book = Book.find(params[:id])
        @book.destroy 
        flash.notice = "'#{@book.title}' has been deleted!"
        redirect_to books_path 
      end
  
      private
  
      def book_params
        params.require(:book).permit(:title, :author, :description, :tag_list, :image)
      end
end
