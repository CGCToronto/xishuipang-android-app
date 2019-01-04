import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';


class Menu{
   final String title;
   final String volume_number;
   final String character;
   final String theme;
   final List<Category> table_of_content;


   Menu({this.title, this.volume_number, this.character, this.theme,
       this.table_of_content});



  factory Menu.fromJson(Map<String,dynamic> parsedJson){

    var list=parsedJson['table_of_content'] as List;
    List<Category>temp=list.map((i)=>Category.fromJson(i)).toList();
     return Menu(
       title: parsedJson['title'],
       theme:parsedJson['theme'],
       volume_number: parsedJson['volume'],
       character: parsedJson['character'],
       table_of_content: temp
     );
  }

  Future<Menu> fetchMenu(String volume_number,String character  ) async {
     final response =
     await http.get('http://www.xishuipang.com/article/list?volume='+volume_number+'&character='+character);

     if (response.statusCode == 200) {
       // If the call to the server was successful, parse the JSON

       return Menu.fromJson(json.decode(response.body));
     } else {
       // If that call was not successful, throw an error.
       throw Exception('Failed to load Menu');
     }
   }
}

class Category{
  final String category_name;
  final List<ArticlePiece> articles_list;

  Category({this.category_name, this.articles_list});
  factory Category.fromJson(Map<String,dynamic> parsedJson){
    var list=parsedJson['articles'] as List;
    List<ArticlePiece> temp=list.map((i)=>ArticlePiece.fromJson(i)).toList();

    return Category(
      category_name: parsedJson['category'],
      articles_list: temp,
    );
  }

}

class ArticlePiece{
  final String title;
  final String author;
  final String id;

  ArticlePiece({this.title, this.author, this.id});

  factory ArticlePiece.fromJson(Map<String, dynamic> parsedJson){
    return new ArticlePiece(
      title:parsedJson['title'],
      author:parsedJson['author'],
      id:parsedJson['id'],
    );

  }

}

