import 'package:flutter/material.dart';
import 'package:to_do_list_app/Constants/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: _buildAppbar(),
        body:
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
          searchBox()
        ],
            ),
      ),
      );

  }
}


Widget searchBox(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
    ),child: TextField(
    decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Icon(Icons.search, color: tdBlack, size: 20,),
        prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25
        ),
        border: InputBorder.none,
        hintText: "Search"
    ),
  ),
  );
}

AppBar _buildAppbar(){
  return AppBar(
    backgroundColor: bgColor,
    elevation: 0,
    title: Container(
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu, size: 30,),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: tdGrey,
                borderRadius: BorderRadius.circular(30)
            ),
          )
        ],
      ),
    ),
  );
}
