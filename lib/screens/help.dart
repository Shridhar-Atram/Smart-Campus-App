// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './lostandfound.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'forum.dart';

class help extends StatelessWidget {
 // final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Help')),
      body: Center(
      child: 
      Container(
        margin:EdgeInsets.only(top:300),
        alignment:Alignment.center,
        child:
        Column(
        children: [
          Container(
            width:190,
            height:60,
             padding:EdgeInsets.fromLTRB(4, 5, 4, 5),
            child:
           ElevatedButton(
              child: Text('Forum',style:TextStyle(fontSize:20)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Chat()));
              }),
          ),
          SizedBox(height:20),
         Container(
           padding:EdgeInsets.fromLTRB(4, 5, 4, 5),
              width:200,
            height:60,
          child: ElevatedButton(
              child: Text('Lost And Found',style:TextStyle(fontSize:20)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LostAndFound()));
              }),)
         
        ],
      ),
    ))
    );
   
  }
}
