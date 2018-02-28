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
      state.todos.push(payload);
    }
  }
});
