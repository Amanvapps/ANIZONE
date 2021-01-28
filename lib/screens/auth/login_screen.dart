import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutteramazonclone/screens/view/home_screen.dart';
import 'dart:ui' as ui;

import 'package:flutteramazonclone/screens/auth/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];
  bool isVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
    ));

    _focusNodes.forEach((node){
      node.addListener(() {
        setState(() {});
      });
    });

  }

  @override
  Widget build(BuildContext context) {
//
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//        statusBarColor: Colors.transparent
//    ));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CustomPaint(
                size: Size(500,250), //You can Replace this with your desired WIDTH and HEIGHT
                painter: RPSCustomPainter(),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 90 ,  right: 30),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue
                  ),
                  child: Image.asset("images/person.png" , fit: BoxFit.contain,),
                ),
              )
            ],
          ),
          SizedBox(height: 20,),
          Container(
            height: MediaQuery.of(context).size.height/1.7,
            child: ListView(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(' Welcome \n Back!' , style: TextStyle(color: Colors.white, fontSize: 30 , fontWeight: FontWeight.w600),)),
                usernameField(),
                passwordField(),
                forgotField(),
                bottomLayout()
              ],
            ),
          )
        ],
      ),
    );
  }

  usernameField()
  {
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.number,
        focusNode: _focusNodes[0],
        cursorColor: Color.fromARGB(255, 252, 141, 12),
        decoration: InputDecoration(
            labelText: "Phone",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
            ),
          labelStyle: TextStyle( color : Colors.white),
          contentPadding: const EdgeInsets.only(left: 20 , right: 20 , top: 20 , bottom: 20),
          fillColor: Color.fromARGB(255, 252, 141, 12),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide( color : Color.fromARGB(255, 252, 141, 12))
          ),
          suffixIcon: Icon(Icons.phone ,
            color: _focusNodes[0].hasFocus ? Color.fromARGB(255, 252, 141, 12) : Colors.white,
          )
        ),
      ),
      height: 60,
      margin: EdgeInsets.only(top: 50 , left: 20 , right: 20),
    );
  }

  passwordField(){
    return Container(
      child: TextFormField(
        obscureText: isVisible,
        focusNode: _focusNodes[1],
        cursorColor: Color.fromARGB(255, 252, 141, 12),
        decoration: InputDecoration(
            labelText: "Password",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
            ),
            labelStyle: TextStyle( color : Colors.white),
            contentPadding: const EdgeInsets.only(left: 20 , right: 20 , top: 20 , bottom: 20),
            fillColor: Color.fromARGB(255, 252, 141, 12),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide( color : Color.fromARGB(255, 252, 141, 12))
            ),
            suffixIcon: GestureDetector(
              onTap: (){
                isVisible = !isVisible;
                setState(() {
                });
              },
              child: Icon( (isVisible) ? Icons.visibility_off : Icons.visibility ,
                color: _focusNodes[1].hasFocus ? Color.fromARGB(255, 252, 141, 12) : Colors.white,
              ),
            )
        ),
      ),
      height: 60,
      margin: EdgeInsets.only(top: 40 , left: 20 , right: 20),
    );
  }

  forgotField(){
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.only(top: 20 , right: 25),
        child: Text('Forgot Password?' ,style: TextStyle(color: Color.fromARGB(255, 252, 141, 12)),),
      ),
    );
  }

  bottomLayout(){
    return Container(
      margin: EdgeInsets.only(left: 25 , right: 25 , top: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
              child: Text('Sign Up' ,style: TextStyle(fontSize: 17),)),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color:  Color.fromARGB(255, 252, 141, 12)
              ),
              child: Icon(Icons.arrow_right_alt_sharp , size: 50, color: Colors.white,),
            ),
          )
        ],
      ),
    );
  }



}


class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 252, 141, 12)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path_0 = Path();
    path_0.moveTo(0,size.height);
    path_0.lineTo(size.width,0);
    path_0.lineTo(size.width*0.03,0);
    path_0.lineTo(0,0);
    path_0.lineTo(size.width*0.19,size.height*0.12);
    path_0.lineTo(0,0);

    canvas.drawPath(path_0, paint_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

