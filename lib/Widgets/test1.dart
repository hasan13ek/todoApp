import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() {
    return _TestState();
  }
}

class _TestState extends State<Test> {

  int _selectedItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      Text("1",style: TextStyle(color: Colors.white),),
      Text("2",style: TextStyle(color: Colors.white)),
      Text("3",style: TextStyle(color: Colors.white)),
      Text("4",style: TextStyle(color: Colors.white)),
      Text("5",style: TextStyle(color: Colors.white)),
      Text("6",style: TextStyle(color: Colors.white)),
      Text("7",style: TextStyle(color: Colors.white)),
      Text("8",style: TextStyle(color: Colors.white)),
      Text("9",style: TextStyle(color: Colors.white)),
      Text("10",style: TextStyle(color: Colors.white)),
      Text("11",style: TextStyle(color: Colors.white)),
      Text("12",style: TextStyle(color: Colors.white)),
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

              print(_selectedItemIndex);



            })
          },
        )
    );
  }
}