import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> { // _HomeState is a private class
  Map data = {};
 
 

  @override
  Widget build(BuildContext context) {
    Map data =  ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
      
    return Scaffold(

      body: SafeArea(
        child:Container(
          
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
         
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () async {
                dynamic result= await Navigator.pushNamed(context, '/choose');
                setState(() {
                  data={
                    'time':result['time'],
                    'location':result['location'],
                    'flag':result['flag'],
                    'isDaytime':result['isDaytime'],
                  };
                });
              },
              icon: Icon(Icons.edit_location),
              label: Text('Edit Location'),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(data['location'], style: TextStyle(fontSize: 28.0, letterSpacing: 2.0),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(data['time'], style: TextStyle(fontSize: 66.0, letterSpacing: 2.0),),
            ],),
          ],
      ),
    )
    )
    );
  }
}
