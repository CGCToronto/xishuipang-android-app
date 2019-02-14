import 'dart:async';
import 'package:xishuipang_android/UI/main.dart';
import 'package:flutter/material.dart';
import 'package:xishuipang_android/Modal_Service/Article.dart';
import 'package:share/share.dart';
import 'package:xishuipang_android/UI/AritcleMenu//FavouriteButton.dart';
import 'package:flutter/foundation.dart';

class ArticleUI extends StatefulWidget{
  final String valueOfID;

  ArticleUI({Key key, this.valueOfID}) : super(key: key);
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
    as.fetchArticle("57", widget.valueOfID, "simplified").then((resultArticle) {
      setState(() {
        as = resultArticle;
        fetchSuccess = true;
     });
    });

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
              '欢迎阅读溪水旁第' +
                  as.volume_number +
                  '期\n'
                  '主题:' +
                  as.category +
                  '\n文章：《' +
                  as.title +
                  '》\n作者:' +
                  as.author +
                  '\n'
                  '你可以登入AppStore或者PlayStore下载手机客户端\n'
                  '或者登入网页：\nhttp://www.xishuipang.com/article?volume=' +
                  as.volume_number +
                  '&articleId=' +
                  as.article_id +
                  '进行阅读，\n'
                  '谢谢你的支持，\n'
                  '以上分享来自溪水旁手机客户端',
              sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
        },
      ),
    ];

    return
      fetchSuccess == false
        ? const CircularProgressIndicator()
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
          backgroundColor: Colors.white,
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
            fontFamily: 'pfsc',
            fontSize: 16.0,
              fontWeight: FontWeight.w600,
              letterSpacing:3.0,
              wordSpacing: 6.0,

              height:1.5,
          ),)
      );
    }
  }

}
