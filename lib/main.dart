import 'package:flutter/material.dart';
import 'package:messengerish/home.dart';
import 'chat.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        'chat': (ctx) => ChatScreen(),
      },
    );
  }
}
