import 'package:first_lesson/Widgets/bottoms/button1.dart';
import 'package:first_lesson/Widgets/bottoms/button2.dart';
import 'package:first_lesson/Widgets/bottoms/button3.dart';
import 'package:first_lesson/Widgets/getdate.dart';
import 'package:first_lesson/database/local_database.dart';
import 'package:first_lesson/models/todo_model.dart';
import 'package:first_lesson/screens/main_page.dart';
import 'package:flutter/material.dart';
class UpdateTaskWidget extends StatefulWidget {
  TodoModel todo;
  VoidCallback onUpdatedTask;

  UpdateTaskWidget({
    Key? key,
    required this.onUpdatedTask,
    required this.todo,
  }) : super(key: key);

  @override
  State<UpdateTaskWidget> createState() => _UpdateTaskWidgetState();
}

class _UpdateTaskWidgetState extends State<UpdateTaskWidget> {
  final formKey = GlobalKey<FormState>();
  String newTitle = "";
  String newDescription = "";
  DateTime? taskDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const  Text("Title",style: TextStyle(color: Colors.white),),
            const  SizedBox(height: 8,),
            TextFormField(
              initialValue: widget.todo.title,
              onSaved: (val) {
                newTitle = val ?? "";
              },
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide:const BorderSide(color: Color(0xff565656)),borderRadius: BorderRadius.circular(16)),
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Title',
                focusColor: const Color(0xff868686),
                hintStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: const Color(0xff565656),
                border:  const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white12,width: 2),
                ),
                focusedBorder:  const OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.white12, width: 2)),
              ),
            ),
            const SizedBox(height: 12),
          const  Text("Description",style: TextStyle(color: Colors.white),),
          const  SizedBox(height: 8,),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              initialValue: widget.todo.description,
              onSaved: (val) {
                newDescription = val ?? "";
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide:const BorderSide(color: Color(0xff565656)),borderRadius: BorderRadius.circular(16)),
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Title',
                focusColor: const Color(0xff868686),
                hintStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: const Color(0xff565656),
                border:  const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white12,width: 2),
                ),
                focusedBorder:  const OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.white12, width: 2)),
              ),
            ),
           const SizedBox(height: 42,),
            Row(
              children: [
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
                    formKey.currentState?.save();
                    var newTodo = TodoModel(
                      id: widget.todo.id,
                      title: newTitle,
                      description: newDescription,
                      date: "${GetDate.getdate.soat}  :  ${GetDate.getdate.minut}  ${GetDate.getdate.ap}",
                      priority: propirty,
                      isCompleted: zaybal,
                    );
                    LocalDatabase.updateTaskById(newTodo);
                    widget.onUpdatedTask();
                    Navigator.pop(context);
                  },
                  icon: Image.asset(
                    "assets/images/send.png",
                    scale: 2,
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}