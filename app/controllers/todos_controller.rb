class TodosController < ApplicationController

  def show
    @todos = Todo.all()
    render 'todo'
  end

  def index
    @todos = Todo.all()
    render json: { status: 200, data: @todos }
  end

  def update
    @todo = Todo.find(params[:id])

    if @todo.update_attributes( todo_params )
      @todos = Todo.all()
      render json: { status: 200, data: @todos }
    else
      render json: { status: 500, data: 'broke' }
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    
    if @todo.destroy
      @todos = Todo.all()
      flash[:success] = "Item Deleted"
      render json: { status: 204, body: nil }
    else
      flash[:error] = "Action failed"
    end
  end

  def create
    @newTodo = Todo.new(todo_params)
    @newTodo.save
    @todos = Todo.all()
    render json: { status: 200,
                  data: @todos }
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :completed)
  end
end
