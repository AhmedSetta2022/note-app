import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/components/my_btn.dart';


class DialogBox extends StatelessWidget {
  final controller ;
  final VoidCallback onSave ;
  final VoidCallback onCancel ;
  const DialogBox({super.key,required this.controller, required this.onSave, required this.onCancel});


  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      backgroundColor: Colors.yellow,
      content: SizedBox(height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        
        children: [
        // get user inupts
        TextField(
          keyboardType: TextInputType.text,
          controller:controller ,
          maxLength: 15,
          decoration:const  InputDecoration(border: OutlineInputBorder(),
          hintText: "Add New Task ..."),
          inputFormatters: [
           FilteringTextInputFormatter.deny(RegExp(r'[/\\]')),
          ],
        ),
       const SizedBox(height: 14,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
           MyButton(btnName: "Create", onPressed: onSave , color: Colors.green, ),
           MyButton(btnName: "Cancel", onPressed: onCancel , color: Colors.red, )
          ],
        )
      ],),
      
      ),

    );
  }
}