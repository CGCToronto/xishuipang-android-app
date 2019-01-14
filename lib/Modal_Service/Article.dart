import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;



class Article{

  String volume_number;
  String article_id;
  String character;

  String author;
  String category;
  String title;
  List<String> article_content;

  Article({this.volume_number, this.article_id, this.character, this.author,
  this.category, this.title, this.article_content,} );

  factory Article.fromJson(Map<String, dynamic> parsedJson,String volume_number){

    var article_content_from_Json=parsedJson['content'];
    List<String> temp_article_content=article_content_from_Json.cast<String>();


    //use regex to find string in list with jpeg file and change it into https format, and add "\n" into list
    RegExp exp=new RegExp("[<].*[.jpeg>]");
    for(var i=0;i<temp_article_content.length;i++){
      if(exp.hasMatch(temp_article_content[i]))
        {
          String reshapeString=temp_article_content[i].substring(1,temp_article_content[i].length-1);
          temp_article_content[i]="http://www.xishuipang.com/content/volume_"+volume_number+"/images/"+reshapeString;
        }
      if(temp_article_content[i]=="")
        {
          temp_article_content[i]="\n";
        }

    }
    return new Article(
      volume_number: parsedJson['volume'] ,
      article_id: parsedJson['id'] ,
      character: parsedJson['character'] ,
      author: parsedJson['author'] ,
      category: parsedJson['category'] ,
      title: parsedJson['title'] ,
      article_content:temp_article_content,
        
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


