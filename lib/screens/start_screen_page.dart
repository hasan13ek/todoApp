import 'package:first_lesson/screens/login_page.dart';
import 'package:first_lesson/screens/register_page.dart';
import 'package:flutter/material.dart';

class StartScreenPage extends StatefulWidget {
  const StartScreenPage({Key? key}) : super(key: key);

  @override
  State<StartScreenPage> createState() => _StartScreenPageState();
}

class _StartScreenPageState extends State<StartScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff121212),
        leading: IconButton(onPressed:(){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios,color: Color(0xff868686),)),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: Color(0xff121212),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.058,),
            Text("Welcome to UpTodo",style: TextStyle(color: Colors.white,fontSize: 32),),
            SizedBox(height: MediaQuery.of(context).size.height* 0.026,),
            Text("Please login to your account or create\n              new account to continue",style: TextStyle(color: Color(0xff868686),fontSize: 16),),
            SizedBox(height:MediaQuery.of(context).size.height* 0.5,),
            InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginPage()));},
              child: Container(
                width: MediaQuery.of(context).size.width*0.8,
                height: MediaQuery.of(context).size.height * 0.058,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xff8875ff)
                ),
                child: Center(child: Text("LOGIN",style: TextStyle(color: Colors.white,fontSize: 16),)),
              ),
            ),
            SizedBox(height: 28.0,),
            InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>RegisterPage()));},
              child: Container(
                width: MediaQuery.of(context).size.width*0.8,
                height: MediaQuery.of(context).size.height * 0.058,
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Color(0xff8875ff)),
                    borderRadius: BorderRadius.circular(4),
                    color: Color(0xff121212),
                ),
                child: Center(child: Text("CREATE ACCOUNT",style: TextStyle(color: Colors.white,fontSize: 16),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
