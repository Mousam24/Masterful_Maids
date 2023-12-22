import 'package:flutter/material.dart';
import 'Wprofile_app.dart';

class Log2 extends StatefulWidget {
  const Log2({super.key});

  @override
  createState() {
    return Log2State();
  }
}

class Log2State extends State<Log2> {

  final formKey = GlobalKey<FormState>();
  //String
  //String email='';
  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Center(
          child: Container(
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Container(margin: EdgeInsets.only(top: 25.0)),
                fullName(),
                Container(margin: const EdgeInsets.only(top: 8.0)),
                id(),
                Container(margin: const EdgeInsets.only(top: 8.0)),
                phone(),
                Container(margin: const EdgeInsets.only(top: 8.0)),
                //exp(),
                //Container(margin: EdgeInsets.only(top: 25.0)),
                //address(),
                //Container(margin: EdgeInsets.only(top: 25.0)),
                passwordField(),
                Container(margin: const EdgeInsets.only(top: 15.0)),
                submitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Widget fullName(){}
  Widget fullName() {
    return TextFormField(
        keyboardType: TextInputType.name,
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
  Widget id() {
    return TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11.0),
          ),
          labelText: 'Enter a valid identity number',
        ),
        validator: (value) {
          //return null if valid
          //otherwise string(with the error message) if invalid
          if (value == null || value.isEmpty) {
            return 'Please enter a valid identity number';
          }
          return null;
        },
        onSaved: (value){
          print(value);
        }
    );
  }
  Widget exp() {
    return TextFormField(
        keyboardType: TextInputType.number,
        decoration:InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11.0),
          ),
          labelText: 'Enter your work experience',
        ),
        validator: (value) {
          //return null if valid
          //otherwise string(with the error message) if invalid
          if (value == null || value.isEmpty) {
            return 'Enter your experience';
          }
          return null;
        },
        onSaved: (value){
          print(value);
        }
    );
  }

  Widget phone() {
    return TextFormField(
        keyboardType: TextInputType.number,
        decoration:InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11.0),
          ),
          labelText: 'Enter your phone number',

        ),
        validator: (value) {
          //return null if valid
          //otherwise string(with the error message) if invalid
          if (value == null || value.isEmpty||value.length>10) {
            return 'Please enter a valid number';
          }
          return null;
        },
        onSaved: (value){
          print(value);
        }
    );
  }
  Widget address() {
    return TextFormField(
        keyboardType: TextInputType.multiline,
        decoration:InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11.0),
          ),
          labelText: 'Enter your address',
        ),
        validator: (value) {
          //return null if valid
          //otherwise string(with the error message) if invalid
          if (value == null || value.isEmpty) {
            return 'Please enter the address';
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
        decoration:InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11.0),
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
              const SnackBar(content: Text('Redirecting To Your Profile ')),

            );
            formKey.currentState!.save();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const App4(),));
          }

        }
        ,
        style: ElevatedButton.styleFrom(backgroundColor: Colors.white,),
        child: const Text('Submit',style: TextStyle(fontSize: 20),)
    );
  }
}
