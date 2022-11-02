import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:async/async.dart';
import 'package:untitled/api.dart';
import 'package:untitled/models/search_model.dart';
import 'models/model.dart';

class ApiStream {
  Api api = Api();
  StreamController<SearchModel> streamContr = StreamController<SearchModel>.broadcast(); // PIPE

  Stream<SearchModel> get stream => streamContr.stream;

  void getStreamData(id) async {
    SearchModel? data = await api.getDataIntern(id: id);
    streamContr.sink.add(data!);
  }

  void dispose() {
    streamContr.close();
  }
}

var apiStream = ApiStream();
