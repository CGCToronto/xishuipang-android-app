import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'Volume.dart';

Future<IssueVolumeList> fetchPost() async {
  final response =
  await http.get('http://www.xishuipang.com/volume/list');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return IssueVolumeList.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load Volume List');
  }
}
class IssueVolumeList{


  List<Volume> VolumeList=new List();

  IssueVolumeList(this.VolumeList);


  factory IssueVolumeList.fromJson(List<int> json) {
    if (json == null) {
      throw FormatException("Null JSON provided to SimpleObject");
    }
    return IssueVolumeList(

    );
  }

}