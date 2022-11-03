import 'package:first_lesson/database/local_database.dart';
import 'package:first_lesson/models/imgModels.dart';
import 'package:first_lesson/models/todo_model.dart';
import 'package:first_lesson/screens/main_page.dart';
import 'package:first_lesson/utils/colors.dart';
import 'package:flutter/material.dart';
bool isOn = false;
class TaskItem extends StatefulWidget {
  TodoModel? model;
  final VoidCallback onDeleted;

  TaskItem({
    Key? key,
    required this.model,
    required this.onDeleted,
  }) : super(key: key);

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 80,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),color: Color(0xff363636)),
      padding:const EdgeInsets.only(top: 2,left: 8,right: 8),
      margin:const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(border: Border.all(width: 1.6,color: Colors.white),borderRadius: BorderRadius.circular(50),color: isOn?Color(0xff8687e7):Colors.transparent),
            child: InkWell(
              onTap: () {
                setState(() {
                  isOn=!isOn;
                });
                showDialog(
                  context: context,
                  builder: (context) {
                    return
                      AlertDialog(
                        backgroundColor: Color(0xff121212),
                        shape:const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        title:const Text("Delete",style: TextStyle(color: Colors.white),),
                        content: Text(
                          "Are you sure to delete task ${widget.model?.title}",
                        style: TextStyle(color: Colors.white),),
                        actions: [
                          TextButton(
                            onPressed: () {
                              setState((){
                                isOn=false;
                              });
                              Navigator.pop(context);
                            },
                            child:const Text("NO"),
                          ),
                          TextButton(
                            onPressed: () async {
                              var res = await LocalDatabase.deleteTaskById(
                                  widget.model!.id!);

                              if (res != 0) {
                                setState((){
                                  isOn=false;
                                });
                                Navigator.pop(context);
                                widget.onDeleted();
                              }
                            },
                            child:const Text("YES"),
                          ),
                        ],
                      );
                  },
                );
              },
            ),
          ),
          const SizedBox(width: 12,),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  const SizedBox(height: 8,),

                  Text(
                    widget.model?.title.toString() ?? "No title",
                    style:const TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w400),
                  ),
                 const SizedBox(height: 16,),
                  Text(
                    widget.model?.date ?? "No title",
                    style:const TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 30,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),color: AppColors.ranglar[widget.model?.isCompleted??0]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              const  Padding(padding: EdgeInsets.only(top: 2,right: 2,left: 2,bottom: 2)),
                Image.asset("${ImageModels.Images[0].images[widget.model?.isCompleted??0]}",scale: 2.4,),
             const SizedBox(width: 6,),
             Padding(
               padding: const EdgeInsets.only(right: 8),
               child:    Text("${ImageModels.Images[1].images[widget.model?.isCompleted??0]}",style: TextStyle(color: Colors.white),),
             )
              ],
            ),
          ),
         const SizedBox(width: 12,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(left: 3,right: 3),
                width: 52,
              height: 30,
                decoration: BoxDecoration(border: Border.all(width: 2,color: Color(0xff8687e7)),borderRadius: BorderRadius.circular(4)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/images/flag.png",scale: 3.5,),
                    Text("${widget.model?.priority}",style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
            ],
          )

        ]
      ),
    );
  }
}