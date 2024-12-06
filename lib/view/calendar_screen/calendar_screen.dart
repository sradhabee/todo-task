import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_task_f5/view/calendar_screen/widgets/choose_time.dart';

import '../../model/todo_model.dart';
import '../../utils/color_constants.dart';


class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key, required this.task});
  final Todo task;

  @override
  Widget build(BuildContext context) {

    final dateController = TextEditingController();
    final titleController = TextEditingController(text: task.title);
    final descpController = TextEditingController(text: task.description);
    return Scaffold(
      backgroundColor: ColorConstants.mainBlack,
      body: AlertDialog(
        backgroundColor: ColorConstants.mainGrey,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              style: TextStyle(
                color: ColorConstants.mainWhite
              ),
                  readOnly: true,
                  controller: dateController,
                  decoration: InputDecoration(
                      labelText: 'Date',labelStyle: TextStyle(
                        color: ColorConstants.mainWhite
                      ),
                      filled: true,
                      fillColor: ColorConstants.mainGrey,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                      suffixIcon: IconButton(
                          onPressed: () async {
                            var selectedDate = await showDatePicker(
                                context: context,
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2025));
                            print(selectedDate.toString());
                            if (selectedDate != null) {
                              dateController.text = DateFormat("dd MMM y").format(selectedDate);
                                  
                            }
                          },
                          icon: Icon(Icons.calendar_month,color: ColorConstants.mainWhite,)))),
                           SizedBox(
                              height: 20,
                                     ),
                          Row(
                            children: [
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: Text("Cancel",style: TextStyle(fontSize: 16),)),
                              SizedBox(width: 30,),
                              InkWell(
                                onTap: (){
                                 
                                  final task = Todo(title: titleController.text, description: descpController.text, date: dateController.text, time: "");
                                  
                                  showDialog(builder: (context) => ChooseTime(task: task,),context: context);},
                                child: Container(
                                  width: 120,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: ColorConstants.containerBlue,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text("Choose Time",style: TextStyle(
                                      color: ColorConstants.mainWhite,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal
                                    ),),
                                  ),
                                ),
                              )
                            ],
                          )
          ],
        ),


      ),
    );
  }












}