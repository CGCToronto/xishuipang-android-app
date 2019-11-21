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
    //convert dynamic type into int type
      List<int> test1=json.map((i)=>int.parse(i)).toList();
      return quickSort(test1) ;
    }
  }


  Future<List<int>> fetchVolumeList() async {
    final response =
    await http.get('http://www.xishuipang.com/volume/list');


    // If the call to the server was successful
    if (response.statusCode == 200) {


//      //If localFile is remained the same
//      if(IssueVolumeList().fromJson(json.decode(response.body))[0]==)
//
//      //If localFile is changed

      return IssueVolumeList().fromJson(json.decode(response.body));
    } else {
      // read localFile and parse it

      // If that call was not successful and no local file stored, throw an error.
      throw Exception('Failed to load Volume List');
    }
  }
}