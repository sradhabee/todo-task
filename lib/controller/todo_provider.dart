import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/todo_model.dart';

class TodoProvider with ChangeNotifier{
 final Box<Todo> _todoBox = Hive.box<Todo>('todos');
 List<Todo> get todos => _todoBox.values.where((todo) => !todo.isCompleted).toList();
 List<Todo> get completedTodos => _todoBox.values.where((todo) => todo.isCompleted).toList();
  
void addTask(Todo task){
  
    
  _todoBox.add(task);
  
  notifyListeners();
}
  


  void toggleTodoCompletion(int index){
    final todo = _todoBox.getAt(index);
    if(todo !=null){
      final updatedTodo = Todo(title: todo.title, description: todo.description, date: todo.date, time: todo.time,isCompleted: !todo.isCompleted);

      _todoBox.putAt(index, updatedTodo);
      notifyListeners();
    }
  }

    void deleteTodo(int index){
      _todoBox.deleteAt(index);
      notifyListeners();

    }
    
    Todo? getTodoDetails(int index){
      if(index>=0 && index< _todoBox.length){
       return _todoBox.getAt(index);
    }
       return null;
    }

  }





