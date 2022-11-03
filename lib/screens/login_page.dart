import 'package:first_lesson/screens/ha_chizing.dart';
import 'package:first_lesson/screens/main_page.dart';
import 'package:first_lesson/screens/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
final _formKey = GlobalKey<FormState>();
class _LoginPageState extends State<LoginPage> {
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
            padding: const EdgeInsets.only(left: 24,right: 24,top: 30),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            color: const Color(0xff121212),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Login",style: TextStyle(color: Colors.white,fontSize: 32),),
                const SizedBox(height: 42,),
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
                const SizedBox(height: 25,),
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
                const SizedBox(height: 42,),
                InkWell(
                  onTap: (){
                    if(_formKey.currentState!.validate()){
                      showModalBottomSheet(backgroundColor:const Color(0xff121212),context: context, builder: (BuildContext context){

                        return const HaCHizing();
                      });
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    height: MediaQuery.of(context).size.height*0.058,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color(0xff8875ff)
                    ),
                    child: const Center(child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 16),)),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.031,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 154,
                      height: 1,
                      color: const Color(0xff979797),
                    ),
                    const Text("or",style: TextStyle(color: Color(0xff979797),fontSize: 16),),
                    Container(
                      width: MediaQuery.of(context).size.width*0.4,
                      height: 1,
                      color: const Color(0xff979797),
                    )
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.032,),
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
                        const Text("Login with Google",style: TextStyle(color: Colors.white,fontSize: 16),),
                      ],
                    )),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.020,),
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
                        const Text("Login with Appe",style: TextStyle(color: Colors.white,fontSize: 16),),
                      ],
                    )),
                  ),
                ),
                const SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?",style: TextStyle(color: Color(0xff979797)),),
                    TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>const RegisterPage()));},child: const Text("Register",style: TextStyle(color: Colors.white),))
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
