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
      console.log('TODO -- Use Rails Backend')
      fetch('https://jsonplaceholder.typicode.com/todos?_limit=5')
        .then(function (response) { return response.json() })
        .then(function (todos) { state.todos = todos; })
    },

    addTodo: function(state, payload) {
      state.todos.push(payload);
    }
  }
});
