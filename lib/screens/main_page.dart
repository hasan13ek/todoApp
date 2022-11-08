import 'package:easy_localization/easy_localization.dart';
import 'package:first_lesson/Widgets/alertichidagiAll.dart';
import 'package:first_lesson/Widgets/almashuvchanRasm.dart';
import 'package:first_lesson/Widgets/getdate.dart';
import 'package:first_lesson/Widgets/nimadirochibkur.dart';
import 'package:first_lesson/Widgets/bottoms/yasamaFloatButton.dart';
import 'package:first_lesson/Widgets/update_task_widget.dart';
import 'package:first_lesson/database/local_database.dart';
import 'package:first_lesson/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:first_lesson/widgets/taskitem.dart';

import '../Widgets/bottoms/bottomNavBar.dart';
import '../Widgets/bottoms/button1.dart';
import '../Widgets/bottoms/button2.dart';
import '../Widgets/bottoms/button3.dart';
import '../utils/colors.dart';
import '../utils/images.dart';

int nimadir = -1;
bool isOn = false;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}
int countOfCompleted = 0;
int countOfUncompleted = 0;
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(AppImages.ic_menu1),
        ),
        backgroundColor: Colors.black,
        title: const Text("HomePage").tr(),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            searchTodo(),
            todayTodos(),
            completedTodos(),
          ],
        ),
      ),
      floatingActionButton: Stack(children: [
        yasamaFloatButton(),
        Positioned(
          bottom: 40,
          left: 165,
          child: GestureDetector(
            onTap: () {
              modalBottomsheetAddTask(context);
            },
            child: nimadirochibkur(),
          ),
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:const SizedBox(
        height: 80,
        child: bottomNavBar(),
      ),
    );
  }

   modalBottomsheetAddTask(context) {
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
            ).tr(),
            content: const alertichidagiAll(),
            actions: [
              const button1(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.024,
              ),
              const button2(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.04,
              ),
              const button3(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.04,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.04,
              ),
              IconButton(
                onPressed: () {
                  var newTodo = TodoModel(
                      title: title,
                      description: desc,
                      date:
                      "${GetDate.getdate.soat}  :  ${GetDate.getdate.minut}  ${GetDate.getdate.ap}",
                      priority: propirty,
                      isCompleted: zaybal,
                      hasan: 0);
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
  Widget searchTodo() {
    return Padding(
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
    );
  }

  Widget todayTodos() {
    return ExpansionTile(
      iconColor: Colors.white,
      title: Text(
        'Uncompleted'.tr(),
        style: TextStyle(color: Colors.white),
      ),
      children: [
        SingleChildScrollView(
          child: FutureBuilder(
            future: LocalDatabase.getTodosIsCompleted(0,title: search),
            builder: (BuildContext context,
                AsyncSnapshot<List<TodoModel>> snapshot) {
              if (snapshot.hasData) {
                countOfUncompleted = snapshot.data!.length;
                if (snapshot.data!.isEmpty) {
                  return const Center(
                      child: Icon(
                        Icons.file_copy_outlined,
                        color: Colors.white,
                        size: 96,
                      ));
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return TaskItem(
                      onCompleted: (todo) {
                        setState(() {
                          LocalDatabase.updateTaskById(
                            todo.copyWith(hasan: 1),
                          );
                        });
                      },
                      model: snapshot.data![index],
                      onDeleted: () {
                        setState(() {});
                      },
                      onSelected: () {
                        showModalBottomSheet(
                          backgroundColor: AppColors.C_363636,
                          context: context,
                          builder: (context) {
                            return UpdateTaskWidget(
                              todo: snapshot.data![index],
                              onUpdatedTask: () {
                                setState(() {});
                              },
                            );
                          },
                        );
                      },
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }

  Widget completedTodos() {
    return ExpansionTile(
      iconColor: Colors.white,
      title: Text(
        'Completed'.tr(),
        style: TextStyle(color: Colors.white),
      ),
      children: [
        FutureBuilder(
          future: LocalDatabase.getTodosIsCompleted(1, title: search),
          builder:
              (BuildContext context, AsyncSnapshot<List<TodoModel>> snapshot) {
            if (snapshot.hasData) {
              countOfCompleted = snapshot.data!.length;
              if (snapshot.data!.isEmpty) {
                return const Center(
                    child: Icon(
                      Icons.file_copy_outlined,
                      color: Colors.white,
                      size: 96,
                    ));
              }
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return TaskItem(
                    model: snapshot.data![index],
                    onCompleted: (todo) {
                      setState(() {
                        LocalDatabase.updateTaskById(
                          todo.copyWith(hasan: 0),
                        );
                      });
                    },
                    onDeleted: () {
                      setState(() {});
                    },
                    onSelected: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20))),
                              backgroundColor:const Color(0xff363636),
                              content: Container(
                                width: double.infinity,
                                height: 350,
                                child: UpdateTaskWidget(
                                    onUpdatedTask: () {
                                      setState(() {});
                                    },
                                    todo: snapshot.data![index]),
                              ),
                            );
                          });

                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ],
    );
  }

}