
import 'package:hive_flutter/adapters.dart';

part 'todo_model.g.dart';


@HiveType(typeId: 0)
class Todo extends HiveObject{

  @HiveField(0)
  final String title;

  @HiveField(1)
 final String description;

 @HiveField(2)
 final String date;

 @HiveField(3)
 final String time;

 @HiveField(4)
 final bool isCompleted;

 Todo({

  required this.title,
  required this.description,
   required this.date,
  required this.time,
  this.isCompleted= false,


 });
  
}