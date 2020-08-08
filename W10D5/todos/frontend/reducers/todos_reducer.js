import {RECEIVE_TODOS, RECEIVE_TODO} from '../actions/todo_actions';

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false,
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true,
  },
};

const todosReducer = (oldState = {}, action) => { 
// { type: "RECIEVE_TODOS", todo: {'wash the dog'}}

  Object.freeze(oldState)
  let nextState = Object.assign({}, oldState);  // create a copy of oldState
  switch (action.type) {
    case RECEIVE_TODO:
      nextState[action.todo.id] = action.todo; //ask about me
      return nextState;
    case RECEIVE_TODOS: // ask about me too
      let nextState = {};
      action.todos.forEach(todo=> {
        nextState[todo.id] = todo;
      });
      return nextState;
    default:
      return oldState;
  }
};

export default todosReducer;