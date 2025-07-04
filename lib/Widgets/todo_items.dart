import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/Constants/colors.dart';
import '../models/todo.dart';

class TodoItems extends StatelessWidget {
  final ToDo todo;
  final ontodoChange;

  const TodoItems({super.key, required this.todo, required this.ontodoChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        onTap: (){
          ontodoChange(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: Icon(todo.isDone ? Icons.check_box: Icons.check_box_outline_blank, color: tdBlue,),
        title: Text(todo.todoText!, style: GoogleFonts.poppins(decoration: todo.isDone ? TextDecoration.lineThrough: null),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 10),
          height: 35, width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(10)
          ),child: Center( child:
            IconButton(onPressed:() {print("delete test");}, icon: Icon(Icons.delete, color: Colors.white,), iconSize: 20,
            ),
        )
        ),
      )
    );
  }
}
