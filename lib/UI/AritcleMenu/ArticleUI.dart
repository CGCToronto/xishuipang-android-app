import 'dart:async';
import 'package:xishuipang_android/UI/Main.dart';
import 'package:flutter/material.dart';
import 'package:xishuipang_android/Modal_Service/Article.dart';
import 'package:share/share.dart';
import 'package:flutter/foundation.dart';
import 'package:xishuipang_android/button/shareButton.dart';
import 'package:xishuipang_android/UI/MainMenu/listItem.dart';

class ArticleUI extends StatefulWidget{
  final String valueOfID;
  final String volumenumber;

  ArticleUI({Key key, this.valueOfID, this.volumenumber}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ArticleUI();
  }
}

class _ArticleUI extends State<ArticleUI> {
//Demo fetch article's values
  String image = "assets/images/banner.jpg";
  Article as = new Article();
  bool fetchSuccess = false;





  @override
  Widget build(BuildContext context) {
    //fetch data and transfer to plain object
    as.fetchArticle(
        widget.volumenumber.toString(), widget.valueOfID, "simplified").then((
        resultArticle) {
      setState(() {
        as = resultArticle;
        fetchSuccess = true;
     });
    });

    //appbar setting
    List<Widget> app_bar_button = [
      shareButton(as),
    ];

    return
      fetchSuccess == false
          ? Center(
        child: CircularProgressIndicator(),
      )
        :
      new Scaffold(
            body: _buildScrollable(context,as, app_bar_button),
          );
  }

  Widget _buildScrollable(BuildContext context,Article as, List<Widget> app_bar_button) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.black,
          expandedHeight: 220,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          actions: app_bar_button,
        ),

        SliverList(
          delegate: SliverChildListDelegate([
                          Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      as.category,
                      style: TextStyle(
                        color: const Color(0xffbceac5a),
                        fontSize: 16.0,
                        //fontStyle: ,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '第' + as.volume_number + '期',
                      style: TextStyle(
                        color: const Color(0xffbadacaa),
                        fontSize: 10.0,
                        //fontStyle: ,
                      ),
                    ),
                  )
                ],
              ),

              Row(
               mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(15, 0, 80, 10),
                        child: Text(
                          as.title,
                          style: TextStyle(
                            fontFamily: 'font1-data4-23',
                            color: const Color(0xffb4c4b4a),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            //fontStyle: ,
                          ),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '文/'+as.author,
                      style: TextStyle(
                        color: const Color(0xffbadacaa),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,

                        //fontStyle: ,
                      ),
                    ),
                  ),
                ],
              ),

          ])

        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
                  (context,index)=> _buildTile(context,as.article_content[index]),
            childCount:as.article_content.length,
          ),

        ),




      ],
    );
  }

  Widget _buildTile(BuildContext context,String paragraph) {
    RegExp exp = new RegExp("[http://www.xishuipang.com/content/].*");
    if (exp.hasMatch(paragraph)) {

      return Container(
          padding:const EdgeInsets.fromLTRB(15,2,40,2),
          child:Image.network(paragraph));
    } else {
      return Container(
          padding: const EdgeInsets.fromLTRB(15, 2, 40, 2),
          child: Text(paragraph,
          style: TextStyle(
            //fontFamily: 'pfsc',
            fontSize: 16.0,
              fontWeight: FontWeight.w600,
              letterSpacing:3.0,
            //wordSpacing: 6.0,

              height:1.5,
          ),)
      );
    }
  }

}
