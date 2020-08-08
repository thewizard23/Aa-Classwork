export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";

export const receiveTodos = todos => ({ //array of objects
  type: "RECEIVE_TODOS",
  todos
});

export const receiveTodo = todo => ({ //object
  type: "RECEIVE_TODO",
  todo
});

