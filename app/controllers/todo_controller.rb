class TodoController < ApplicationController
  def show
    @todos = Todo.all()
    render 'todo'
  end

  def create
    @newTodo = Todo.new(title: params[:title], completed: false)
    @newTodo.save
    @todos = Todo.all()
    render 'todo'
  end
end
