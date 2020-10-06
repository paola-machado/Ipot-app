import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Ipot/screens/mainscreen.dart';

void main() async {
  // ignore: close_sinks
  //Socket sock = await Socket.connect('192.168.0.111', 80);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(new MyApp());
  });
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  /*Socket socket;

  MyApp(Socket s){
    this.socket = s;
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ipot',
      home: MainScreen(),
      //ArduinoScreen(channel: socket),
      debugShowCheckedModeBanner: false,
    );
  }
}
