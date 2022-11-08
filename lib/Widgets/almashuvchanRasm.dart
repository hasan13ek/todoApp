import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class almashuvchanRasm extends StatelessWidget {
  const almashuvchanRasm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Image.asset(
            "assets/images/img_1.png",
            scale: 2,
          ),
          const SizedBox(
            height: 10,
          ),
           Text(
            "What do you want to do today?".tr(),
            style:
              const  TextStyle(color: Color(0xff868686), fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
           Text(
            "Tap + to add your tasks".tr(),
            style:
              const  TextStyle(color: Color(0xff868686), fontSize: 16),
          ),
        ],
      ),
    );
  }
}
