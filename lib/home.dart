import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/Constants/colors.dart';
import 'Widgets/todo_items.dart';
import 'models/todo.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: _buildAppbar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          "All To Do",
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            color: tdBlack,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      for (ToDo todoo in todosList) TodoItems(todo: todoo, ontodoChange: _handleTodoChange, onDelete: _onDelete,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey, // Shadow color
                          offset: Offset(
                            0.0,
                            0.0,
                          ),
                          blurRadius: 10,
                          spreadRadius: 0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Add new Items",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton( style: ElevatedButton.styleFrom(backgroundColor: tdBlue, minimumSize: Size(60, 60), elevation: 10,),
                      onPressed: (){
                    //add container and func
                      }, child: Text("+", style: GoogleFonts.poppins(fontSize: 40, color: Colors.white),)
                  ),

                )
              ],
            ),
          ),
        ],
      ),
    );

  }

  void _handleTodoChange(ToDo todo){
    setState(() {
      todo.isDone =!todo.isDone;
    });
  }

  void _onDelete(String id){
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }
}



Widget searchBox() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Icon(Icons.search, color: tdBlack, size: 20),
        prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
        border: InputBorder.none,
        hintText: "Search",
        hintStyle: GoogleFonts.poppins(),
      ),
    ),
  );
}

AppBar _buildAppbar() {
  return AppBar(
    backgroundColor: bgColor,
    elevation: 0,
    title: Container(
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu, size: 30),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: tdGrey,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ],
      ),
    ),
  );
}
