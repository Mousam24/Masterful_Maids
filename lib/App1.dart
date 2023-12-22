import 'package:flutter/material.dart';

import 'LoginScreen1.dart';
//import 'package:login_stateful/src/screens/login_screen.dart';
//import 'screens/log2_screen.dart';
class App2 extends StatelessWidget{
  const App2({super.key});

  @override
  Widget build(context){
    return Scaffold(
      appBar: AppBar(
        title:const Center(child: Text('REGISTRATION FORM',style: TextStyle(fontWeight:FontWeight.bold),)),
        backgroundColor: Colors.blue.shade200,

      ),

      body: const Log2(),
    );
  }
}