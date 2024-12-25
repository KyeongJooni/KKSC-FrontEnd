
// 코드 원본 (깃허브)

// 깃 코드 + 스터디 수정본

import 'package:flutter/material.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Mainpage/todo_list.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List toDoList = [
    ['Code With Otabek', true],
    ['Learn Flutter', true],
    ['Drink Coffee', false],
    ['Explore Firebase', false],
  ];
  TextEditingController inputController = TextEditingController();
  TextEditingController indexController = TextEditingController();
  String inputText = '';

  bool isTrue = false;

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
      // 이거 alert처럼 결과 알려주는거 있으면 좋을듯
      print(toDoList[index][1]); // 추가한거
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      // toDoList[index][1] 부분 결과가 t or f니까
      if(toDoList[index][1]) { // 추가한거
        toDoList.removeAt(index); // 원본
      } // 추가한거
      int i = 0;
      while(i < 1) {
        print(toDoList[index][0]);
        i++;
      }
    });
  }

  void AAA() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('변경됨')),
    );
    setState(() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text (
                "Dialog Title"
            ),
            content: Container(
              child: Center(
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        // Text('$inputText'),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
                          child: TextField(
                            controller: inputController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter your email',
                              // 임시
                              labelStyle: TextStyle(
                                color: Colors.redAccent,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                // 임시
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.redAccent,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0)
                                ),
                                //
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.redAccent
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0)
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
                          child: TextField(
                            controller: indexController,
                            decoration: InputDecoration(
                              labelText: 'Index',
                              hintText: 'Enter your Index',
                              // 임시
                              labelStyle: TextStyle(
                                color: Colors.redAccent,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                // 임시
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.redAccent,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0)
                                ),
                                //
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.redAccent
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0)
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              int a = int.parse(indexController.text);
                              print(a);
                              toDoList[a][0] = inputController.text;
                            });
                          },
                          child: Text('Update'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Close"),
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Text(
          'Simple Todo',
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, index) {
          return TodoList(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(index),
            deleteFunction: (contex) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Add a new todo items',
                    filled: true,
                    fillColor: Colors.deepPurple.shade200,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.deepPurple,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.deepPurple,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: saveNewTask,
              child: const Icon(Icons.add),
            ),



            TextButton(
              onPressed: () => AAA(),
              child: Text('show me'),
            ),

          ],
        ),
      ),
    );
  }
}

// 직접 친거
/*
import 'package:flutter/material.dart';
import 'package:project_none_flutter_todo_list_project/utilis/todo_list.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();
  List toDoList =[
    ['Learn Web Flutter', false],
    ['Drink coffee', false]
  ];

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    toDoList.add([_controller.text, false]);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Text(
            'Simple Todo'
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, index)
        {
          return TodoList(
            taskName: toDoList[index][0], // 대소문자 조심 - 저거 이름에 뭐가 따로 있나봄
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(index),
          );
        }
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Add a new todo items',
                  filled: true,
                  fillColor: Colors.deepPurple.shade200,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.deepPurple,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.deepPurple,
                    ),borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: saveNewTask,
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

*/