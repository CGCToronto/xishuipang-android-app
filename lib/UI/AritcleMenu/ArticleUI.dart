import 'dart:async';
import 'package:xishuipang_android/UI/main.dart';
import 'package:flutter/material.dart';
import 'package:xishuipang_android/Modal_Service/Article.dart';
import 'package:share/share.dart';
import 'package:xishuipang_android/UI/AritcleMenu//FavouriteButton.dart';
import  'package:xishuipang_android/UI/AritcleMenu/Content.dart';


//Demo fetch article's values
//need to create a image class
String image="http://www.xishuipang.com/content/volume_57/images/9_yx.jpeg" ;
Article as=Article();
bool fetchSuccess=false;


class ArticleUI extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {

    as.fetchArticle("57", "9_yx_s", "simplified").then((resultArticle){
      setState(() {
        as=resultArticle;
        fetchSuccess=true;
      });
    });


//        //article part
//        List<Widget> getTextWidgets(List<String> strings)
//        {
//          List<Widget> list = new List<Widget>();
//
//          for(var i = 0; i < strings.length; i++){
//            //add function to detect image too
//            list.add(new Text(strings[i],softWrap: true,));
//          }
//
//          return list;
//          }



    //appbar setting
    List<Widget> app_bar_button = [
      //FavoriteWidget(), // create favourite button
      IconButton(
        icon: const Icon(Icons.share),
        tooltip: '分享',
        onPressed: () {
          /* ... */
          final RenderBox box = context.findRenderObject();
          Share.share(
              '欢迎阅读溪水旁第'+as.volume_number+'期\n'
              '主题:'+as.category+'\n文章：《'+as.title+'》\n作者:'+as.author+'\n'
              '你可以登入AppStore或者PlayStore下载手机客户端\n'
              '或者登入网页：\nhttp://www.xishuipang.com/article?volume='+as.volume_number+'&articleId='+as.article_id+'进行阅读，\n'
              '谢谢你的支持，\n'
              '以上分享来自溪水旁手机客户端',
              sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
        },
      ),
    ];

    // main return
    return fetchSuccess == false? const CircularProgressIndicator():
      new Scaffold(

      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: 220,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                 image ,
                  fit: BoxFit.cover,
                ),
              ),
              actions: app_bar_button),


          //border line
          Container(
            height: 4,
            color: const Color(0xffbceac5a),
          ),





          //first row with two texts have space between
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(15.0),
                child:
                Text(
                  as.category ,
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
                  '第'+as.volume_number+'期',
                  style: TextStyle(
                    color: const Color(0xffbadacaa),
                    fontSize: 10.0,
                    //fontStyle: ,
                  ),
                ),
              )
            ],
          ),

          // Article title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 0, 80, 10),
                    child: Text(
                      as.title,

                      style: TextStyle(
                        color: const Color(0xffb4c4b4a),
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        //fontStyle: ,
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),


          //author
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  as.author,
                  style: TextStyle(
                    color: const Color(0xffbadacaa),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    //fontStyle: ,
                  ),
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}

