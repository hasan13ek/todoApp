
import 'package:easy_localization/easy_localization.dart';
import 'package:first_lesson/screens/settings.dart';
import 'package:first_lesson/service/storage_service.dart';
import 'package:first_lesson/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';
import 'register_page.dart';

class ProfilePage extends StatefulWidget {
   ProfilePage({Key? key}) : super(key: key);

  @override

  State<ProfilePage> createState() => _ProfilePageState();
}
    String accountName = "";
class _ProfilePageState extends State<ProfilePage> {
  void initState() {
    super.initState();
    accountName = StorageService.getString("accountName");
  }
  @override
  Widget build(BuildContext context) {
    var isLight = context.watch<ThemeProvider>().getIsLight();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: isLight? Colors.white: Color(0xff171717),
        centerTitle: true,
        title:  Text(
          "Profile".tr(),
          style: TextStyle(color: isLight? Colors.black:Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 24, right: 24),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          color: const Color(0xff171717),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 140),
                child: Container(
                  width: 85,
                  height: 85,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://xsgames.co/randomusers/avatar.php?g=male"),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 140),
                child: Text( "${accountName1}",
                    style:  TextStyle(
                        color:isLight?Colors.black:Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 154,
                    height: 58,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: const Color(0xff272727)),
                    child: const Center(
                        child: Text(
                      "10 Task left",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
                  ),
                  Container(
                    width: 154,
                    height: 58,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: const Color(0xff272727)),
                    child: const Center(
                        child: Text(
                      "10 Task left",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
                  )
                ],
              ),
              const SizedBox(
                height: 32,
              ),
               Text(
                "Settings".tr(),
                style:const TextStyle(color: Colors.grey),
              ),
              Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.settings_sharp,
                      color: Colors.white,
                    ),
                    trailing: const Icon(
                      Icons.navigate_next_rounded,
                      color: Colors.white,
                      size: 34,
                    ),
                    title:  Text(
                      "App Settings".tr(),
                      style:const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const Settings()));
                    },
                    tileColor: Colors.grey,
                  ),
                ],
              ),
               Text(
                "Account".tr(),
                style: const TextStyle(color: Colors.grey),
              ),
              Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.perm_identity_outlined,
                      color: Colors.white,
                    ),
                    trailing: const Icon(
                      Icons.navigate_next_rounded,
                      color: Colors.white,
                      size: 34,
                    ),
                    title:  Text(
                      "Change account name".tr(),
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: const Color(0xff272727),
                              title: Column(
                                children: [
                                   Text(
                                    "Change account name".tr(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 2,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              content: Container(
                                width: double.infinity,
                                height: 180,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      decoration: const InputDecoration(
                                          filled: true,
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white))
                                      ),
                                      onChanged: (val){
                                        accountName1 = val;
                                      },
                                      initialValue: accountName1,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          child: Container(
                                            width: 104,
                                            height: 48,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: Colors.transparent,
                                            ),
                                            child:  Center(
                                                child: Text(
                                              "Cancel".tr(),
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                          ),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        GestureDetector(
                                          child: Container(
                                            width: 124,
                                            height: 48,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: const Color(0xff5956e9),
                                            ),
                                            child: const Center(
                                                child: Text(
                                              "Edit",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                          ),
                                          onTap: () {
                                            StorageService.saveString("accountName", accountName);
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    tileColor: Colors.grey,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.key,
                      color: Colors.white,
                    ),
                    trailing: const Icon(
                      Icons.navigate_next_rounded,
                      color: Colors.white,
                      size: 34,
                    ),
                    title:  Text(
                      "Change password".tr(),
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onTap: () {},
                    tileColor: Colors.grey,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    ),
                    trailing: const Icon(
                      Icons.navigate_next_rounded,
                      color: Colors.white,
                      size: 34,
                    ),
                    title:  Text(
                      "Change account Image".tr(),
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onTap: () {},
                    tileColor: Colors.grey,
                  ),
                ],
              ),
               Text(
                "Uptodo".tr(),
                style: TextStyle(color: Colors.grey),
              ),
              Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.perm_identity_outlined,
                      color: Colors.white,
                    ),
                    trailing: const Icon(
                      Icons.navigate_next_rounded,
                      color: Colors.white,
                      size: 34,
                    ),
                    title:  Text(
                      "About US".tr(),
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onTap: () {},
                    tileColor: Colors.grey,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.local_attraction_outlined,
                      color: Colors.white,
                    ),
                    trailing: const Icon(
                      Icons.navigate_next_rounded,
                      color: Colors.white,
                      size: 34,
                    ),
                    title:  Text(
                      "FAQ".tr(),
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onTap: () {},
                    tileColor: Colors.grey,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.wb_twighlight,
                      color: Colors.white,
                    ),
                    trailing: const Icon(
                      Icons.navigate_next_rounded,
                      color: Colors.white,
                      size: 34,
                    ),
                    title:  Text(
                      "Help & Feedback".tr(),
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onTap: () {},
                    tileColor: Colors.grey,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.filter_none_sharp,
                      color: Colors.white,
                    ),
                    trailing: const Icon(
                      Icons.navigate_next_rounded,
                      color: Colors.white,
                      size: 34,
                    ),
                    title:  Text(
                      "Support Us".tr(),
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onTap: () {},
                    tileColor: Colors.grey,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.logout_rounded,
                      color: Colors.red,
                    ),
                    title:  Text(
                      "Log out".tr(),
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                    onTap: () {},
                    tileColor: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
