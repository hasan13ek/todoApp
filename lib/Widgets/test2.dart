import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test2 extends StatefulWidget {
  @override
  _TestState2 createState() {
    return _TestState2();
  }
}


class _TestState2 extends State<Test2> {

  int _selectedItemIndex1 = 0;

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
      Text("13",style: TextStyle(color: Colors.white),),
      Text("14",style: TextStyle(color: Colors.white)),
      Text("15",style: TextStyle(color: Colors.white)),
      Text("16",style: TextStyle(color: Colors.white)),
      Text("17",style: TextStyle(color: Colors.white)),
      Text("18",style: TextStyle(color: Colors.white)),
      Text("19",style: TextStyle(color: Colors.white)),
      Text("20",style: TextStyle(color: Colors.white)),
      Text("21",style: TextStyle(color: Colors.white)),
      Text("22",style: TextStyle(color: Colors.white)),
      Text("23",style: TextStyle(color: Colors.white)),
      Text("24",style: TextStyle(color: Colors.white)),
      Text("25",style: TextStyle(color: Colors.white),),
      Text("26",style: TextStyle(color: Colors.white)),
      Text("27",style: TextStyle(color: Colors.white)),
      Text("28",style: TextStyle(color: Colors.white)),
      Text("29",style: TextStyle(color: Colors.white)),
      Text("30",style: TextStyle(color: Colors.white)),
      Text("31",style: TextStyle(color: Colors.white)),
      Text("32",style: TextStyle(color: Colors.white)),
      Text("33",style: TextStyle(color: Colors.white)),
      Text("34",style: TextStyle(color: Colors.white)),
      Text("35",style: TextStyle(color: Colors.white)),
      Text("36",style: TextStyle(color: Colors.white)),
      Text("37",style: TextStyle(color: Colors.white),),
      Text("38",style: TextStyle(color: Colors.white)),
      Text("39",style: TextStyle(color: Colors.white)),
      Text("30",style: TextStyle(color: Colors.white)),
      Text("41",style: TextStyle(color: Colors.white)),
      Text("42",style: TextStyle(color: Colors.white)),
      Text("43",style: TextStyle(color: Colors.white)),
      Text("44",style: TextStyle(color: Colors.white)),
      Text("45",style: TextStyle(color: Colors.white)),
      Text("46",style: TextStyle(color: Colors.white)),
      Text("47",style: TextStyle(color: Colors.white)),
      Text("48",style: TextStyle(color: Colors.white)),
      Text("49",style: TextStyle(color: Colors.white),),
      Text("50",style: TextStyle(color: Colors.white)),
      Text("51",style: TextStyle(color: Colors.white)),
      Text("52",style: TextStyle(color: Colors.white)),
      Text("53",style: TextStyle(color: Colors.white)),
      Text("53",style: TextStyle(color: Colors.white)),
      Text("55",style: TextStyle(color: Colors.white)),
      Text("56",style: TextStyle(color: Colors.white)),
      Text("57",style: TextStyle(color: Colors.white)),
      Text("58",style: TextStyle(color: Colors.white)),
      Text("59",style: TextStyle(color: Colors.white)),
      Text("00",style: TextStyle(color: Colors.white)),

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
              _selectedItemIndex1 = index;
            })
          },
        )
    );
  }
}