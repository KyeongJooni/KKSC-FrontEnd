import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/api/get_model.dart';
import 'package:http/http.dart' as http;

class GetApiServices {
  Future <List <CommandsModel>?> getCommentsModel() async {
    var data = http.Client();
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/comments");
    var response = await data.get(uri);
    if(response.statusCode == 200) {
      var json = response.body;
      return commandsModelFromJson(json);
    }
    return null;
  }
}