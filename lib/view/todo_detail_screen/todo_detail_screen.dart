import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task_f5/controller/todo_provider.dart';
import 'package:todo_task_f5/utils/color_constants.dart';

class TodoDetailScreen extends StatelessWidget {
  const TodoDetailScreen({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final todo = Provider.of<TodoProvider>(context).getTodoDetails(index);

    if(todo==null){
      return Scaffold(
        body: Center(child: Text("Todo not found"),)
      );
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.mainBlack,
        body:Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 90,
                width: double.infinity,
                 padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: ColorConstants.mainGrey,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(todo.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: ColorConstants.mainWhite),),
                    Text(todo.description, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300,color: ColorConstants.mainWhite),)
                  ],
                ),
              ),
              SizedBox(height: 32,),
              Row(
                children: [
                  Icon(Icons.calendar_month_outlined,color: ColorConstants.mainWhite,),
                  SizedBox(width: 8,),
                  Text( 'Date: ${todo.date}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: ColorConstants.mainWhite),),
                  
                ],
              ),
              SizedBox(height: 18,),
               Row(
                children: [
                  Icon(Icons.timer_sharp,color: ColorConstants.mainWhite,),
                  SizedBox(width: 8,),
                  Text( 'Time: ${todo.time}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: ColorConstants.mainWhite),),
                  Spacer(),
                 
                ],
              ),
      
              Spacer(),
              InkWell(
                onTap: () {
                      Provider.of<TodoProvider>(context, listen: false).deleteTodo(index);
                      Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorConstants.mainGrey,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.delete_outline,color: ColorConstants.mainRed,),
                      SizedBox(width: 8,),
                      Text("Delete Task",style: TextStyle(color: ColorConstants.mainRed,fontSize: 16,fontWeight: FontWeight.w400),)
                    ],
                  ),
                
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}