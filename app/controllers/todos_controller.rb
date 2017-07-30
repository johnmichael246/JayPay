class TodosController < ApplicationController
    before_action :authorize

    def index
        @todos=Todo.all
        @todo = Todo.new
    end

    def new
        @todo = Todo.new
    end
    
    def create
        @todo = Todo.new(params.require(:todo).permit(:list))
        if @todo.save
            redirect_to todos_path
        end
    end
    
    def update
        @todo = Todo.find(params[:id])
        if @todo.update_attributes(params.require(:todo).permit(:list))
            redirect_to todos_path
        else
            render :edit
        end
    end
    
    def destroy
        @todo = Todo.find(params[:id])
        @todo.destroy
        redirect_to :action=>'index'
    end
    
    def show
    end
    
    
end
