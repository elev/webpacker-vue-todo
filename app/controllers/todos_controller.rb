class TodosController < ApplicationController
  def show
    @todos = Todo.all()
    render 'todo'
  end

  def index
    @todos = Todo.all()
    render json: { status: 200,
                  data: @todos }
  end

  def update
    @todo = Todo.find(params[:id])

    if @todo.update_attributes( title: params[:title],
                                completed: params[:completed] )
      @todos = Todo.all()
      render json: { status: 200,
                      data: @todos }
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    @todos = Todo.all()
    render json: { status: 200,
                  data: @todos}
  end

  def create
    @newTodo = Todo.new(title: params[:title], 
                        completed: false)
    @newTodo.save
    @todos = Todo.all()
    render json: { status: 200,
                  data: @todos }
  end
end
