import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mtlsocialapp/widgets/home/home_screen.dart';
import 'package:mtlsocialapp/widgets/signin/signin_background.dart';
import 'package:mtlsocialapp/widgets/signin/signin_bloc.dart';
import 'package:mtlsocialapp/widgets/signup/signup_screen.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignInState();
}

class SignInState extends State<SignIn> {
  bool _isShowPass = false;
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  TextEditingController _emailSignInController = new TextEditingController();
  TextEditingController _passSignInController = new TextEditingController();
  bool _isInIt = false;

  SignInBloc bloc = new SignInBloc();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: <Widget>[
          SignInBackground(
            screenHeight: 700,
          ),
          _replaceWidget(true),
        ],
      ),
    );
  }

  Widget _replaceWidget(isShowSignIn) {
    print("_replaceWidget: " + isShowSignIn.toString());
    if (_isInIt) {
      setState(() {
        if (isShowSignIn) {
          return _renderSignIn();
        } else {
          return _renderSignUp();
        }
      });
    }
    _isInIt = true;
    return _renderSignIn();
  }

  Widget _renderSignIn() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 175, 20, 0),
      child: Container(
        height: 340,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 20), blurRadius: 20),
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, -10),
                  blurRadius: 10),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "SIGN IN",
                style: TextStyle(
                    fontSize: 34,
                    letterSpacing: .6,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: StreamBuilder(
                  stream: bloc.emailStream,
                  builder: (context, snapshot) => TextField(
                    controller: _emailSignInController,
                    decoration: InputDecoration(
                        labelText: "Email",
                        errorText: snapshot.hasError ? snapshot.error : null,
                        prefixIcon: Container(
                          child: Image.asset("ic_mail.png"),
                          width: 40,
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffCED0D2), width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(6)))),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: StreamBuilder(
                  stream: bloc.passStream,
                  builder: (context, snapshot) => TextField(
                    controller: _passSignInController,
                    decoration: InputDecoration(
                        labelText: "Password",
                        errorText: snapshot.hasError ? snapshot.error : null,
                        prefixIcon: Container(
                            child: Image.asset("ic_phone.png"), width: 40),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffCED0D2), width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(6)))),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 25),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: _onSignInClicked,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'NEW USER? ',
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                _replaceWidget(false);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             SignUpScreen()));
                              },
                            text: 'SIGN UP',
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.w500)),
                      ]),
                    ),
                    Text(
                      "FORGOT PASSWORD",
                      style: TextStyle(color: Colors.blueAccent),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderSignUp() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 175, 20, 0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 440,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 20),
                    blurRadius: 20),
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, -10),
                    blurRadius: 10),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "SIGN UP",
                style: TextStyle(
                    fontSize: 34,
                    letterSpacing: .6,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: StreamBuilder(
                  stream: bloc.nameStream,
                  builder: (context, snapshot) => TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        labelText: "Name",
                        errorText: snapshot.hasError ? snapshot.error : null,
                        prefixIcon: Container(
                          child: Image.asset("ic_mail.png"),
                          width: 40,
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffCED0D2), width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(6)))),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: StreamBuilder(
                  stream: bloc.phoneStream,
                  builder: (context, snapshot) => TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                        labelText: "Phone",
                        errorText: snapshot.hasError ? snapshot.error : null,
                        prefixIcon: Container(
                          child: Image.asset("ic_mail.png"),
                          width: 40,
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffCED0D2), width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(6)))),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: StreamBuilder(
                  stream: bloc.emailStream,
                  builder: (context, snapshot) => TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        labelText: "Email",
                        errorText: snapshot.hasError ? snapshot.error : null,
                        prefixIcon: Container(
                          child: Image.asset("ic_mail.png"),
                          width: 40,
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffCED0D2), width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(6)))),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: StreamBuilder(
                  stream: bloc.passStream,
                  builder: (context, snapshot) => TextField(
                    controller: _passController,
                    decoration: InputDecoration(
                        labelText: "Password",
                        errorText: snapshot.hasError ? snapshot.error : null,
                        prefixIcon: Container(
                            child: Image.asset("ic_phone.png"), width: 40),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffCED0D2), width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(6)))),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 15),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: null,
                    //onPressed: _onSignInClicked,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: RichText(
                  text: TextSpan(
                      text: "Already a User? ",
                      style: TextStyle(color: Color(0xff606470), fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                //Navigator.pop(context);
                                _replaceWidget(true);
                              },
                            text: "Login now",
                            style: TextStyle(
                                color: Color(0xff3277D8), fontSize: 16))
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    print("da vao dispose");
    bloc.dispose();
  }

  void _onToggelShowPass() {
    setState(() {
      _isShowPass = !_isShowPass;
    });
  }

  void _onSignInClicked() {
    final String textUser = _emailController.text;
    final String textPass = _passController.text;
    // 2 cách làm
    // cách 1: setState để cập nhật ui
    // setState(() {
    //   if (textUser.length <= 6) {
    //     _userNameInvalid = true;
    //   } else {
    //     _userNameInvalid = false;
    //   }

    //   if (textPass.length <= 6) {
    //     _passworInvalid = true;
    //   } else {
    //     _passworInvalid = false;
    //   }

    //   if (!_userNameInvalid && !_passworInvalid) {
    //     Navigator.push(
    //         context, MaterialPageRoute(builder: (context) => HomeScreen()));
    //   }
    // });
    //
    //cách 2: stream
    if (bloc.CheckValidSignIn(textUser, textPass)) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }
}
