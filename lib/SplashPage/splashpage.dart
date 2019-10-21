import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          
          image: DecorationImage(image: AssetImage('assets/images/SplashPage.jpg'))

          
        ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DownTime();
  }


  void DownTime(){
    
    // 延时任务
    var _duration = Duration(seconds: 3);

    new Future.delayed(_duration,goHome);

  }

  void goHome(){

    Navigator.of(context).pushReplacementNamed('/Mainpage');  


  } 
  
}