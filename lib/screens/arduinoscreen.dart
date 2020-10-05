import 'package:Ipot/screens/plantsearch.dart';
import 'package:flutter/material.dart';

class ArduinoScreen extends StatefulWidget {
  @override
  _ArduinoScreenState createState() => _ArduinoScreenState();
}

class _ArduinoScreenState extends State<ArduinoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF32A060),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        padding: EdgeInsets.only(
          left: 30.0,
          right: 30.0,
          top: 60.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.play_circle_fill_rounded),
                    color: Colors.green,
                    iconSize: 50.0,
                    onPressed: () {
                    },
                  ),
                  Text(
                    'Ligar Bomba',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.pause_circle_filled_rounded),
                    color: Colors.green,
                    iconSize: 50.0,
                    onPressed: () {
                    },
                  ),
                  Text(
                    'Desligar Bomba',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
