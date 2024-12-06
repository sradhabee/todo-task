import 'package:flutter/material.dart';
import 'package:todo_task_f5/utils/color_constants.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
     body: Center(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        
         children: [
           Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm0L7C3uEWVXLyA0-d7rBdiDkw71REtLOWB_7aa7s52Gsbv-xr5rIH8Z_Ty2homS-FY-g&usqp=CAU"),
           SizedBox(
            height: 30,
           ),
           Text("What do you want to do today?",style: TextStyle(
            fontSize: 20,
            color: ColorConstants.mainWhite,
            fontWeight: FontWeight.w300,
       
           ),),
           SizedBox(
            height: 10,
           ),
           Text("Tap + to add your tasks",style: TextStyle(
            fontSize: 16,
            color: ColorConstants.mainWhite,
            fontWeight: FontWeight.normal,
       
           ),)
         ],
       ),
     ),

    );
  }
}