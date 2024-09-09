import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/components/dialog_box.dart';
import 'package:note_app/components/to_do_list.dart';
import 'package:note_app/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

    // ref of hive box
    final _mybox =Hive.box("todo");
    ToDoDataBase db = ToDoDataBase();
    final controller = TextEditingController();

  @override
  void initState() {
   if (_mybox.get("todolist") == null) {
     db.createIntialData();
   } else {
    db.loadData();
   }

    super.initState();
  }


  checkBoxChanged (bool? value , int index){
      setState(() {
        db.toDoList[index][1]= !  db.toDoList[index][1] ;
      });
      db.updateData();
   }

   void createTask (){
      setState(() {
         db.toDoList.add([controller.text, false]);
         controller.clear();
      });
         Navigator.of(context).pop();
         db.updateData();
   }
   
  // create anew task
  createNote(){
    showDialog(context: context, builder: (context){
      return  DialogBox(
        controller: controller ,
        onSave: createTask,
        onCancel: ()=> Navigator.of(context).pop(),
      );
    });
  }

 void deleteTask ( int index ){
    setState(() {
       db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          SystemNavigator.pop();
        }, icon:const Icon(Icons.exit_to_app_sharp , size: 40,)),
        elevation: 0,
        backgroundColor: Colors.yellow,
        title: const Text("T O D O" , style: TextStyle(color:Colors.black , fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(onPressed: createNote,
      backgroundColor: Colors.green[500],
       child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount:  db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoList(taskname:  db.toDoList[index][0],taskComplated:  db.toDoList[index][1],
          deleteTask: (context) => deleteTask(index) ,
          onChanged:(value) => checkBoxChanged(value , index));
        }),
    );
  }
}