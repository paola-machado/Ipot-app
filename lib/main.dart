import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Ipot/screens/mainscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ipot',
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

