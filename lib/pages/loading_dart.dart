import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  void setr_up_worldtime() async {
    WorldTime instance =
        WorldTime(location: 'mumbai', flag: 'mumbai.png', url: 'Asia/Kolkata');
    await instance.get_time();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime':instance.isDayTime,
    });

    // print()
  }

  @override
  void initState() {
    super.initState();
    setr_up_worldtime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.black,
          size: 50.0,
        ),
      ),
    );
  }
}
