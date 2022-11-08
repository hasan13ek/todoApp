import 'package:easy_localization/easy_localization.dart';
import 'package:first_lesson/Widgets/nimadirochibkur.dart';
import 'package:first_lesson/screens/profile_page.dart';
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
            if(index==4){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>ProfilePage()));
            }
          });
        },
        iconSize: 28,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.50),
        backgroundColor: const Color(0xff363636),
        type: BottomNavigationBarType.fixed,
        items:  [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_filled),
            label: 'Index'.tr(),
          ),
           BottomNavigationBarItem(
            icon: const Icon(Icons.calendar_month),
            label: 'Calendar'.tr(),
          ),
           BottomNavigationBarItem(
            icon: const Icon(
                null
            ),
            label: 'Add'.tr(),
          ),
           BottomNavigationBarItem(
            icon: const Icon(Icons.watch_later_outlined),
            label: 'Focus'.tr(),
          ),
           BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            label: 'Profile'.tr(),
          ),
        ],
      );
  }
}