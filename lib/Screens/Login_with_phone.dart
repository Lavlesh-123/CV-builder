import 'package:flutter/material.dart';

class Number extends StatelessWidget {
  const Number({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobile number'),
      ),body: Container(
      color: Colors.blueGrey,
    ),
    );
  }
}
