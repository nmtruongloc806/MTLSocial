import 'package:flutter/material.dart';

class SignInBackground extends StatelessWidget {
  final screenHeight;

  const SignInBackground({Key key, @required this.screenHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: <Widget>[
        ClipPath(
          clipper: BottomShapeClipper(),
          child: Container(
            height: screenHeight * 0.5,
            color: themeData.primaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Color(0xffd8d8d8)),
            padding: EdgeInsets.all(10),
            child: FlutterLogo(),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Text(
            "MTLSocial",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 36),
          ),
        )
      ],
    );
  }
}

class BottomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset curveStartPoint = Offset(0, size.height * 0.85);
    Offset curveEndPoint = Offset(size.width, size.height * 0.85);
    path.lineTo(curveStartPoint.dx, curveStartPoint.dy);
    path.quadraticBezierTo(
        size.width / 2, size.height, curveEndPoint.dx, curveEndPoint.dy);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
