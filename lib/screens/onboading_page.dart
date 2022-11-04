import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:first_lesson/screens/login_page.dart';
import 'package:first_lesson/screens/start_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/models.dart';

String nima = "GET STARTED";

class OnboadingPage extends StatefulWidget {
  const OnboadingPage({Key? key}) : super(key: key);

  @override
  State<OnboadingPage> createState() => _OnboadingPageState();
}

int Imageindicator = 0;

class _OnboadingPageState extends State<OnboadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff121212),
        leading: Center(
            child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>StartScreenPage()));
                },
                child: const Text(
                  "SKIP",
                  style: TextStyle(color: Color(0xff868686), fontSize: 16),
                ))),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          color: const Color(0xff121212),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*5,
                child: ExpandablePageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      Imageindicator = index;

                    });
                  },
                  itemBuilder: (context, int index) {
                    return Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height*0.4,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "${PageviewModel.Postlaruchun[0].rasm[Imageindicator]}"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          "${PageviewModel.Postlaruchun[0].bodyWords[Imageindicator]}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height:42,
                        ),
                        Text(
                          "${PageviewModel.Postlaruchun[0].bodyPasi[Imageindicator]}",
                          style:
                              const TextStyle(color: Color(0xff999999), fontSize: 16),
                        ),
                      ],
                    );
                  },
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Positioned(
                  top: 300, right: 130, child: postIndicator(Imageindicator)),
              Positioned(
                right: 25.0,
                top: 620,
                child: InkWell(
                  onTap: () {
                    if (Imageindicator == 2) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const StartScreenPage()));
                    }else if(Imageindicator!=2){
                      setState(() {
                        Imageindicator++;

                      });
                    }
                  },
                  child: Container(
                    width: Imageindicator == 2 ? MediaQuery.of(context).size.width*0.38 : MediaQuery.of(context).size.height*0.09,
                    height: MediaQuery.of(context).size.height*0.048,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color(0xff8875FF)),
                    child: Center(
                        child: Text(
                      "${Imageindicator == 2 ? nima : "NEXT"}",
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    )),
                  ),
                ),
              ),
              Positioned(
                  left: 24,
                  top: 622,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          Imageindicator--;
                        });
                      },
                      child: const Text(
                        'BACK',
                        style: TextStyle(color: Color(0xff868686), fontSize: 16),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}

Widget postIndicator(int currentIndex) {
  return Container(
    margin: const EdgeInsets.only(right: 24),
    height: 5,
    child: ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 1,
          width: 26,
          decoration: BoxDecoration(
            // shape: BoxShape.circle,
            borderRadius: BorderRadius.circular(16),
            color: currentIndex == index
                ? Colors.white
                : const Color(0xff868686).withOpacity(0.4),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 8);
      },
    ),
  );
}
