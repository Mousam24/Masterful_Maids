import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class profile_page extends StatefulWidget {
  const profile_page({super.key});

  @override
  createState() {
    return profile_pageState();
  }
}

class profile_pageState extends State<profile_page> {
  final formKey = GlobalKey<FormState>();
  late PickedFile _imageFile;
  final _picker =ImagePicker();
  String dropdownValue = 'Gender';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: ...,
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child:ListView(
                children:<Widget> [
                  imageProfile(),
                  DropdownButton<String>(



                    value: dropdownValue,
                    // Step 4.
                    items: <String>['Gender','Male','Female','Others']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(fontSize: 18),
                        ),
                      );
                    }).toList(),
                    // Step 5.
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  service(),
                  Container(margin: const EdgeInsets.only(top: 15.0)),
                  address(),
                  Container(margin: const EdgeInsets.only(top: 15.0)),
                  submitButton(),
                ]

            )
        )
    );
  }
  Widget imageProfile(){
    return Center(
      child: Stack(
          children: <Widget>[
            const CircleAvatar(
                radius: 80.0,
                // ignore: unnecessary_null_comparison
                //ERROR ERROR ERROR
                backgroundImage: NetworkImage('https://blogtimenow.com/wp-content/uploads/2014/06/hide-facebook-profile-picture-notification.jpg')

            ),
            Positioned(
                bottom: 20.0,
                right: 20.0,
                child: InkWell(
                  onTap: () {
                    showBottomSheet(
                      context: context,
                      builder: ((builder)=> bottomSheet()),
                    );
                  },

                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.blue,
                    size: 28.0,
                  ),
                )

            )
          ]
      ),
    );
  }
  Widget bottomSheet(){
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal:20,
        vertical: 20,
      ),
      child: Column(children: <Widget>[
        const Text(
          "Choose Profile Photo",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        const SizedBox(
          height: 20,

        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                icon : const Icon(Icons.camera),
                onPressed: (){
                  takePhoto(ImageSource.camera);

                },
                label: const Text("Camera"),
              ),
              TextButton.icon(
                icon : const Icon(Icons.image),
                onPressed: (){
                  takePhoto(ImageSource.gallery);

                },
                label: const Text("Gallery"),
              ),
            ]
        )

      ],
      ),
    );
  }

  void takePhoto(ImageSource source) async{
    var pickedFile = await _picker.pickImage(
      source: source ,
    );
    setState(() {
      _imageFile=pickedFile as PickedFile;
    });
  }
  Widget service() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2,
            )),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.blueGrey,
        ),
        labelText: "Type of Service you want to offer",
        hintText: "Electrician,plumber,etc",
      ),
    );
  }
  Widget address() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: 2,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2,
            )),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.blueGrey,
        ),
        labelText: "Enter your address",
      ),
    );
  }
  Widget submitButton() {
    return ElevatedButton(
      //child: Text('Submit!'),
      //onPressed: () {},

      onPressed: () {
        // Validate returns true if the form is valid, or false otherwise.
        if (formKey.currentState!.validate()) {
          // If the form is valid, display a snackbar. In the real world,
          // you'd often call a server or save the information in a database.
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Thank you for registering')),
          );
          formKey.currentState!.save();
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // Background color
      ),
      child: const Text(
        'Submit',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
// Step 2.

}