require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  test "todos without priority should fail" do
    my_todo = Todo.create(name: '3456789', description: 'dfghjkl')

    assert_not(my_todo.persisted?)
  end

  test "todos without valid priority " do
    my_todo = Todo.create(name: '3456789', description: 'dfghjkl', priority: 'W')

    assert_not(my_todo.persisted?)
  end

  test 'only returns valid todos after date' do
  	my_todo1 = Todo.create(name: '3456789', description: 'dfghjkl', priority: 'H')
  	my_todo2 = Todo.create(name: '3456789', description: 'dfghjkl', priority: 'H')
  	my_todo3 = Todo.create(name: '3456789', description: 'dfghjkl', priority: 'H')

  	
  	results = Todo.created_after(my_todo2.created_at)
  	assert_equal(2, results.length)
  end

  test 'should return all todo names' do
  	Todo.create(name: 'Harry', description: 'dfghjkl', priority: 'H')
  	Todo.create(name: 'Johnny', description: 'dfghjkl', priority: 'H')

  	assert_equal('Harry Johnny', Todo.all_todo_names)
  end
end





