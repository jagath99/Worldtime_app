import 'package:http/http.dart';
import 'dart:convert';
import  'package:intl/intl.dart';

class worldtime {
  String location; // location name for the UI
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  String time; // time in that location
  bool isDaytime; // true or false if daytime or not

  worldtime({required this.location, required this.flag, required this.url,required this.time ,this.isDaytime=false});
  // END: abpxx6d04wxr

  // BEGIN: be15d9bcejpp
  Future<void> getData() async {

    try{
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    print(data);
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    print(offset);
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    now.hour >= 6 && now.hour < 20?isDaytime=true:isDaytime=false;
    print(now.hour);

    time = DateFormat.jm().format(now);
    }
    catch(e){
      time = 'could not get time data';
    }
    
  }
  // END: be15d9bcejpp
}



//worldtime instance = worldtime(location:'Barlin', flag: 'germany.png', url: 'Europe/Berlin');
