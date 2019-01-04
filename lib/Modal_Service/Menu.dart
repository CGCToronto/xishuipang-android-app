import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';


class Menu{
   final String title;
   final String volume_number;
   final String character;
   final String theme;
   final List<table_Content> ContentList;


   Menu({this.title, this.volume_number, this.character, this.theme,
       this.ContentList});

//   Future<List<int>> fetchVolumeList(int volume_number,String character  ) async {
//     final response =
//     await http.get('http://www.xishuipang.com/article/list?volume='+volume_number.toString()+'&character='+character);
//
//     if (response.statusCode == 200) {
//       // If the call to the server was successful, parse the JSON
//
//       return Menu().fromJson(json.decode(response.body));
//     } else {
//       // If that call was not successful, throw an error.
//       throw Exception('Failed to load Menu');
//     }
//   }
}

class table_Content{
  final List<Category> content;

  table_Content({this.content});

}

class Category{
  final String category_name;
  final List<ArticlePiece> articles_list;

  Category({this.category_name, this.articles_list});

}

class ArticlePiece{
  final String title;
  final String author;
  final String id;

  ArticlePiece({this.title, this.author, this.id});


}

