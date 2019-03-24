import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';


class Article{

  List<String> pictureList;
  List<String>sentenceList;

  String volume_number;
  String article_id;
  String character;

  String author;
  String category;
  String title;
  List<String> article_content;

  Article.origin(this.volume_number, this.article_id, this.character, this.author,
      this.category, this.title, this.pictureList, this.sentenceList);

  Article({this.volume_number, this.article_id, this.character, this.author,
    this.category, this.title, this.article_content, this.pictureList, this.sentenceList});

  factory Article.fromJson(Map<String, dynamic> parsedJson,String volume_number){
    var article_content_from_Json=parsedJson['content'];
    List<String> temp_article_content=article_content_from_Json.cast<String>();
    List<String> pictureList1 = [];
    List<String>sentenceList1 = [];

    //use regex to find string in list with jpeg file and change it into https format, and add "\n" into list
    RegExp exp1 = new RegExp("(<).*(.jpeg>)");
    RegExp exp2 = new RegExp("(<).*(.jpg>)");
    for(var i=0;i<temp_article_content.length;i++){

      if (exp1.hasMatch(temp_article_content[i]) ||
          exp2.hasMatch(temp_article_content[i])) {
        String reshapeString = temp_article_content[i].substring(
            1, temp_article_content[i].length - 1);
        temp_article_content[i] =
            "http://www.xishuipang.com/content/volume_" + volume_number +
                "/images/" + reshapeString;
        if (i == 0) {
          sentenceList1.add(" ");
        }
        pictureList1.add(temp_article_content[i]);
      }
      if (i == 0 && !exp1.hasMatch(temp_article_content[0]) &&
          !exp2.hasMatch(temp_article_content[0])) {
        String sentence = temp_article_content[0].length <= 77
            ? temp_article_content[0]
            : temp_article_content[0].substring(0, 76);
        sentenceList1.add(sentence);
      }
      if (temp_article_content[i].isEmpty || temp_article_content[i] == null ||
          temp_article_content[i] == "" || temp_article_content[i] == '' ||
          temp_article_content[i] == false) {
        temp_article_content[i] = " ";
        print(temp_article_content[i]);
      }
    }

    return new Article(
        volume_number: parsedJson['volume'],
        article_id: parsedJson['id'],
        character: parsedJson['character'],
        author: parsedJson['author'],
        category: parsedJson['category'],
        title: parsedJson['title'],
        article_content: temp_article_content,
        pictureList: pictureList1,
        sentenceList: sentenceList1


    );
  }


  Future<Article> fetchArticle(String volume_number, String id, String character) async {
    final response =
    await http.get('http://www.xishuipang.com/article/get?volume='+ volume_number+'&name='+id+'&character='+character);

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return Article.fromJson(json.decode(response.body),volume_number);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load Article');
    }
  }
}


