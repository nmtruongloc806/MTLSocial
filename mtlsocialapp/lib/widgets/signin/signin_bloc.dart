
import 'dart:async';

import 'package:mtlsocialapp/utils/validations.dart';

class SignInBloc{
  StreamController _userController = new StreamController<String>();
  StreamController _passController = new StreamController();

  Stream get userStream => _userController.stream.transform(_streamTransformer);
  Stream get passStream => _passController.stream;

  var _streamTransformer = 
    StreamTransformer<String,String>.fromHandlers(handleData: (data , sink){
      data += "MTL";
      sink.addError(data);
  });

  bool isValidInfo(String userName,String password){
    if(!Validations.isValidUserName(userName))
    {
      _userController.sink.addError("Invalid Username");
      return false;
    }

    _userController.sink.add("OK");

    if(!Validations.isValidPassword(password))
    {
      _passController.sink.addError("Invalid Password");
      return false;
    }
    _passController.sink.add("OK");
    return true;
  }

  void dispose(){
    _userController.close();
    _passController.close();
  }
}