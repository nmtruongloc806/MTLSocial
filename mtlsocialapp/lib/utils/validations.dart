class Validations{
  static bool isValidUserName(String userName){
    return userName != null && userName.length > 6;
  }
  static bool isValidPassword(String password){
    return password != null && password.length > 6;
  }
}