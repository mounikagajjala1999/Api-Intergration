import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/models/model.dart';
import 'package:untitled/models/search_model.dart';

//import 'package:http/http.dart%20';
class Api {
  Future<SearchModel?> getDataIntern({required String? id}) async {
    String url = "https://interns-new.herokuapp.com/list/$id";
    Uri uri = Uri.parse(url);
    print(url);
    http.Response res = await http.get(uri); //network call

    print(res.body);
    if (res.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(res.body);
      SearchModel model = SearchModel.fromJson(jsonData);
      return model;
    }
    return null;
  }
}
Api apiget =Api();