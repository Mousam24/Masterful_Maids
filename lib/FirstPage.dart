import 'package:flutter/material.dart';
import 'App.dart';
import 'App1.dart';
class FirstPage extends StatelessWidget{
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,

      ),
      body:Container(
        height:double.infinity,
        width:double.infinity,
        color: Colors.blue.shade300,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child:const Text('Register as Worker'),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const App2(),),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Register as User'),
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const App(),),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}