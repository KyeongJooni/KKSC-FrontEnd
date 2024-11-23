/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodosWidget(),
    );
  }

}

class Todos
{
  int? userId;
  int? id;
  String? title;
  bool? completed;

  Todos({this.userId, this.id, this.title, this.completed});
  Todos.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson()
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['completed'] = this.completed;
    return data;
  }
}

Future<List<Todos>> fetchTodos() async
{
  final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos')  );
  if(response.statusCode == 200){
    return (jsonDecode(response.body) as List)
        .map((e) => Todos.fromJson(e))
        .toList();
  }

  else {
    throw Exception('Failed to load album');
  }
}

class TodosWidget extends StatefulWidget
{
  const TodosWidget({Key? key}) : super(key: key);
  @override
  _TodosWidgetState createState() => _TodosWidgetState();

}

class _TodosWidgetState extends State<TodosWidget>
{
  late Future<List<Todos>> futureTodos;
  @override
  void initState() {
    super.initState();
    futureTodos = fetchTodos();
  }

  @override
  Widget build(BuildContext context)
  {
    return FutureBuilder<List<Todos>>(
        future: futureTodos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: <Widget>[
                ...snapshot.data!.map((e) => SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 4,
                    child: Text(e.title!),
                  ),
                )
                ),
              ],
            );
          }

          else if(snapshot.hasError) {
            return Text('${snapshot.hasError}');
          }

          return const CircularProgressIndicator();
        }
        );
  }
}
 */