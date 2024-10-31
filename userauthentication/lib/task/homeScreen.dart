import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/style.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  int TabIndex = 0;

  onItemTapped(int index){
    setState(() {
      TabIndex = index;
    });
  }



  final widgetOptions = [
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: widgetOptions.elementAt(TabIndex),
      bottomNavigationBar:  appBottomNav(TabIndex, onItemTapped),
    );
  }
}



BottomNavigationBar appBottomNav(currentIndex,onItemTapped){
  return BottomNavigationBar(
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.list_alt),
        label: "New",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.access_time_rounded),
        label: "Progress",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.check_circle_rounded),
        label: "Completed",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.cancel_rounded),
        label: "Cancel",
      ),

    ],

    selectedItemColor: colorGreen,

    unselectedItemColor: colorLightGray,

    currentIndex: currentIndex,

    // to see the selected & unselected label context
    showSelectedLabels: true,
    showUnselectedLabels: true,


    onTap: onItemTapped,
    //to not move after tapping on nav icon
    type: BottomNavigationBarType.fixed,
  );
}
