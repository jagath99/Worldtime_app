import 'package:flutter/material.dart';
import 'package:worldtime/pages/loading%20.dart';
import '/pages/home.dart';
import '/pages/choose.dart';

Future<void> main() async{
runApp(MaterialApp(
  initialRoute:'/',
  routes:{
    '/':(context)=>Loading(),
    '/home':(context)=>Home(),
    '/choose':(context)=>Choose(),

    },

));


}