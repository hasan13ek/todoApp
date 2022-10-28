import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:numberpicker/numberpicker.dart';

import '../utils/colors.dart';
import '../utils/images.dart';
bool isOn= false;
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}
int _currentValue = 01;

int _currentValue1 = 01;


class _MainPageState extends State<MainPage> {
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
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(
              height: 75,
            ),
            Image.asset(
              "assets/images/img_1.png",
              scale: 2,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "What do you want to do today?",
              style: TextStyle(color: Color(0xff868686), fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Tap + to add your tasks",
              style: TextStyle(color: Color(0xff868686), fontSize: 16),
            )
          ],
        ),
      ),
      floatingActionButton: Stack(children: [
        Positioned(
          bottom: 34,
          left: 155.9,
          child: Container(
            width: 90,
            height: 45.5,
            decoration: const BoxDecoration(
                color: Color(0xff121212),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(76, 80),
                    bottomRight: Radius.elliptical(76, 80))),
          ),
        ),
        Positioned(
          bottom: 40,
          left: 165,
          child: InkWell(
            onTap: () {
              modalBottomsheetAddTask(context);
            },
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

  Future modalBottomsheetAddTask(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            backgroundColor: Color(0xff363636),
            title: Text(
              "Add Task",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            content: Container(
              width: 400,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white70),
                      decoration: InputDecoration(
                        hintText: 'writing',
                        focusColor: Color(0xff868686),
                        hintStyle: TextStyle(color: Colors.white70),
                        filled: true,
                        fillColor: Colors.transparent,
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white12, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white12, width: 2)),
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white70),
                      decoration: InputDecoration(
                        hintText: 'Description',
                        hintStyle: TextStyle(color: Colors.white38),
                        filled: true,
                        fillColor: Colors.transparent,
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white12, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white12, width: 2)),
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext contex) {
                        return AlertDialog(
                          backgroundColor: Color(0xff363636),
                          content:
                          Row(
                            children: [
                              InkWell(
                                child: Container(
                                  width: 123,
                                  height: 48,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Colors.transparent),
                                  child: Center(
                                      child: TextButton(
                                          onPressed: null,
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                                color: Color(0xff8577ff),
                                                fontSize: 16),
                                          ))),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              InkWell(
                                child: Container(
                                  width: 123,
                                  height: 48,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Color(0xff8577ff)),
                                  child: Center(
                                      child: Text(
                                    "Choose Time",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  )),
                                ),
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext contex) {
                                        return SizedBox(
                                          width: 320,
                                          height: 150,
                                          child: AlertDialog(
                                            backgroundColor: Color(0xff363636),
                                            title: Column(
                                              children: [
                                                Text(
                                                  "Choose time",
                                                  style: TextStyle(
                                                      color: Colors.white38,
                                                      fontSize: 16),
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Container(
                                                  width: 300,
                                                  height: 2,
                                                  color: Colors.white24,
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                            Column(
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                  Container(
                                                    child: NumberPicker(
                                                      haptics: false,
                                                      value: _currentValue,
                                                      minValue: 0,
                                                      maxValue: 12,
                                                      onChanged: (value) => setState(() => _currentValue = value),
                                                    ),
                                                    width: 64,
                                                    height: 64,
                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),                                                    color: Color(0xff272727),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: NumberPicker(
                                                      value: _currentValue1,
                                                      haptics: true,
                                                      step: 60,
                                                      minValue: 0,
                                                      maxValue: 60,
                                                      onChanged: (value) => setState(() => _currentValue1 = value),
                                                    ),
                                                    width: 64,
                                                    height: 64,
                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),                                                    color: Color(0xff272727),
                                                    ),
                                                  ),
                                                    Container(
                                                      child:Center(child: Text("AM",style: TextStyle(color: Colors.white70),)),
                                                      width: 64,
                                                      height: 64,
                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),                                                      color: Color(0xff272727),
                                                      ),
                                                    ),

                                                  ],)

                                              ],
                                            ),
                                                SizedBox(height: 21,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      child: Container(
                                                        width: 123,
                                                        height: 48,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(4),
                                                            color: Colors.transparent),
                                                        child: Center(
                                                            child: TextButton(
                                                                onPressed: null,
                                                                child: Text(
                                                                  "Cancel",
                                                                  style: TextStyle(
                                                                      color: Color(0xff8577ff),
                                                                      fontSize: 16),
                                                                ))),
                                                      ),
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                    InkWell(
                                                      child: Container(
                                                        width: 123,
                                                        height: 48,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(4),
                                                            color: Color(0xff8577ff)),
                                                        child: Center(
                                                            child: Text(
                                                              "Save",
                                                              style: TextStyle(
                                                                  color: Colors.white, fontSize: 16),
                                                            )),
                                                      ),
                                                      onTap: () {},
                                                    ),
                                                  ],
                                                ),

                                            ],
                                            ),
                                            // content: ,
                                          ),
                                        );
                                      });
                                },
                              ),
                            ],
                          ),
                        );
                      });
                  showDatePicker(
                    context: context,
                    initialDate: DateTime(2022),
                    firstDate: DateTime(2022),
                    lastDate: DateTime(2022),
                  );
                },
                icon: Image.asset(
                  "assets/images/timer.png",
                  scale: 2,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/marker.png",
                  scale: 2,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  showDialog(context: context, builder: (BuildContext context){
                    return SizedBox(
                      width: 350,
                      height: 350,
                      child: AlertDialog(
                        backgroundColor: Color(0xff363636),
                        title: Column(children: [
                          Text("Task priority",style: TextStyle(color: Colors.white),),
                          SizedBox(height: 6,),
                          Container(width: 340,height: 2,color: Colors.grey,)
                        ],),
                        content: Stack(
                          children: [
                            Container(
                              width: 360,
                              height: 270,
                              // color: Colors.transparent,
                              child: GridView.builder(itemCount: 10,shrinkWrap: true,scrollDirection: Axis.vertical,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), itemBuilder: (BuildContext contex,int index){
                                return InkWell(
                                  onTap: (){
                                    setState(() {
                                      isOn=!isOn;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 4,top: 4,right: 4),
                                    width: 64,
                                    height: 64,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),color: isOn?Color(0xff8875ff):Color(0xff272727)),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 6),
                                        child: Image.asset("assets/images/flag.png",scale: 2,),
                                      ),
                                      SizedBox(height: 6,),
                                      Text("${index+1}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),)
                                    ],
                                  ),
                                  ),

                                );
                              }),
                            ),
                            Positioned(
                              bottom: 4,
                              right: 10,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    child: Container(
                                      width: 123,
                                      height: 48,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color: Colors.transparent),
                                      child: Center(
                                          child: TextButton(
                                              onPressed: null,
                                              child: Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    color: Color(0xff8577ff),
                                                    fontSize: 16),
                                              ))),
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  SizedBox(width: 30,),
                                  InkWell(
                                    child: Container(
                                      width: 123,
                                      height: 48,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color: Color(0xff8577ff)),
                                      child: Center(
                                          child: Text(
                                            "Save",
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 16),
                                          )),
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
                },
                icon: Image.asset(
                  "assets/images/flag.png",
                  scale: 2,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 18,
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/send.png",
                  scale: 2,
                ),
              ),
            ],
          );
        });
  }
}
