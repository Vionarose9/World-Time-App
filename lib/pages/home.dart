import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
        child: SafeArea(
            child: Column(
          children: <Widget>[
            TextButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/chooselocation');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'isDaytime': result['isDaytime'],
                    };
                  });
                },
                icon: Icon(Icons.edit_location),
                label: Text("Edit location")),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text(data['location'],
                  style: TextStyle(fontSize: 28, letterSpacing: 2.0)),
            ]),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text(data['time'],
                  style: TextStyle(fontSize: 40, letterSpacing: 2.0)),
            ])
          ],
        )),
      ),
    ));
  }
}
