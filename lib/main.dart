import 'package:converter/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/firstScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  runApp(const MainClass());
}

class MainClass extends StatelessWidget {
  const MainClass({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          splashColor: shadowColor,
          scaffoldBackgroundColor: lightRed,
          appBarTheme: AppBarTheme(backgroundColor: lightRed)),
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}
