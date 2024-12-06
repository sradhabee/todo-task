import 'package:flutter/material.dart';

import 'package:flutter_check_box_rounded/flutter_check_box_rounded.dart';
import 'package:provider/provider.dart';
import 'package:todo_task_f5/controller/todo_provider.dart';
import 'package:todo_task_f5/view/add_task_screen/add_task_screen.dart';
import 'package:todo_task_f5/view/todo_detail_screen/todo_detail_screen.dart';

import '../../utils/color_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstants.mainGrey,
        onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddTaskScreen(),));
      },
      child: Icon(Icons.add,color: ColorConstants.mainWhite,),
      ),
       backgroundColor: ColorConstants.mainBlack,
     appBar: AppBar(
      backgroundColor: ColorConstants.mainBlack,
      title: Text("Index",style: TextStyle(color: ColorConstants.mainWhite,fontSize: 20,fontWeight: FontWeight.w500),),
      centerTitle: true,
     leading: Icon(Icons.menu,color: ColorConstants.mainWhite,),
     actions: [
      CircleAvatar(
        radius: 15,
        
      ),
      Padding(padding: EdgeInsets.only(right: 15))
     ],
     ),
     body: Padding(
       padding: const EdgeInsets.all(18.0),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
            prefixIcon: Icon(Icons.search,color: ColorConstants.mainWhite.withOpacity(0.5),),
              border: OutlineInputBorder(),
              fillColor: ColorConstants.mainBlack,
              filled: true,
       
              label: Text("Search for your tasks..."),
              labelStyle: TextStyle(color: ColorConstants.mainWhite.withOpacity(0.5))
            ),
          ),
          SizedBox(height: 20,),
          Container(
            height: 35,
            width: 85,
            decoration: BoxDecoration(
              color: ColorConstants.mainGrey,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Today",style: TextStyle(color: ColorConstants.mainWhite),),
                  Icon(Icons.keyboard_arrow_down_rounded,color: ColorConstants.mainWhite.withOpacity(0.5),)
                ],
              ),
            ),
          ),
          SizedBox(height: 30,),
          Expanded(
            child: ListView.separated(
              itemCount: todoProvider.todos.length,
              itemBuilder: (context, index) {
                final todo = todoProvider.todos[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TodoDetailScreen(index: index),));
                  },
                  child: Container(
                  padding: EdgeInsets.all(18),
                                height: 100,
                                width: double.infinity,
                                decoration: BoxDecoration(
                               color: ColorConstants.mainGrey,
                               borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                  children: [
                    CheckBoxRounded(
                    isChecked: todo.isCompleted,
                    onTap: (value) {
                      todoProvider.toggleTodoCompletion(index);
                    },
                      checkedColor: ColorConstants.mainGrey,
                      size: 15,
                    
                    ),
                    SizedBox(width: 25,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Text(todo.title,style: TextStyle(color: ColorConstants.mainWhite,fontSize: 16),),
                        SizedBox(height: 12,),
                         Text("Today At : ${todo.time}",style: TextStyle(color: ColorConstants.mainWhite,fontSize: 16),),
                      ],
                    ),
                  ],
                  
                                ),
                                
                              ),
                );
              } ,separatorBuilder: (BuildContext context, int index) { 
              
               return SizedBox(height: 10,) ;},),
          ),
          SizedBox(height: 18,),
            Container(
            height: 35,
            width:110,
            decoration: BoxDecoration(
              color: ColorConstants.mainGrey,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Completed",style: TextStyle(color: ColorConstants.mainWhite),),
                  Icon(Icons.keyboard_arrow_down_rounded,color: ColorConstants.mainWhite.withOpacity(0.5),)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),

          Expanded(
            child: ListView.separated(
              itemCount: todoProvider.completedTodos.length,
              itemBuilder: (context, index) {
                final todo = todoProvider.completedTodos[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TodoDetailScreen(index: index),));
                  },
                  child: Container(
                  padding: EdgeInsets.all(18),
                                height: 100,
                                width: double.infinity,
                                decoration: BoxDecoration(
                               color: ColorConstants.mainGrey,
                               borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                  children: [
                    CheckBoxRounded(
                    isChecked: todo.isCompleted,
                    onTap: (value) {
                      todoProvider.toggleTodoCompletion(index);
                    },
                      checkedColor: ColorConstants.mainGrey,
                      size: 15,
                    
                    ),
                    SizedBox(width: 25,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(todo.title,style: TextStyle(color: ColorConstants.mainWhite,fontSize: 16),),
                        SizedBox(height: 12,),
                         Text("Today At : ${todo.time}",style: TextStyle(color: ColorConstants.mainWhite,fontSize: 16),),
                      ],
                    ),
                  ],
                                ),
                                
                              ),
                );
              } ,separatorBuilder: (BuildContext context, int index) { 
              
               return SizedBox(height: 10,) ;},),
          ),
        ],
       ),
     ),

    );
  }
}