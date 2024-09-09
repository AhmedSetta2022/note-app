import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String btnName ;
  final Color? color;
  final VoidCallback  onPressed ;
  const MyButton({super.key, required this.btnName , required this.onPressed,required this.color,});
   
  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      onPressed: onPressed,
      color: color ,
       shape: RoundedRectangleBorder(
	                 borderRadius: BorderRadius.circular(8),
	                side: const BorderSide(color: Colors.purple),),
                   elevation: 10,
          child: Text(btnName),
    );
  }
}