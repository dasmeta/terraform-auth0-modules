locals {
  auth0_action = [
    {
      code = "/**\n* Handler that will be called during the execution of a PostChangePassword flow.\n*\n* @param {Event} event - Details about the user and the context in which the change password is happening.\n*/\nexports.onExecutePostChangePassword = async (event) => {\n};\n"
      name = "test"
    }
  ]
}
