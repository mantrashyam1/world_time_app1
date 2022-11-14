import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

Map data = {};

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map ;
    debugPrint('movieTitle: $data');

    //set background
    String bgImage = data['isDayTime'] ? 'day_image.jpg' : 'night_image.jpg';
    Color? bgcolor = data['isDayTime'] ? Color(0xFF3E6376) : Color(0xFF030214);

    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: const Icon(Icons.edit_location),
                  label: const Text('Edit location'),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style:
                          const TextStyle(fontSize: 28.0, letterSpacing: 2.0),
                    )
                  ],
                ),
                const SizedBox(height: 22.0),
                Text(
                  data['time'],
                  style: const TextStyle(
                    fontSize: 66.0,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
