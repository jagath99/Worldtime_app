import 'package:flutter/material.dart';
import 'package:worldtime/services/w_Time.dart';

class Choose extends StatefulWidget {
  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> { // _HomeState is a private class
  
  int counter = 0;

  List<worldtime> Locations = [
    worldtime(location: 'Barlin', flag: 'germany.png', url: 'Europe/Berlin',time:''),
    worldtime(location: 'London', flag: 'uk.png', url: 'Europe/London',time:''),
    worldtime(location: 'Athens', flag: 'greece.png', url: 'Europe/Athens',time:''),
    worldtime(location: 'Cairo', flag: 'egypt.png', url: 'Africa/Cairo',time:''),
    worldtime(location: 'Nairobi', flag: 'kenya.png', url: 'Africa/Nairobi',time:''),
    worldtime(location: 'Chicago', flag: 'usa.png', url: 'America/Chicago',time:''),
    worldtime(location: 'New York', flag: 'usa.png', url: 'America/New_York',time:''),
    worldtime(location: 'Seoul', flag: 'south_korea.png', url: 'Asia/Seoul',time:''),
    worldtime(location: 'Jakarta', flag: 'indonesia.png', url: 'Asia/Jakarta',time:''),
  ];

  void setupWTime(index) async{
    worldtime instance = Locations[index];
    await instance.getData();
    //navigate to home screen
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
        
                ),
                body: ListView.builder(
                  itemCount: Locations.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          setupWTime(index);
                         
                        },
                        title: Text(Locations[index].location),
                      ),
                    );
                  },
                ),
              );
            }          }

