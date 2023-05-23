// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/counter.dart';
import 'package:flutter_application_2/widgets/to_do.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDOApp(),
    );
  }
}

class ToDOApp extends StatefulWidget {
  const ToDOApp({super.key});

  @override
  State<ToDOApp> createState() => _ToDOAppState();
}

class Task {
  String tittle;
  bool status;
  Task({required this.tittle, required this.status});
}

class _ToDOAppState extends State<ToDOApp> {
  List alltasks = [
    Task(tittle: "play Football", status: true),
    Task(tittle: "Gym", status: false),
    Task(tittle: "Read Book", status: true),
  ];

  removealltasks() {
    setState(() {
      alltasks.removeRange(0, alltasks.length);
    });
  }

  removetask(int tasknum) {
    setState(() {
      alltasks.remove(alltasks[tasknum]);
    });
  }

  changestatus(taskIndex) {
    setState(() {
      alltasks[taskIndex].status = !alltasks[taskIndex].status;
    });
  }

  addtask() {
    setState(() {
      alltasks.add(
        Task(tittle: mytitle.text, status: false),
      );
    });
  }

  final mytitle = TextEditingController();

  int donetasks() {
    int numOfCompletedTasks = 0;
    for (var element in alltasks) {
      if (element.status) {
        numOfCompletedTasks++;
      }
    }
    return numOfCompletedTasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(11)),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: mytitle,
                          maxLength: 20,
                          decoration: InputDecoration(
                            hintText: ("add task"),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              addtask();
                              Navigator.pop(context);
                            },
                            child: Text(
                              "ADD",
                              style: TextStyle(fontSize: 22),
                            ))
                      ],
                    ),
                  ),
                );
              });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                removealltasks();
              },
              icon: Icon(
                Icons.delete_forever,
                color: Color.fromARGB(255, 234, 125, 117),
                size: 30,
              ))
        ],
        elevation: 0,
        title: Text(
          "To Do App",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(58, 66, 86, 1),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            count(
              allToDo: alltasks.length,
              allCompleted: donetasks(),
            ),
            Container(
              margin: EdgeInsets.only(top: 22),
              height: 550,
              child: ListView.builder(
                  itemCount: alltasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ToDO(
                      vartittle: alltasks[index].tittle,
                      doneOrNot: alltasks[index].status,
                      changestatus: changestatus,
                      index: index,
                      removetask: removetask,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
