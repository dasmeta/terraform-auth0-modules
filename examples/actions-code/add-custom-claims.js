exports.onExecutePostLogin = async (event, api) => {
  api.accessToken.setCustomClaim("https://example.com/roles", event.authorization ? event.authorization.roles : []);
};
