import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:xishuipang_android/Support/QuickSort.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class IssueVolumeList{
  //find current path
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);


    return directory.path;
  }

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
    final path = await _localPath;
    File file;

    //check if directory exists, if not create one
    if(!await Directory('$path/LocalStorage').exists()){
      new Directory('$path/LocalStorage').create()
      // The created directory is returned as a Future.
          .then((Directory directory) {
        print(directory.path);
      });
    }

    try {
      final response =
      await http.get('http://www.xishuipang.com/volume/list');
      // If the call to the server was successful
      if (response.statusCode == 200) {

        final dir = Directory('$path/LocalStorage/list.json');
        dir.deleteSync(recursive: true);
        print(dir);

        file=File('$path/LocalStorage/list.json');
        file.writeAsString(response.body);
        print(file);


        return IssueVolumeList().fromJson(json.decode(await file.readAsString()));
      }
    }catch(e){
      file = File('$path/LocalStorage/list.json');
      print(file);
      return IssueVolumeList().fromJson(
          json.decode(await file.readAsString()));
    }



  }
}