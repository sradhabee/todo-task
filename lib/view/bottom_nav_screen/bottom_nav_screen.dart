import 'package:flutter/material.dart';
import 'package:todo_task_f5/model/todo_model.dart';
import 'package:todo_task_f5/utils/color_constants.dart';

import '../add_task_screen/add_task_screen.dart';
import '../empty_screen/empty_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
   int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
   
    final List<Widget> tabs = [
      EmptyScreen(),
      Container(color: Colors.red,),
      Container(color: Colors.red,),
      Container(color: Colors.red,),
      Container(color: Colors.red,),
    ];

    return Scaffold(
  body: tabs[selectedIndex],
  
  bottomNavigationBar:   BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    onTap: (index) {
      setState(() {
        selectedIndex = index;
      });
    },
  
      backgroundColor: ColorConstants.mainGrey,
      selectedItemColor: ColorConstants.mainWhite,
      unselectedItemColor: ColorConstants.mainWhite.withOpacity(0.4),
      
      items: [
   BottomNavigationBarItem(icon: Icon(Icons.home_filled,color: ColorConstants.mainWhite),label: "Index"),
    BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined,color: ColorConstants.mainWhite),label: "Calendar"),
     BottomNavigationBarItem(
      
      icon: InkWell(
      onTap: () => showDialog(builder: (context) => AddTaskScreen(),context: context),
      child: Icon(Icons.add_circle,size:75,color:  ColorConstants.containerBlue),),label: "",),
      BottomNavigationBarItem(icon: Icon(Icons.access_time_rounded,color: ColorConstants.mainWhite),label: "Focuse"),
       BottomNavigationBarItem(icon: Icon(Icons.person_outline,color: ColorConstants.mainWhite),label:  "Profile"),
    ],
    currentIndex: selectedIndex,
    
    
    ),
    );
  }
}