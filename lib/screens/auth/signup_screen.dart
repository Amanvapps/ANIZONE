import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];
  bool isVisible = false;
  bool isVisibleConfirm = false;

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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: ListView(
//        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CustomPaint(
                size: Size(500,200), //You can Replace this with your desired WIDTH and HEIGHT
                painter: RPSCustomPainter(),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 60 ,  right: 30),
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
          usernameField(),
          emailField(),
          nameField(),
          passwordField(),
          passwordReField(),
          bottomLayout()
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
      margin: EdgeInsets.only(top: 0 , left: 20 , right: 20),
    );
  }

  emailField()
  {
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        focusNode: _focusNodes[1],
        cursorColor: Color.fromARGB(255, 252, 141, 12),
        decoration: InputDecoration(
            labelText: "Email",
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
            suffixIcon: Icon(Icons.email ,
              color: _focusNodes[1].hasFocus ? Color.fromARGB(255, 252, 141, 12) : Colors.white,
            )
        ),
      ),
      height: 60,
      margin: EdgeInsets.only(top: 20 , left: 20 , right: 20),
    );
  }

  nameField()
  {
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        focusNode: _focusNodes[2],
        cursorColor: Color.fromARGB(255, 252, 141, 12),
        decoration: InputDecoration(
            labelText: "Name",
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
            suffixIcon: Icon(Icons.person ,
              color: _focusNodes[2].hasFocus ? Color.fromARGB(255, 252, 141, 12) : Colors.white,
            )
        ),
      ),
      height: 60,
      margin: EdgeInsets.only(top: 20 , left: 20 , right: 20),
    );
  }


  passwordField(){
    return Container(
      child: TextFormField(
        obscureText: isVisible,
        focusNode: _focusNodes[3],
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
                color: _focusNodes[3].hasFocus ? Color.fromARGB(255, 252, 141, 12) : Colors.white,
              ),
            )
        ),
      ),
      height: 60,
      margin: EdgeInsets.only(top: 20 , left: 20 , right: 20),
    );
  }

  passwordReField(){
    return Container(
      child: TextFormField(
        obscureText: isVisibleConfirm,
        focusNode: _focusNodes[4],
        cursorColor: Color.fromARGB(255, 252, 141, 12),
        decoration: InputDecoration(
            labelText: "Confirm Password",
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
                isVisibleConfirm = !isVisibleConfirm;
                setState(() {
                });
              },
              child: Icon( (isVisibleConfirm) ? Icons.visibility_off : Icons.visibility ,
                color: _focusNodes[4].hasFocus ? Color.fromARGB(255, 252, 141, 12) : Colors.white,
              ),
            )
        ),
      ),
      height: 60,
      margin: EdgeInsets.only(top: 20 , left: 20 , right: 20),
    );
  }

  bottomLayout(){
    return Container(
      margin: EdgeInsets.only(left: 25 , right: 25 , top: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            width: 220,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color:  Color.fromARGB(255, 252, 141, 12)
            ),
            child: Text('Register' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w500),),
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

