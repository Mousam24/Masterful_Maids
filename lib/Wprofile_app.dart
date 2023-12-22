import 'package:flutter/material.dart';

import 'WProfile.dart';
class App4 extends StatelessWidget{
  const App4({super.key});

  @override
  Widget build(context){

    return Scaffold(
      appBar: AppBar(
        title:const Center(child: Text('YOUR PROFILE',style: TextStyle(fontWeight:FontWeight.bold),)),
        backgroundColor: Colors.blue.shade200,

      ),

      body: const profile_page(),
    );
  }
}