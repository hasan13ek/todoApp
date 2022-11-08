import 'package:easy_localization/easy_localization.dart';
import 'package:first_lesson/service/storage_service.dart';
import 'package:first_lesson/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeModeItem extends StatefulWidget {
  const ThemeModeItem({Key? key}) : super(key: key);

  @override
  State<ThemeModeItem> createState() => _ThemeModeItemState();
}

class _ThemeModeItemState extends State<ThemeModeItem> {
  bool isLight = StorageService.getBool("isLight");

  @override
  Widget build(BuildContext context) {
    var themeChanger = Provider.of<ThemeProvider>(context);

    return InkWell(
      onTap: () {},
      child: Container(
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Switch(
              value: isLight,
              onChanged: (val) {
                setState(() {
                  isLight = !isLight;
                });
                themeChanger.setIsLight(isLight);
              },
            )
          ],
        ),
      ),
    );
  }
}