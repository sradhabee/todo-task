import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task_f5/view/home_screen/home_screen.dart';

import '../../../controller/todo_provider.dart';
import '../../../model/todo_model.dart';
import '../../../utils/color_constants.dart';

class ChooseTime extends StatelessWidget {
  const ChooseTime({super.key, required this.task});
  final Todo task;

  @override
  Widget build(BuildContext context) {
    

     final timeController = TextEditingController();
    final titleController = TextEditingController(text: task.title);
    final descpController = TextEditingController(text: task.description);
     final dateController = TextEditingController(text: task.date);

   
    return Scaffold(
      backgroundColor: ColorConstants.mainBlack,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AlertDialog(
            backgroundColor: ColorConstants.mainGrey,
            content:  Column(
              children: [

                TextFormField(
                  style: TextStyle(
                    color: ColorConstants.mainWhite,
                  ),
                  readOnly: true,
                  controller: timeController,
                  decoration: InputDecoration(
                    labelText: 'Time',
                    labelStyle: TextStyle(color: ColorConstants.mainWhite),
                    filled: true,
                    fillColor: ColorConstants.mainGrey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () async {
                        TimeOfDay? selectedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (selectedTime != null) {
                          timeController.text = selectedTime.format(context);
                        }
                      },
                      icon: Icon(Icons.access_time, color: ColorConstants.mainWhite),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              
            
           
          
            Row(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(fontSize: 16, color: ColorConstants.containerBlue),
                  ),
                ),
                SizedBox(width: 40),
                ElevatedButton(
                  onPressed: ()  {
                    final task = Todo(
                      title: titleController.text, 
                      description: descpController.text,
                       date: dateController.text,  
                       time: timeController.text
                       );
                       Provider.of<TodoProvider>(context, listen: false).addTask(task);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.containerBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    " Save",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: ColorConstants.mainWhite,
                    ),
                  ),
                ),
              ],
            )
          ]),)]));

  }
}