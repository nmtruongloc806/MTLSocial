import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class AuthBloc {
  final FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;

  // StreamController _nameController = new StreamController();
  // StreamController _emailController = new StreamController();
  // StreamController _passController = new StreamController();
  // StreamController _phoneController = new StreamController();

  // Stream get nameStream => _nameController.stream;
  // Stream get emailStream => _emailController.stream;
  // Stream get passStream => _passController.stream;
  // Stream get phoneStream => _phoneController.stream;

  // bool isValid(String name, String email, String pass, String phone) {
  //   if (name == null || name.length == 0) {
  //     _nameController.sink.addError("Nhập tên");
  //     return false;
  //   }
  //   _nameController.sink.add("");

  //   if (phone == null || phone.length == 0) {
  //     _phoneController.sink.addError("Nhập số điện thoại");
  //     return false;
  //   }
  //   _phoneController.sink.add("");

  //   if (email == null || email.length == 0) {
  //     _emailController.sink.addError("Nhập email");
  //     return false;
  //   }
  //   _emailController.sink.add("");

  //   if (pass == null || pass.length < 6) {
  //     _passController.sink.addError("Mật khẩu phải trên 5 ký tự");
  //     return false;
  //   }
  //   _passController.sink.add("");

  //   return true;
  // }

  void signUp(String email, String pass, String name, String phone,
      Function onSuccess, Function(String) onRegisterError) {
    _fireBaseAuth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((user) {

      _createUser(user.user.uid, name, phone, onSuccess, onRegisterError);
      
    }).catchError((err) {
      print("err: " + err.toString());
      _onSignUpErr(err.code, onRegisterError);
    });
  }

  void signIn(String email, String pass, Function onSuccess,
      Function(String) onSignInError) {
    _fireBaseAuth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      onSuccess();
    }).catchError((err) {
      print("err: " + err.toString());
      onSignInError("Sign-In fail, please try again");
    });
  }

  void _onSignUpErr(String code, Function(String) onRegisterError) {
    print(code);
    switch (code) {
      case "ERROR_INVALID_EMAIL":
      case "ERROR_INVALID_CREDENTIAL":
        onRegisterError("Invalid email");
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        onRegisterError("Email has existed");
        break;
      case "ERROR_WEAK_PASSWORD":
        onRegisterError("The password is not strong enough");
        break;
      default:
        onRegisterError("SignUp fail, please try again");
        break;
    }
  }

  Future<void> signOut() async {
    print("signOut");
    return _fireBaseAuth.signOut();
  }

  // void dispose() {
  //   _nameController.close();
  //   _emailController.close();
  //   _passController.close();
  //   _phoneController.close();
  // }

  _createUser(String userId, String name, String phone, Function onSuccess,
      Function(String) onRegisterError) {
    var user = Map<String, String>();
    user["name"] = name;
    user["phone"] = phone;

    
  }
}