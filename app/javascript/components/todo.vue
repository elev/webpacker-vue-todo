<template>
  <div id="app">
    <div class="todos">
      <div style="height:200px;width:200px" class="todo-editing"></div>

      <div v-for="todo in todos">
        <div class="todo" :class="{ 'todo-editing': todo === isEditing }">
          <input type="checkbox" v-model="todo.completed">
          <label class="todo-label" :class="{ 'todo-completed': todo.completed }" @click="toggleEdit(todo)">{{ todo.title }}</label>
          <input class="todo-edit" type="text" name="update" @keyup.enter="editTodo(todo)" placeholder="{todo.title}" value="{todo.title}">
          <a @click="deleteTodo(todo)">delete</a>
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
    },
    getTodos: function() {
      this.$store.commit('loadTodos')
    },
    editTodo: function(todo) {

    },
    toggleEdit: function(todo) {
      this.isEditing = todo;
    },
    deleteTodo: function(todo) {
      this.$store.commit('deleteTodo', { todo });
    }
  },
  created: function() {
    this.getTodos()
  }
  
}
</script>

<style scoped>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
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

.todo-completed {
  text-decoration: line-through;
}


.todo-edit {
  display: none;
}

.todo-label {
  display: inline-block;
}

.todo-editing .todo-label{ display: none; }

.todo-editing .todo-edit { display: inline-block; }


</style>
