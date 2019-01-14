import 'package:flutter/material.dart';
import 'package:xishuipang_android/UI/main.dart';
import 'package:xishuipang_android/UI/AritcleMenu/ArticleUI.dart';
class Content extends StatefulWidget {
  @override
  _Content createState() => _Content();
}

class _Content extends State<Content> {



  @override
  Widget build(BuildContext context) {
    List<Widget> source=[];
    RegExp exp=new RegExp("[/images/]");

    for(var i=0;i<as.article_content.length;i++){
      if(exp.hasMatch(as.article_content[i])){
        setState(() {
          source.add(EveryImage(as.article_content[i]));
        });

      }
      else {
        setState(() {
          source.add(EveryParagraph(as.article_content[i]));
        });

        }
    }

    ListView.builder(
      itemCount: source.length,
        itemBuilder: (context,index){
        return Container(
          child:
          source[index],);
        },
      physics: NeverScrollableScrollPhysics(),
    );
    }

}

class EveryParagraph extends StatelessWidget{
  String a;

  EveryParagraph(this.a);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 40, 10),
      child: Text(a,softWrap: true,),
    );
  }

}

class EveryImage extends StatelessWidget{
  String a;

  EveryImage(this.a);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 40, 10),
      child: Image.network(a),
    );
  }

}