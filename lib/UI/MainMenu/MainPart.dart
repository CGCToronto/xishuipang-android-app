import 'package:xishuipang_android/UI/main.dart';
import 'package:flutter/material.dart';
import 'package:xishuipang_android/Modal_Service/Menu.dart';
import 'package:xishuipang_android/UI/AritcleMenu/ArticleUI.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class MainPart extends State<MyHomePage> {
  String hah='assets/images/banner.jpg';
  Menu m=new Menu();
  List<cardmake> cm1=new List();
  bool localimage=true;
  // save list inner information to single card
  List<cardmake> cm(Menu m){
    List<cardmake> cm=new List();
    for(int i=0;i<m.table_of_content.length;i++ ){
      for(int j=0;j<m.table_of_content[i].articles_list.length;j++){
        cm.add(cardmake(m.table_of_content[i].articles_list[j].title,
            m.table_of_content[i].articles_list[j].author,
            m.table_of_content[i].articles_list[j].id, m.table_of_content[i].category_name));

      }

    }return cm;
  }



  @override
  Widget build(BuildContext context) {


    m.fetchMenu("57", "simplified").then((resultMenu){
      setState(() {
        m=resultMenu;
        cm1=cm(m);
      });
    });




    return new Scaffold(

      appBar: new AppBar(
        title: new Text("溪水旁"),
      ),
      body:new ListView(
        physics: BouncingScrollPhysics(),
            children: cm1.map(buildCard).toList(),
        ),

    );
  }

  Widget buildCard(cardmake c){

    return InkWell(
      onTap: () {
        var route = new MaterialPageRoute(
          builder: (BuildContext context) =>
          new ArticleUI(valueOfID: c.id),
        );
        Navigator.of(context).push(route);
      },
      child:Padding(
        padding: const EdgeInsets.fromLTRB(0.0,0.5,0.0,0.5),
        child: Card(

          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(c.categoryName, style: TextStyle(color: Colors.black38,fontWeight: FontWeight.w500, fontSize: 16.0),),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0,12.0,0.0,12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(child: Text(c.title , style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),), flex: 3,),
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: 80.0,
                          width: 80.0,
                          child: Image.asset(hah,fit: BoxFit.cover,),
                          //Image.asset('assets/images/banner.jpg',fit: BoxFit.cover,),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(c.author , style: TextStyle(fontSize: 18.0),),
                        //Text(article.date + " . " + article.readTime, style: TextStyle(color: Colors.black45, fontWeight: FontWeight.w500),)
                      ],
                    ),
                    //Icon(Icons.bookmark_border),
                  ],
                )
              ],
            ),
          ),

        ),
      ) ,
    );

  }
}

class cardmake extends ArticlePiece{
  String categoryName;

  cardmake(String title, String author, String id,this.categoryName,):super.origin(title,author,id);


}