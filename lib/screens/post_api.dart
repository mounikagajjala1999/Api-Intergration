import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/search_model.dart';

class ApiPost {

  Future<SearchModel?> postData(myController,myController1,myController2,myController3) async {

    var res = await http.post(Uri.parse("https://interns-new.herokuapp.com/list"),
    body: {
      "name": myController,
      "mobile": myController1.toString(),
      "designation": myController2.toString(),
      "email": myController3.toString(),

    });
    // String url = "https://interns-new.herokuapp.com/list";
    // Uri uri = Uri.parse(url);
    // print(url);

    // Map<String,dynamic> _body={
    //   "name": myController,
    //   "mobile": myController1,
    //   "designation": myController2,
    //   "email": myController3,
    // };

    // http.Response res = await http.post(uri); //network call


    print(res.body);
    if (res.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(res.body);
      SearchModel searchModel = SearchModel.fromJson(jsonData);
      return searchModel;
    }
    return null;
  }
}
ApiPost apiPost = ApiPost();