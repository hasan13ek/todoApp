import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/colors.dart';
import '../utils/images.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset("${AppImages.ic_menu1}"),
        ),
        backgroundColor: Colors.black,
        title: const Text("HomePage"),
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: const CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/300",
              ),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
      floatingActionButton: Stack(
          children: [
            Positioned(
              bottom: 34,
              left: 155.9,
              child: Container(
                width: 90,
                height: 45.5,
                decoration: const BoxDecoration(color: Color(0xff121212),borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(76, 80),bottomRight: Radius.elliptical(76, 80))),
              ),
            ),
        Positioned(
          bottom: 40,
          left: 165,
          child: Container(
              height: 72,
              width: 72,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.C_8687E7,
              ),
              child: const Center(
                child: Text(
                  "+",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              )),
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          iconSize: 28,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.50),
          backgroundColor: AppColors.C_363636,
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
              icon: Icon(null),
              label: '',
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
        ),
      ),
    );
  }
}
