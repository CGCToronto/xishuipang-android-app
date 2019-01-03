import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:xishuipang_android/Support/QuickSort.dart';

class IssueVolumeList{

  //return a list of ascending number from volume-list json file
  List<int> fromJson(List<dynamic> json) {
    if (json == null) {
      throw FormatException("Null JSON provided to VolumeList");
    }
    else{
      List<int> test1=new List();
      for(int i=0;i<json.length;i++)
      {
        test1.add(int.parse(json[i]));
      }
      return quickSort(test1) ;
    }
  }


  Future<List<int>> fetchVolumeList() async {
    final response =
    await http.get('http://www.xishuipang.com/volume/list');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON

      return IssueVolumeList().fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load Volume List');
    }
  }
}