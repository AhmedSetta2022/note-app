import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  final mybox = Hive.box("todo");


  void createIntialData(){
    toDoList = [
      ["welcome task" , false],
    ];
  }

  void loadData (){
    toDoList = mybox.get("todolist");
  }

  void updateData (){

    mybox.put("todolist", toDoList);
  }




}