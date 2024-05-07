import 'package:flutter/material.dart';
import '/services/W_Time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> { // _HomeState is a private class
  
  void setupWtime() async{
    worldtime instance = worldtime(
      location: 'Barlin',
      flag: 'germany.png',
      url: 'Asia/Kolkata',
      time: '', // Add the required 'time' argument here
    );
    await instance.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });
  }  
  @override
  void initState() {
    super.initState();
    setupWtime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SpinKitWaveSpinner(
          color:Colors.blueGrey,
          size:50.0 ),
          )
    );
  }
}