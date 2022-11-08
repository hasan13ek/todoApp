import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

int selectedLang = 1;
bool isDark = false;

class _SettingsWidgetState extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    switch (context.locale.languageCode) {
      case 'uz':
        selectedLang = 1;
        break;
      case 'en':
        selectedLang = 2;
        break;
      case 'ru':
        selectedLang = 3;
        break;
      default:
    }
    return
      Container(
      padding: const EdgeInsets.all(24),
      height: 340,
      decoration:const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: Color(0xff272727),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Theme'.tr(),
            style:const TextStyle(color: Colors.white),

          ),
       const   SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 26),
            child: Row(
              children: [
                Text(
                  'Night mode'.tr(),
                  style: const TextStyle(color: Colors.white),


                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Change the language'.tr(),
            style: const TextStyle(color: Colors.white),

          ),
          const SizedBox(height: 12),
          RadioListTile(
            title: const Text(
              "O'zbekcha",
              style: TextStyle(color: Colors.white),
            ),
            value: 1,
            groupValue: selectedLang,
            onChanged: ((value) {
              setState(
                    () {
                  selectedLang = value as int;
                  context.setLocale(const Locale('uz', 'UZ'));
                },
              );
            }),
          ),
          RadioListTile(
            title: const Text(
              "English",
              style: TextStyle(color: Colors.white),

            ),
            value: 2,
            groupValue: selectedLang,
            onChanged: ((value) {
              setState(
                    () {
                  selectedLang = value as int;
                  context.setLocale(const Locale('en', 'US'));
                },
              );
            }),
          ),
          RadioListTile(
            title: const Text(
              "Russian",
              style: TextStyle(color: Colors.white),

            ),
            value: 3,
            groupValue: selectedLang,
            onChanged: ((value) {
              setState(
                    () {
                  selectedLang = value as int;
                  context.setLocale(const Locale('ru', 'RU'));
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}