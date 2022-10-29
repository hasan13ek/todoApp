import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class button2 extends StatelessWidget {
  const button2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Image.asset(
        "assets/images/marker.png",
        scale: 2,
      ),
    );
  }
}

