class ToDo{
  String? id;
  String? todoText;
  bool isDone;


  ToDo({
    required this.id,
    required this.todoText,
    this.isDone =  false
  });


  static List<ToDo> todoList(){
    return[
      ToDo(id: "01", todoText: "Wake Up", isDone: true),
      ToDo(id: "02", todoText: "Take a bath", isDone: true),
      ToDo(id: "03", todoText: "dress up", ),
      ToDo(id: "04", todoText: "breakfast", ),
      ToDo(id: "05", todoText: "test")
    ];
  }

}

