import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens/main_page.dart';

class textfield1 extends StatelessWidget {
  const textfield1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: 
      TextFormField(
        onChanged: (value){
          title = value;
        },
        style: const TextStyle(color: Colors.white70),
        decoration:  InputDecoration(
          hintText: 'Title'.tr(),
          focusColor: const Color(0xff868686),
          hintStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: Colors.transparent,
          border: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.white12, width: 2)),
          focusedBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.white12, width: 2)),
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}

