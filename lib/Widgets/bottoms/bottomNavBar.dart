import 'package:first_lesson/Widgets/nimadirochibkur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_lesson/screens/main_page.dart';

class bottomNavBar extends StatefulWidget {
  const bottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<bottomNavBar> createState() => _bottomNavBarState();
}

int _selectedIndex = 0;

class _bottomNavBarState extends State<bottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return
      BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      iconSize: 28,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(0.50),
      backgroundColor: Color(0xff363636),
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Index',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: Icon(
           null
          ),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.watch_later_outlined),
          label: 'Focus',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}
