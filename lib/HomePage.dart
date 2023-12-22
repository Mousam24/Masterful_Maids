import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  @override
  Widget build(context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          searchBar(),
          Column(
              children: [
                Container(
                  height:200,
                  width: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage('https://img.freepik.com/free-vector/plumber-repairing-pipe-burst-woman-phoning-service-stop-house-flooding_74855-14142.jpg?w=996&t=st=1703091526~exp=1703092126~hmac=0459cd51209f9034c46e2681de4d5a99647f8726e8053f2a00749963f4233a9e'),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
                Container(margin: const EdgeInsets.only(top: 5.0)),
                services(),
              ]
          ),
          bottomBar(),
        ],
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11.0)
          ),
          hintText: 'Search Bar..',
          suffixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
  Widget services()
  {
    return Container(
      height: 450,
      width: 400,
      child: ListView.separated(itemBuilder:(context,index){
        return  Column(
          children: [
            Card(

              child: ListTile(
                leading: FaIcon(FontAwesomeIcons.trash),
                title: Text('Cleaning'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){print('clicked');},

              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.electric_bolt),
                title: Text('Electrician'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){print('clicked');},
              ),
            ),
            Card(
              child: ListTile(
                leading: FaIcon(FontAwesomeIcons.droplet),
                title: Text('Plumber'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){print('clicked');},
              ),
            ),
            Card(
              child: ListTile(
                leading: FaIcon(FontAwesomeIcons.hammer),
                title: Text('Carpenter'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){print('clicked');},
              ),
            ),
            Card(
              child: ListTile(
                leading: FaIcon(FontAwesomeIcons.brush),
                title: Text('Painter'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){print('clicked');},
              ),
            ),
            Card(
              child: ListTile(
                leading: FaIcon(FontAwesomeIcons.leaf),
                title: Text('Gardener'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){print('clicked');},
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.laptop_chromebook),
                title: Text('Appliances Service'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){print('clicked');},
              ),
            ),
          ],
        );
      },
        itemCount: 1,
        separatorBuilder: (context,index) {
          return const Divider(height: 20, thickness: 1,);
        },
      ),
    );

  }
  /* Widget services() {
    return Container(
      height: 530,
      width: 400,
      child: GridView.count(crossAxisCount: 3,
        children: [
          Card(
              shadowColor:Colors.grey,
              child: Container(color: Colors.white24,)),
          Card(
              shadowColor:Colors.grey,
              child: Container(color: Colors.white24,)),
          Card(
              shadowColor:Colors.grey,
              child: Container(color: Colors.white24,)),
          Card(
              shadowColor:Colors.grey,
              child: Container(color: Colors.white24,)),
          Card(
              shadowColor:Colors.grey,
              child: Container(color: Colors.white24,)),
          Card(
              shadowColor:Colors.grey,
              child: Container(color: Colors.white24,)),
          Card(
              shadowColor:Colors.grey,
              child: Container(color: Colors.white24,)),
          Card(
              shadowColor:Colors.grey,
              child: Container(color: Colors.white24,)),
          Card(
              shadowColor:Colors.grey,
              child: Container(color: Colors.white24,)),
          Card(
              shadowColor:Colors.grey,
              child: Container(color: Colors.white24,)),
          Card(
              shadowColor:Colors.grey,
              child: Container(color: Colors.white24,)),
          Card(
              shadowColor:Colors.grey,
              child: Container(color: Colors.white24,)),
        ],
      ),
    );
  } */

  Widget bottomBar()
  {
    return BottomNavigationBar(
      iconSize: 35,
      selectedFontSize: 15,
      selectedItemColor: Colors.green,
      unselectedFontSize: 13,
      unselectedItemColor: Colors.black,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
          backgroundColor: Colors.yellow,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_rounded),
          label: 'Profile',
        ),],

    );
  }

}
