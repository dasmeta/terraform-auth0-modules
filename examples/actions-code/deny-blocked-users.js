exports.onExecutePostLogin = async (event, api) => {
  if (event.user.app_metadata && event.user.app_metadata.blocked) {
    api.access.deny("User is blocked.");
  }
};
