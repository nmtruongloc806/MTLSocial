import 'package:flutter/material.dart';
import 'package:mtlsocialapp/widgets/home/home_screen.dart';
import 'package:mtlsocialapp/widgets/signin/signin_bloc.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignInState();
}

class SignInState extends State<SignIn> {
  bool _isShowPass = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  SignInBloc signInBloc = new SignInBloc();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(15),
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xffd8d8d8)),
              padding: EdgeInsets.all(15),
              child: FlutterLogo(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 40),
              child: Text(
                "Welcome\nMTLSocial",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 36),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: StreamBuilder(
                  stream: signInBloc.userStream,
                  builder: (context, snapshot) => TextField(
                        controller: _userController,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                            labelText: "Username",
                            errorText: snapshot.hasError ? snapshot.error : null,
                            labelStyle: TextStyle(
                                color: Colors.grey[600], fontSize: 14)),
                      )),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  StreamBuilder(
                      stream: signInBloc.passStream,
                      builder: (context, snapshot) => TextField(
                            controller: _passController,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                            obscureText: _isShowPass,
                            decoration: InputDecoration(
                                labelText: "Password",
                                errorText: snapshot.hasError ? snapshot.error : null,
                                labelStyle: TextStyle(
                                    color: Colors.grey[600], fontSize: 14)),
                          )),
                  GestureDetector(
                    onTap: _onToggelShowPass,
                    child: Text(
                      _isShowPass ? "SHOW" : "HIDE",
                      style: TextStyle(fontSize: 14, color: Colors.blueAccent),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
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
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'NEW USER?',
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: ' SIGN UP',
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
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onToggelShowPass() {
    setState(() {
      _isShowPass = !_isShowPass;
    });
  }

  void _onSignInClicked() {
    final String textUser = _userController.text;
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
    if(signInBloc.isValidInfo(textUser, textPass))
    {
       Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }
}
