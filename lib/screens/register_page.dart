
import 'package:first_lesson/screens/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ha_chizing.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _LoginPageState();
}
final _formKey = GlobalKey<FormState>();
class _LoginPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xff121212),
          leading: const Icon(Icons.arrow_back_ios,color: Color(0xff868686),),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 24,right: 24,top: 10),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            color: const Color(0xff121212),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Register",style: TextStyle(color: Colors.white,fontSize: 32),),
                SizedBox(height: MediaQuery.of(context).size.height*0.022,),
                Text("Username",style: TextStyle(color: Colors.white.withOpacity(0.8),fontSize: 16),),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter Username";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white12,
                        focusColor: Color(0xff868686),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white10, width: 1.3),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          borderSide: BorderSide(color: Colors.white10, width: 1.3),
                        ),
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Color(0xff868686))
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                Text("Password",style: TextStyle(color: Colors.white.withOpacity(0.8),fontSize: 16),),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter Password";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white12,
                        focusColor: Color(0xff868686),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white10, width: 1.3),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          borderSide: BorderSide(color: Colors.white10, width: 1.3),
                        ),
                        labelText: '. . . . . . . . . . . .',
                        labelStyle: TextStyle(color: Color(0xff868686),fontSize: 40,fontWeight: FontWeight.w700)
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                Text("Confirm Password",style: TextStyle(color: Colors.white.withOpacity(0.8),fontSize: 16),),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter Confirm Password";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white12,
                        focusColor: Color(0xff868686),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white10, width: 1.3),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          borderSide: BorderSide(color: Colors.white10, width: 1.3),
                        ),
                        labelText: '. . . . . . . . . . . .',
                        labelStyle: TextStyle(color: Color(0xff868686),fontSize: 40,fontWeight: FontWeight.w700)
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.032,),
                InkWell(
                  onTap: (){
                    if(_formKey.currentState!.validate()){
                      saveLogin(context);
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const HaCHizing()), (route) => false);

                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    height: MediaQuery.of(context).size.height*0.058,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color(0xff8875ff)
                    ),
                    child: const Center(child: Text("Register",style: TextStyle(color: Colors.white,fontSize: 16),)),
                  ),
                ),
                const SizedBox(height: 21,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.4,
                      height: 1,
                      color: const Color(0xff979797),
                    ),
                    const Text("or",style: TextStyle(color: Color(0xff979797),fontSize: 16),),
                    Container(
                      width: 154,
                      height: 1,
                      color: const Color(0xff979797),
                    )
                  ],
                ),
                const SizedBox(height: 20.0,),
                InkWell(
                  onTap: (){},
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    height: MediaQuery.of(context).size.height*0.058,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: const Color(0xff8875ff)),
                      borderRadius: BorderRadius.circular(4),
                      color: const Color(0xff121212),
                    ),
                    child: Center(child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/go.png",scale: 2,),
                        const SizedBox(width: 10,),
                        const Text("Register with Google",style: TextStyle(color: Colors.white,fontSize: 16),),
                      ],
                    )),
                  ),
                ),
                const SizedBox(height: 20,),
                InkWell(
                  onTap: (){},
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    height: MediaQuery.of(context).size.height*0.058,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: const Color(0xff8875ff)),
                      borderRadius: BorderRadius.circular(4),
                      color: const Color(0xff121212),
                    ),
                    child: Center(child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/apple.png",scale: 2,),
                        const SizedBox(width: 10,),
                        const Text("Register with Appe",style: TextStyle(color: Colors.white,fontSize: 16),),
                      ],
                    )),
                  ),
                ),
                const SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?",style: TextStyle(color: Color(0xff979797)),),
                    TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>const LoginPage()));},child: const Text("Login",style: TextStyle(color: Colors.white),))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void saveLogin(context)async{
  SharedPreferences _pref = await SharedPreferences.getInstance();
  _pref.setBool("isLoggedIn", true);

  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
}
