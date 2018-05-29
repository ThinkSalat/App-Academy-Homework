export const addLoggingToDispatch = store => next => action => {
  console.log("Old State: ",store.getState());
  console.log("Action: ",action);
  console.log("Next: ",next);
  next(action);
  console.log("New State: ",store.getState());
};

export const nextWare = store => next => action => {
  console.log("We're curryin' as fast as we can o'er here!");
  next(action);
};