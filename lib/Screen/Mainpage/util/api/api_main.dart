/*
import 'package:flutter/material.dart';
import 'package:project/album.dart';
import 'package:project/restApiService.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Flutter App', home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  final restApiService = RestApiService();
  Future<Album>? _album;
  Future<List<Album>>? _albumList;
  bool _getData = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RestAPI GET, POST'),
      ),
      body: _album == null && !_getData
          ? Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: '제목을 입력하세요'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => setState(() {
                _album = restApiService.postAlbum(_controller.text);
              }),
              child: const Text("새 데이터 생성하기 (POST)"),
            ),
            ElevatedButton(
              onPressed: () => setState(() {
                _albumList = restApiService.getAlbumList();
                _getData = !_getData;
              }),
              child: const Text("기존 데이터 가져오기 (GET)"),
            ),
          ],
        ),
      )
          : _album != null && !_getData
          ?
      // POST 부분
      Container(
        padding: const EdgeInsets.all(15),
        child: FutureBuilder<Album>(
          future: _album,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.title);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      )
          :
      // GET 부분
      Container(
        padding: const EdgeInsets.all(15),
        child: FutureBuilder<List<Album>>(
          future: _albumList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                        "${snapshot.data![index].id}: ${snapshot.data![index].title}"),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
*/