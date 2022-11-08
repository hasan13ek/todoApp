import 'package:first_lesson/screens/main_page.dart';
import 'package:first_lesson/screens/onboading_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLog = false;

  Future<bool> isLoggedIn()async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    isLog = _pref.getBool("isLoggedIn")??false;
    return _pref.getBool("isLoggedIn")??false;
  }
  @override
  void initState() {
    super.initState();
    isLoggedIn();
    goNext();
  }
  void goNext(){
    Future.delayed(Duration(seconds: 3)).then((value){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
        return isLog ? MainPage():OnboadingPage();
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          color: Color(0xff121212),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset("assets/images/homepit.png")),
              SizedBox(height: 18.0,),
              Image.asset("assets/images/img.png",scale: 1.5,)
            ],
          ),
        ),
      ),
    );
  }
}