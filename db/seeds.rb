Todo.delete_all

Todo.create!([
  { title: 'Get groceries', completed: true },
  { title: 'Go running', completed: false },
  { title: 'Seed database', completed: false },
  { title: 'Watch movie', completed: false }
]);
