import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test3 extends StatefulWidget {
  @override
  _TestState3 createState() {
    return _TestState3();
  }
}

class _TestState3 extends State<Test3> {

  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      Text("AM",style: TextStyle(color: Colors.white),),
      Text("PM",style: TextStyle(color: Colors.white)),

    ];

    return  Center(
        child: ListWheelScrollView(
          itemExtent: 36,
          children: items,
          magnification: 2,
          useMagnifier: false,
          physics: BouncingScrollPhysics(),
          diameterRatio: 1,
          squeeze:1,
          onSelectedItemChanged: (index) => {
            setState(() {
              _selectedItemIndex = index;
            })
          },
        )
    );
  }
}