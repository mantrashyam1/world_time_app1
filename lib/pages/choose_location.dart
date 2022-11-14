import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class Choose_location extends StatefulWidget {
  const Choose_location({Key? key}) : super(key: key);

  @override
  _Choose_locationState createState() => _Choose_locationState();
}

class _Choose_locationState extends State<Choose_location> {
  int counter = 0;

  List<WorldTime> location = [
    WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
    WorldTime(location: 'Athens', flag: 'greece.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Cairo', flag: 'egypt.png', url: 'Africa/Cairo'),
    WorldTime(location: 'Nairobi', flag: 'kenya.png', url: 'Africa/Nairobi'),
    WorldTime(location: 'Chicago', flag: 'usa.png', url: 'America/Chicago'),
    WorldTime(location: 'New York', flag: 'usa.png', url: 'America/New_york'),
    WorldTime(location: 'Seoul', flag: 'south_korea.png', url: 'Asia/Seoul'),
    WorldTime(location: 'Jakarta', flag: 'indonesia.png', url: 'Asia/Jakarta'),
  ];

  void updateTime (index) async{

    WorldTime instance = location[index];
    await instance.get_time();

    //navigate to home page
    Navigator.pop(context,{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime':instance.isDayTime,
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical:1.0,horizontal: 4.0 ),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(location[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('images/${location[index].flag}'),
                ),
              ),
            ),
          );
        },
        itemCount: location.length,
      ),
    );
  }
}
