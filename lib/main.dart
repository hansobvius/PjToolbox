import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/principal_page.dart';

void main() {
  runApp(
    PjToolBox(),
  );
}

class PjToolBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          primaryColor: Colors.blueGrey[100],
          scaffoldBackgroundColor: Colors.blueGrey[100],
          canvasColor: Colors.blueGrey[100]),
      home: PrincipalPage(),
    );
  }
}
