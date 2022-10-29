import 'package:first_lesson/Widgets/textfield1.dart';
import 'package:first_lesson/Widgets/textfield2.dart';
import 'package:flutter/cupertino.dart';

class alertichidagiAll extends StatelessWidget {
  const alertichidagiAll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textfield1(),
          const SizedBox(
            height: 12,
          ),
          textfield2(),
        ],
      ),
    );
  }
}

