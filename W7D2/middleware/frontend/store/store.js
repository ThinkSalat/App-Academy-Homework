import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';
import * as middleware from './middleware';

let middlewares = Object.keys(middleware).map(key=>middleware[key]);

const configureStore = (preloadedState = {}) => {
  const store = createStore(rootReducer, preloadedState, applyMiddleware(...middlewares));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
}

export default configureStore;
