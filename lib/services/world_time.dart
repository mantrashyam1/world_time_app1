import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location; //location name for UI
  late String time; // time in that location
  late String flag; //url to an assert flag icon
  late String url; //location url api endpoint
  late bool isDayTime; //true or false if daytime or not

  WorldTime(
      {required this.location,
      required this.flag,
      required this.url}); //location url

  Future<void> get_time() async {
    try {
      //make the request
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map datec = jsonDecode(response.body);

      //get properties from data
      String datetime = datec['datetime'];
      String offset = datec['utc_offset'].substring(1, 3);
      String offset2 = datec['utc_offset'].substring(4, 6);

      //create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now
          .add(Duration(hours: int.parse(offset), minutes: int.parse(offset2)));

      //set time property
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error : $e');
      time = 'could not get time data';
    }

    // Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Kolkata'));
    // Map datec = jsonDecode(response.body);
    // print(datec);
    // String datetime = datec['datetime'];
    // String offset = datec['utc_offset'].substring(1,3);
    // String offset2 = datec['utc_offset'].substring(4,6);
    //
    // print(datetime);
    // print(offset2);
    //
    // DateTime now = DateTime.parse(datetime);
    // now = now.add(Duration(hours: int.parse(offset) , minutes: int.parse(offset2) ));
    // print(now);

    // Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    //
    // Map datec = jsonDecode(response.body);
    // print(datec);
    // print(datec['title ']);

    // //simulate network request for username
    // String usernmae = await Future.delayed(
    //   const Duration(seconds: 3),
    //       () {
    //     return ' delayed';
    //   },
    // );
    //
    // await Future.delayed(
    //   const Duration(seconds: 2),
    //       () {
    //     print(' delayed 2');
    //   },
    // );
  }
}
