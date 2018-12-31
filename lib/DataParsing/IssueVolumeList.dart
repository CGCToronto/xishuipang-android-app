import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class IssueVolumeList{
  final int list;
  IssueVolumeList(this.list); //fetch a volume list


  Future<List<int>> fetchVolumeList(http.Client client) async {
    final response =
    await client.get('http://www.xishuipang.com/volume/list');

    // Use the compute function to run  in a separate isolate
    return compute(parsePhotos, response.body);
  }

  // A function that will convert a response body into a List<int>
  List<int> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    //use quicksort to 
    return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  }



}