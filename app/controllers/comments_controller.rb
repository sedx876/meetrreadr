class CommentsController < ApplicationController

    def create
        @comment = Comment.new(comment_params)
        @comment.book_id = params[:book_id]
        @comment.save
        flash.notice = "Your comment has been added!"
        redirect_to book_path(@comment.book)
      end


      private
      
      def comment_params
        params.require(:comment).permit(:user_name, :body)
      end  
end
