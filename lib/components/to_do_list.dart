import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {
final Function(bool?)? onChanged ;
final Function(BuildContext)? deleteTask ;
final bool? taskComplated ;
final String taskname ;
  const ToDoList({super.key,required this.onChanged, required this.taskComplated, required this.taskname,required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 25,top: 25,right: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(onPressed: deleteTask,
          icon: Icons.delete,
          backgroundColor: Colors.red.shade300,
          borderRadius: BorderRadius.circular(8),
          )
        ]),
        child: Container(
            padding:const  EdgeInsets.all(18),
          
          decoration: BoxDecoration(
            color: Colors.yellow ,
            borderRadius: BorderRadius.circular(12)
          ),
            child: Row(
              children: [
                Checkbox(value: taskComplated, onChanged:onChanged ,
                activeColor: Colors.green,
                hoverColor: Colors.green[300],
                ),
              const  SizedBox(width: 18,),
                Text(taskname,
                style: TextStyle(decoration: taskComplated! ? TextDecoration.lineThrough : TextDecoration.none,
                fontSize: 18,
                fontWeight: FontWeight.bold
                ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}