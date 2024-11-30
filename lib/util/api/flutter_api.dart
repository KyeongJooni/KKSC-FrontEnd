// 1.
// https://totally-developer.tistory.com/123

import 'dart:convert';  // JSON 변환을 위해 사용되는 라이브러리
import 'package:http/http.dart' as http;  // HTTP 요청을 보내기 위한 라이브러리
import 'album.dart';  // Album 클래스(응답 객체)를 가져오는 파일

// RestApiService 클래스는 싱글톤 패턴을 사용하여 인스턴스를 하나만 유지
class RestApiService {
  // 싱글톤 패턴을 위한 static final 인스턴스 변수
  static final RestApiService _restApiService = RestApiService._internal();

  // factory 생성자: RestApiService의 인스턴스를 반환
  factory RestApiService() => _restApiService;

  // 내부 생성자: 외부에서 RestApiService의 인스턴스를 직접 생성할 수 없도록 하는 생성자
  RestApiService._internal();

  // 새로운 앨범을 생성하는 메소드 (HTTP POST 요청을 사용)
  Future<Album> postAlbum(String title) async {
    // 'https://jsonplaceholder.typicode.com/albums' URL에 POST 요청을 보냄
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),  // 요청할 URI
      headers: <String, String>{  // HTTP 요청 헤더 설정
        'Content-Type': 'application/json; charset=UTF-8',  // 요청 데이터 형식이 JSON임을 명시
      },
      body: jsonEncode(<String, String>{  // 요청의 body에 포함할 데이터, JSON 형식으로 인코딩
        'title': title,  // 앨범의 제목(title)을 JSON 형식으로 전달
      }),
    );

    // 서버가 201 CREATED 응답을 반환하면 새 앨범 객체를 반환
    if (response.statusCode == 201) {
      // 응답 본문(response.body)을 JSON으로 디코딩하고, 이를 Album 객체로 변환하여 반환
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // 만약 201이 아닌 다른 상태 코드가 오면 예외를 발생시킴
      throw Exception('Failed to post album.');
    }
  }

  // 앨범 목록을 가져오는 메소드 (HTTP GET 요청을 사용)
  Future<List<Album>> getAlbumList() async {
    // 'https://jsonplaceholder.typicode.com/albums' URL에 GET 요청을 보냄
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),  // 요청할 URI
      headers: <String, String>{  // HTTP 요청 헤더 설정
        'Content-Type': 'application/json',  // 요청 데이터 형식이 JSON임을 명시
        'Accept': 'application/json',  // 서버가 응답할 데이터 형식으로 JSON을 기대
      },
    );

    // 응답 본문(response.body)을 JSON으로 디코딩하고, 그 결과를 Album 객체 목록으로 변환
    // jsonDecode(response.body)로 받은 리스트를 Album 객체 리스트로 변환
    final List<Album> result = (jsonDecode(response.body) as List)  // JSON 디코딩 후 List로 캐스팅
        .map<Album>((json) => Album.fromJson(json))  // 각 JSON 객체를 Album 객체로 변환
        .toList();  // 변환된 Album 객체를 리스트로 반환
    return result;  // 앨범 목록을 반환
  }
}

// 2.
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