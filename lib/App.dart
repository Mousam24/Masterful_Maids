import 'package:flutter/material.dart';
import 'LoginScreen.dart';
class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(context){
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('LOGIN',style: TextStyle(fontWeight:FontWeight.bold),)),
          backgroundColor: Colors.blue.shade200,
        ),
        body:const LoginScreen()
    );
  }
}