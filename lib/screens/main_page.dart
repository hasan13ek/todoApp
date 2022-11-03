import 'package:first_lesson/Widgets/alertichidagiAll.dart';
import 'package:first_lesson/Widgets/almashuvchanRasm.dart';
import 'package:first_lesson/Widgets/getdate.dart';
import 'package:first_lesson/Widgets/nimadirochibkur.dart';
import 'package:first_lesson/Widgets/soatlar/test1.dart';
import 'package:first_lesson/Widgets/soatlar/test2.dart';
import 'package:first_lesson/Widgets/soatlar/test3.dart';
import 'package:first_lesson/Widgets/bottoms/yasamaFloatButton.dart';
import 'package:first_lesson/database/local_database.dart';
import 'package:first_lesson/models/todo_model.dart';
import 'package:first_lesson/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:first_lesson/widgets/taskitem.dart';
import 'package:first_lesson/Widgets/getdate.dart';

import '../Widgets/bottoms/bottomNavBar.dart';
import '../Widgets/bottoms/button1.dart';
import '../Widgets/bottoms/button2.dart';
import '../Widgets/bottoms/button3.dart';
import '../Widgets/textfiedlAll/textfield1.dart';
import '../Widgets/textfiedlAll/textfield2.dart';
import '../utils/colors.dart';
import '../utils/images.dart';

int nimadir = -1;
bool isOn = false;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}
String search = "";
String title = "";
String desc = "";
String propirty = "";
int zaybal = 0;

class _MainPageState extends State<MainPage> {
  final FixedExtentScrollController _controller = FixedExtentScrollController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset("${AppImages.ic_menu1}"),
        ),
        backgroundColor: Colors.black,
        title: const Text("HomePage"),
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: const CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/300",
              ),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (val) {
                setState(() {
                  search = val;
                });
              },
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                filled: true,
                fillColor: AppColors.C_363636.withOpacity(0.5),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    )),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    )),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: LocalDatabase.getTaskByTitle(title: search),
              builder:
                  (BuildContext context, AsyncSnapshot<List<TodoModel>> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return
                     Center(
                      child:
                      almashuvchanRasm(),
                    );
                  }
                  return
                  ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return TaskItem(
                        model: snapshot.data?[index],
                        onDeleted: () {
                          setState(() {});
                        },
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return
                  Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Stack(children: [
        const yasamaFloatButton(),
        Positioned(
          bottom: 40,
          left: 165,
          child: InkWell(
            onTap: () {
              modalBottomsheetAddTask(context);
            },
            child: const nimadirochibkur(),
          ),
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SizedBox(
        height:  MediaQuery.of(context).size.height*0.080,
        child: const bottomNavBar(),
      ),
    );
  }

  Future modalBottomsheetAddTask(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            backgroundColor: const Color(0xff363636),
            title: const Text(
              "Add Task",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            content: const alertichidagiAll(),
            actions: [
              const button1(),
               SizedBox(
                width: MediaQuery.of(context).size.width*0.024,
              ),
              const button2(),
               SizedBox(
                width: MediaQuery.of(context).size.width*0.04,
              ),
              const button3(),
               SizedBox(
                width: MediaQuery.of(context).size.width*0.04,
              ),
               SizedBox(
                width: MediaQuery.of(context).size.width*0.04,
              ),
              IconButton(
                onPressed: () {
                  var newTodo = TodoModel(
                      title: title,
                      description: desc,
                      date: "${GetDate.getdate.soat}  :  ${GetDate.getdate.minut}  ${GetDate.getdate.ap}",
                      priority: propirty,
                      isCompleted: zaybal);
                  LocalDatabase.insertToDatabase(newTodo);
                  Navigator.pop(context);
                  setState(() {});
                },
                icon: Image.asset(
                  "assets/images/send.png",
                  scale: 2,
                ),
              ),
            ],
          );
        });
  }
}


