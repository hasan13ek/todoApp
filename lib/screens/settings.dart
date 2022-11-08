import 'package:easy_localization/easy_localization.dart';
import 'package:first_lesson/Widgets/settings_widget.dart';
import 'package:first_lesson/screens/them_mode_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor:const Color(0xff171717),
        title: Text("Settings".tr(),style: TextStyle(color: Colors.white),),
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon:const Icon(Icons.arrow_back)),
      ),
      body: Container(
        padding:const EdgeInsets.only(left: 24,right: 24,top: 14),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color:const Color(0xff171717),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Settings".tr(),style: TextStyle(color: Colors.grey),),
            ListTile(
              onTap: (){},
              leading:const Icon(Icons.colorize,color: Colors.white,),
              trailing:const Icon(Icons.navigate_next,color: Colors.white,size: 30,),
              title: Text("Change App color".tr(),style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              onTap: (){},
              leading:const Text("T",style: TextStyle(color: Colors.white,fontSize: 30),),
              trailing:const Icon(Icons.navigate_next,color: Colors.white,size: 30,),
              title: Text("Change App typography".tr(),style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              onTap: (){
                showModalBottomSheet(backgroundColor: Colors.transparent,context: context, builder: (BuildContext context){
                  return const SettingsWidget();
                });
              },
              leading:const Icon(Icons.language,color: Colors.white,),
              trailing:const Icon(Icons.navigate_next,color: Colors.white,size: 30,),
              title: Text("Change App language".tr(),style: TextStyle(color: Colors.white),),
            ),
             Text("Import".tr(),style: TextStyle(color: Colors.grey),),
            ListTile(
              onTap: (){},
              leading:const Icon(Icons.install_desktop,color: Colors.white,),
              trailing:const Icon(Icons.navigate_next,color: Colors.white,size: 30,),
              title: Text("Import from Google calendar".tr(),style: TextStyle(color: Colors.white),),
            ),
             Text("color".tr(),style: TextStyle(color: Colors.grey),),
            const SizedBox(height: 20,),
            Row(
              children: [
                const SizedBox(width: 20,),
                const Icon(Icons.dark_mode,size: 30,),
                const SizedBox(width: 10,),
                Text("Change App Dark/Light".tr(),style: const TextStyle(fontSize: 18),),
                const SizedBox(width: 10,),
                const ThemeModeItem()
              ],
            )
          ],
        ),
      ),
    );
  }
}
