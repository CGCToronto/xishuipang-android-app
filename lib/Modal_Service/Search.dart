import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:xishuipang_android/Modal_Service/Article.dart';
class Search {

  List<ArticleObject> fromJson(List<dynamic> json) {

    if (json == null) {
      throw FormatException("Null JSON provided to Search");
    }
    else{
      //convert dynamic list into article list
      List<ArticleObject> test1=json.map((i)=>ArticleObject.fromJson(i)).toList();
      return test1 ;
    }
  }

  Future<List<ArticleObject>> fetchSearchList(String txt) async {
    final response =
    await http.get('http://www.xishuipang.com/search/get?text='+txt);

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON

      return fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load Search');
    }
  }

}

class ArticleObject{
  String title;
  String author;
  String id;
  String volume;


  ArticleObject({this.title, this.author, this.id,this.volume});
  ArticleObject.origin(this.title, this.author, this.id,this.volume);

  factory ArticleObject.fromJson(Map<String, dynamic> parsedJson){
    return new ArticleObject(
      title:parsedJson['title'],
      author:parsedJson['author'],
      id:parsedJson['id'],
      volume: parsedJson['volume'],
    );

  }
}

