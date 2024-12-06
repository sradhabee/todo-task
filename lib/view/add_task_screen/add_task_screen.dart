import 'package:flutter/material.dart';
import 'package:todo_task_f5/model/todo_model.dart';
import 'package:todo_task_f5/view/calendar_screen/calendar_screen.dart';

import '../../utils/color_constants.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
final titleController = TextEditingController();
final descpController = TextEditingController();

    return Scaffold(
      backgroundColor: ColorConstants.mainBlack,
      body: AlertDialog(
        backgroundColor: ColorConstants.mainGrey,
        
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Add Task",style: TextStyle(
          color: ColorConstants.mainWhite,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),),
        SizedBox(
          height: 20,
        ),
            TextFormField(
               style: TextStyle(
                color: ColorConstants.mainWhite
              ),
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Add Title",style: TextStyle(color: ColorConstants.mainWhite.withOpacity(0.3)),),
              ),
            ),
             SizedBox(
          height: 20,
        ),
            Text("Description",style: TextStyle(
          color: ColorConstants.mainWhite,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),),
         SizedBox(
          height: 20,
        ),
            TextFormField(
              style: TextStyle(
                color: ColorConstants.mainWhite
              ),
              controller: descpController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Add Description",style: TextStyle(color: ColorConstants.mainWhite.withOpacity(0.3)),),
              ),
            ),
             SizedBox(
          height: 20,
        ),
          InkWell(
            onTap: () { 
              final task = Todo(title: titleController.text, description: descpController.text, date: "", time: "");
              showDialog(builder: (context) => CalendarScreen(task: task,),context: context);},
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  backgroundColor:ColorConstants.mainGrey,
                  
                  
                  foregroundColor: ColorConstants.containerBlue,
                  
                radius: 20,
                
                child: Icon(Icons.add),
              
              ),
              ]
            ),
          )

          ],
        ),
      ),
    );
  }
}