import 'dart:async';

import 'package:ecommerce_flutter/pages/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(MaterialApp(
    home: SplashScreen()
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Timer _timer;
  int _start = 5;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_start < 1) {
            timer.cancel();
            Future.delayed(const Duration(milliseconds: 500), () {
              return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
            });
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment(2.2, 0.0),
                colors: [
                  Colors.grey.withOpacity(0.1),
                  Colors.orangeAccent,
                ],
                tileMode: TileMode.repeated,
              ),
            ),

          ),
          Positioned(
            top: 40,
            left: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("E-commerce",
                  style: TextStyle(fontSize: 26, color: Colors.black54,),),
                SizedBox(height: 10,),
                Text("Your No.1 app for buying and selling",
                  style: TextStyle(fontSize: 18, color: Colors.black87,),),
              ],
            ),
          ),
          Positioned(
            left: -20,
            right: -30,
            top: 100,
            bottom: 80,
            child: Container(
                alignment: Alignment.center,
                child: Image.asset("images/fashion.png")
            ),
          ),
          Visibility(
            visible: _start < 1 ? true : false,
            child: Container(
              padding: EdgeInsets.only(bottom: 20),
              alignment: Alignment.bottomCenter,
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(
                    Color.fromRGBO(58, 55, 86, 1.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}