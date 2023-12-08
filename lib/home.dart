import 'package:flutter/material.dart';
import 'package:restoraunt/Rooms.dart';
import 'package:restoraunt/addnewRoom.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentIndex = 0;
  // ignore: non_constant_identifier_names
  List<Widget> Screens = [
     RoomsScreen(),
    const AddNewRoom(),
  ];
  List<String> titles = [
    'rooms',
    'Add new room',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text(titles[currentIndex]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          backgroundColor: Colors.white,
          showUnselectedLabels: false,
          fixedColor: Colors.blue[400],
          onTap: (value) {
            print(value);
            setState(() {
              currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Rooms'),
            BottomNavigationBarItem(
                icon: Icon(Icons.check_circle_outline), label: 'AddNewroom'),
          ]),
      body: Screens[currentIndex],
    );
  }
}
