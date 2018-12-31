import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Article> fetchArticle() async {
  final response =
  await http.get('http://www.xishuipang.com/article/get?volume=<volume_number>&name=<article_id>&character=<simplified/traditional>');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return Article.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load Article');
  }
}

Future<Images> fetchImages() async {
  final response =
  await http.get('http://www.xishuipang.com/content/<volume_folder_name>/images/<image_file_name>');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return Images.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load Images');
  }
}

class Article{

  int volume_number;
  int article_id;
  String character;

  String author;
  String category;
  String title;
  String content;
  List<String> images=new List();

  Article({this.volume_number, this.article_id, this.character, this.author,
      this.category, this.title, this.content, this.images});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      article_id:json['id'],
      volume_number: json['volume'],
      character: json['character'],
      content: json['content'],
      author: json['author'],
      title: json['title'],

      //find images

    );
  }
}


class Images{
  
}

