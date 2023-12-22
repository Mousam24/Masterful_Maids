import 'package:flutter/material.dart';
import 'HomePage.dart';
class App3 extends StatelessWidget{
  const App3({super.key});

  @override
  Widget build(context){
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('HOME PAGE',style: TextStyle(fontWeight:FontWeight.bold),)),
          backgroundColor: Colors.blue.shade200,
        ),
        body:const HomePage()
    );
  }
}