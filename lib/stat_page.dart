
import 'package:flutter/material.dart';

class StatPage extends StatefulWidget {
  @override
  _StatPageState createState() => _StatPageState();
}

class _StatPageState extends State<StatPage> {
  Future<void> computeFuture = Future.value();

  @override
  Widget build(BuildContext context) {
    return Center(
     child: Column(children: [Image(image: AssetImage('images/dice-light-2.png'),color: Colors.blue,)],),  
    );
  }
}