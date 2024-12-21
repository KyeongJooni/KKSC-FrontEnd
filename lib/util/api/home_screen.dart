/*
import 'package:flutter/material.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/api/get_model.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/api/get_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CommandsModel> commendsModel = [];
  getComments() {
    GetApiServices().getCommentsModel().then((value) {
      setState(() {
        commendsModel = value!;
      });
    });
  }

  @override
  void initState() {
    getComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text("Get API"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: commendsModel.length,
        itemBuilder: (context, index) {
          final apidata = commendsModel[index];
          return Material(
            child: Row(
              children: [
                Text(
                  apidata.id.toString(),
                ),
                Text(
                  apidata.name.toString(),
                ),
                Text(
                  apidata.email.toString(),
                ),
                Text(
                  apidata.body.toString(),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
*/