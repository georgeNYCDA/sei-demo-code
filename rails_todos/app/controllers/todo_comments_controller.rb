class TodoCommentsController < ApplicationController

	def new
		@todo = Todo.find(params[:todo_id])
		@todo_comment = TodoComment.new
	end

	def create
		todo = Todo.find(params[:todo_id])
		todo.todo_comments.create(todo_comment_params)

		redirect_to todos_path
	end

	private

	def todo_comment_params
		params.require(:todo_comment).permit(:content)
	end
end
