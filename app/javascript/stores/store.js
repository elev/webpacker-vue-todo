import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    todos: []
  },
  getters: {
    todos: function(state) {
      return state.todos;
    }
  },
  mutations: {
    loadTodos: function(state) {
      fetch('/todos')
        .then(response => { return response.json() })
        .catch(error => console.error('Error:', error))
        .then(response => { state.todos = response.data; });
    },

    addTodo: function(state, payload) {
      fetch('/todos', {
        headers: {
              'Content-Type': 'application/json'
        },
        method: 'POST',
        body: JSON.stringify({ todo: payload })
      })
      .catch(error => console.error('Error:', error ))
      .then( state.todos.push(payload) );
    },

    deleteTodo: function(state, payload) {
      fetch(`/todos/${payload.todo.id}`, {
        headers: {
          'Content-Type': 'application/json'
        },
        method: 'DELETE'
      })
      .catch(error => console.error('Error:', error ))
      .then((response) => { 
        state.todos = state.todos.filter(todo => todo.id != payload.todo.id)
      });
    }
  }
});
