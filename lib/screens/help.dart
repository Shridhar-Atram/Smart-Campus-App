// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './lostandfound.dart';

class help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
            child: Text('Lost And Found'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LostAndFound()));
            }),
      ),
    );
  }
}
