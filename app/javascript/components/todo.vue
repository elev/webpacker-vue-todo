<template>
  <div id="app">
    <div class="todos">
      <div v-for="todo in todos">
        <div class="todo">
          <input type="checkbox" v-model="todo.completed">
          <label v-bind:class="{ 'todo-completed': todo.completed }">{{ todo.title }}</label>
        </div>
      </div>
      <div class="new-todo">
        <label>New Todo</label>
        <input type="text" v-model="newTodo" v-on:keyup.enter="addTodo" placeholder="add new todo">
      </div>
    </div>
    <p>
      <span>COUNT:</span>
      {{ countTimes3 }}
      <button v-on:click="increment">Go Up</button>
    </p>
  </div>
</template>


<script>
export default {
  data: function () {
    return {
      count: 1,
      newTodo: '',
      todos: [
        { title: 'hello',
          completed: true
        },
        {
          title: 'get make to work with brew',
          completed: false
        }
      ]
    }
  },
  computed: {
    countTimes3: function() {
      return this.count * 3
    }
  },
  methods: {
    addTodo: function() {
      this.todos.push({ title: this.newTodo, completed: false});
      this.newTodo = '';
    },
    increment: function() {
      this.count++
    }
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
</style>
