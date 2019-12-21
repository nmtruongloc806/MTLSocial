import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mtlsocialapp/widgets/signin/signin_background.dart';
import 'package:mtlsocialapp/widgets/signup/signup_bloc.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SignUpScreenState();
  }
}

class SignUpScreenState extends State<SignUpScreen> {
  SignUpBloc bloc = new SignUpBloc();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

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
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20, 175, 20, 0),
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
              child: Padding(
                padding: const EdgeInsets.all(10.0),
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
                              errorText:
                                  snapshot.hasError ? snapshot.error : null,
                              prefixIcon: Container(
                                child: Image.asset("ic_mail.png"),
                                width: 40,
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffCED0D2), width: 1),
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
                              errorText:
                                  snapshot.hasError ? snapshot.error : null,
                              prefixIcon: Container(
                                child: Image.asset("ic_mail.png"),
                                width: 40,
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffCED0D2), width: 1),
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
                              errorText:
                                  snapshot.hasError ? snapshot.error : null,
                              prefixIcon: Container(
                                child: Image.asset("ic_mail.png"),
                                width: 40,
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffCED0D2), width: 1),
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
                              errorText:
                                  snapshot.hasError ? snapshot.error : null,
                              prefixIcon: Container(
                                  child: Image.asset("ic_phone.png"),
                                  width: 40),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffCED0D2), width: 1),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
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
                            style: TextStyle(
                                color: Color(0xff606470), fontSize: 16),
                            children: <TextSpan>[
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pop(context);
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
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    bloc.dispose();
  }

  void _onClickSignIn() {
    var isValid = bloc.CheckValidSignUp(_nameController.text,
        _emailController.text, _passController.text, _phoneController.text);
    // if(isValid)
    // {
    //     LoadingDialog.showLoadingDialog(context, 'Loading...');
    //     bloc.signUp(_emailController.text, _passController.text,
    //       _phoneController.text, _nameController.text, () {
    //     LoadingDialog.hideLoadingDialog(context);
    //     Navigator.push(
    //         context, MaterialPageRoute(builder: (context) => HomeScreen()));
    //   }, (msg) {
    //     LoadingDialog.hideLoadingDialog(context);
    //     MsgDialog.showMsgDialog(context, "Sign-Up", msg);
    //     // show msg dialog
    //   });
    // }

    // if (bloc.CheckValidSignIn(_nameController.text, _phoneController.text,
    //     _emailController.text, _passController.text)) {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => HomeScreen()));
    // }
  }
}
