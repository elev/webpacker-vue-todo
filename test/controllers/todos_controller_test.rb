require 'test_helper'

class TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo = todos(:two)
  end

  test "update" do
    patch todo_url(@todo), params: { completed: true }
    @todo.reload
    assert_equal true, @todo.completed  

    patch todo_url(@todo), params: { title: 'new name' }
    @todo.reload
    assert_equal 'new name', @todo.title     
  end

  test "destroy" do
    assert_difference('Todo.count', -1) do
      delete todo_url(@todo)
    end
  end

  test "create" do
    assert_difference('Todo.count') do
      post todos_url, params: { 
        todo: {
          title: 'read book',
          completed: false
        }
      }
    end
  end
end
