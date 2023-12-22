import 'package:flutter/material.dart';
import 'Uhome_app.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {

  final formKey = GlobalKey<FormState>();
  //String
  //String email='';
  @override

  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,

        child: Container(
          width: 360,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              fullName(),
              Container(margin: const EdgeInsets.only(top: 8.0)),
              emailField(),
              Container(margin: const EdgeInsets.only(top: 8.0)),
              passwordField(),
              Container(margin: const EdgeInsets.only(top: 6.0)),
              submitButton(),
            ],
          ),
        ),
      ),
    );
  }

  //Widget fullName(){}
  Widget fullName() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11.0),
          ),
          labelText: 'Enter Full Name',
        ),
        validator: (value) {
          //return null if valid
          //otherwise string(with the error message) if invalid
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        onSaved: (value){
          print(value);
        }

    );
  }

  Widget emailField() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration:InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11.0),
          ),
          labelText: 'Enter Email Address',
          hintText: 'you@example.com',
        ),
        validator: (value) {
          //return null if valid
          //otherwise string(with the error message) if invalid
          if (value == null || value.isEmpty||!value.contains('@')) {
            return 'Please enter a valid email';
          }
          return null;
        },
        onSaved: (value){
          print(value);
        }
    );
  }

  Widget passwordField() {
    return TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11.0),
            borderSide: const BorderSide(
              color: Colors.black,
            ),

          ),
          labelText: 'Enter Password',
          hintText: 'Pass123',
        ),
        validator: (value) {
          if (value!.length < 4) {
            return 'Password must be at least 4 characters';
          }
        },
        onSaved: (value){
          print(value);
        }
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      //child: Text('Submit!'),
      //onPressed: () {},

      onPressed: () {
        // Validate returns true if the form is valid, or false otherwise.
        if (formKey.currentState!.validate()) {
          // If the form is valid, display a snack-bar. In the real world,
          // you'd often call a server or save the information in a database.
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Processing Data')),
          );
          formKey.currentState!.save();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const App3(),));
        }

      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade200, // Background color
      ),
      child: const Text('Login', style: TextStyle(fontSize: 20,color: Colors.black),
      ),
    );
  }
}