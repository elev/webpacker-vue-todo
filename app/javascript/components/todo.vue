<template>
  <div id="app">
    <div class="todos">
      <div v-for="todo in todos">
        <div class="todo" :class="{ 'todos__editing': todo === isEditing }">
          <div class="todos__grid">
            <div class="todos__grid-item-left">
              <input type="checkbox"
                    v-model="todo.completed"
                    @change="toggleCompleted(todo)">

              <label class="todos__label"
                      :class="{ 'todos__completed': todo.completed }"
                      @dblclick="activateEdit(todo)">
                {{ todo.title }}
              </label>

              <input class="todos__edit"
                    v-input-focus="todo === isEditing"
                    v-model="todo.title"
                    type="text" name="update"
                    @blur="deactivateEdit"
                    @keyup.esc="deactivateEdit"
                    @keyup.enter="editTodo(todo)">
            </div>
            <div class="todos__grid-item-right">
              <a @click="deleteTodo(todo)">delete</a>
            </div>
          </div>
        </div>
      </div>
      <div class="new-todo">
        <label>New Todo</label>
        <input type="text" v-model="newTodo" v-on:keyup.enter="addTodo" placeholder="add new todo">
      </div>
    </div>
  </div>
</template>


<script>
export default {
  data: function () {
    return {
      newTodo: '',
      isEditing: {}
    }
  },
  computed: {
    todos: function () {
      return this.$store.getters.todos
    }
  },
  methods: {
    addTodo: function() {
      this.$store.commit('addTodo', {
        title: this.newTodo, 
        completed: false 
      });
      this.newTodo = '';
    },
    getTodos: function() {
      this.$store.commit('loadTodos');
    },
    editTodo: function(todo) {
      this.$store.commit('editTodo', { todo });
      this.deactivateEdit(todo);
    },
    deactivateEdit: function(todo) {
      this.isEditing = {};
    },
    activateEdit: function(todo) {
      this.isEditing = todo;

    },
    deleteTodo: function(todo) {
      this.$store.commit('deleteTodo', { todo });
    },
    toggleCompleted: function(todo) {
      this.$store.commit('editTodo', { todo }); 
    }
  },
  created: function() {
    this.getTodos()
  },
  directives: {
    'input-focus': function(element, binding) {
      if (binding.value) {
        element.focus();
      }
    }
  }
  
}
</script>

<style lang="scss" scoped>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #FFFFFF;
  font-size: 23px;
  margin-top: 60px;
  text-align: center;
}

h1, h2 {
  font-weight: normal;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}

.todos {
  margin: 0 auto;
  width: 400px;
  text-align: left;
}

  .todos__grid {
    width: 100%;
    font-size: 0;
  }

    .todos__grid-item-left {
      display: inline-block;
      width: 90%;
      text-align: left;
      font-size: 23px;
    }

    .todos__grid-item-right {
      display: inline-block;
      width: 10%;
      text-align: right;
      font-size: 23px;
    }

  .todos__completed {
    text-decoration: line-through;
  }


.todos__editing {}

.todos__edit {
  display: none;

  .todos__editing & {
    display: inline-block;
    border: 0;
    border-bottom: 1px solid white;
    background: transparent;
    color: white;
    font-size: 30px;
  }
}

.todos__label {
  display: inline-block;
  border-bottom: 1px solid transparent;
  cursor: pointer;

  .todos__editing & {
    display: none;
  }
}


</style>
