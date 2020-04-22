require 'byebug'
class TodosController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @todos = current_user.todos
        render :index
    end

    def create
        id = current_user.id
        @todo = Todo.new(
            user_id: id,
            todo: params[:todo][:todo]
        )
        if @todo.save!
            @todos = current_user.todos
            render :index
        else
            flash.now[:errors] = @todo.errors.full_messages
        end
    end



    private

    def todo_params
        params.require(:todo).permit(:todo)
    end
end
