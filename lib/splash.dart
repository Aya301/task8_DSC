import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
import 'date.dart';


class splash extends StatefulWidget {
  const splash({Key key}) : super(key: key);

  @override
  _splashState createState() => _splashState();
}
class _splashState extends State<splash> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 7),
            ()=> Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context)=> Time())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('image/image1.jpg',height: 150,width: 200,),
          SizedBox(height: 30,width: 60,),
          Padding(padding: EdgeInsets.only(top: 20)),
          Text('DateTime App',
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,
                color: Colors.white),),
          Padding(padding: EdgeInsets.only(top: 35)),
          SpinKitRipple(color: Colors.white,)
        ],
      ),
      backgroundColor: Colors.deepOrangeAccent,
    );
  }
}
