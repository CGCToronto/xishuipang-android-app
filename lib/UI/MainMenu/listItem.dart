import 'package:flutter/material.dart';
import 'package:xishuipang_android/UI/MainMenu/MainUI.dart';
import 'package:xishuipang_android/UI/MainMenu/cardTile.dart';
import 'package:xishuipang_android/button/shareButton.dart';
import 'package:xishuipang_android/Modal_Service/Article.dart';
import 'package:xishuipang_android/Modal_Service/Menu.dart';
import 'package:xishuipang_android/UI/AritcleMenu/ArticleUI.dart';

//每个cardtile 信息模板
class ListItem extends StatelessWidget {
  // save list inner information to single cardTile
  static Future<List<cardTile>> ct1() async {
    Menu m2 = await new Menu().fetchMenu(volumeNumber, 'simplified');
    List<cardTile> ct2 = [];
    for (int i = 0; i < m2.table_of_content.length; i++) {
      for (int j = 0; j < m2.table_of_content[i].articles_list.length; j++) {
        Article a = await (new Article().fetchArticle(m2.volume_number,
            m2.table_of_content[i].articles_list[j].id, m2.character));

        ct2.add(new cardTile.origin(
          a.volume_number,
          m2.table_of_content[i].articles_list[j].id,
          //id
          m2.character,
          // character
          m2.table_of_content[i].articles_list[j].author,
          //author
          m2.table_of_content[i].category_name,
          //category_name
          m2.table_of_content[i].articles_list[j].title,
          //title
          a.pictureList,
          //picture could be used
          a.sentenceList, //sentnce could be used
        ));
      }
    }
    return ct2;
  }

  cardTile item;

  ListItem(this.item);

  Widget top1Section(BuildContext context) => new Container(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Text('-   ${item.category}   -'
                  //fontStyle: ,
                  ),
            ),
          ],
        ),
      );

  Widget top2Section(BuildContext context) => new Container(
        child: new Column(
          children: <Widget>[
            new Row(
              children: [
                Column(children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Text(
                      '${item.title}',
                    ),
                  ),
                ]),
              ],
            ),
            new Row(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Text(
                    '文/${item.author}',
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget middle1Section(BuildContext context) => new Container(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: new Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 300.0,
                    height: 200.0,
                    child: item.pictureList.length == 0
                        ? Image.asset(
                            'assets/images/banner.jpg',
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            '${item.pictureList[0]}',
                            fit: BoxFit.cover,
                          )),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Text(
                    '\"${item.sentenceList[0]}...\"',
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget bottom1Section(BuildContext context) => new Container(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Text(
                '第${item.volume_number}期',
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              //child: shareButton(item),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("taptap");
        var route = new MaterialPageRoute(
            builder: (BuildContext context) => new ArticleUI(
                valueOfID: item.article_id, volumenumber: item.volume_number));
        Navigator.of(context).push(route);
      },
      child:
          //最外层容器
          new Container(
        decoration: BoxDecoration(
          color: Colors.white,
          //仅加一个底部边 这样整个列表的每项信息下面都会有一条边
          border:
              Border(bottom: BorderSide(width: 6, color: Color(0xFFd9d9d9))),
        ),
        height: 450.0,
        //按下回调处理 空实现
        //整体水平方向布局
        child: Column(
          children: <Widget>[
            top1Section(context),
            top2Section(context),
            middle1Section(context),
            bottom1Section(context)
          ],
        ),
      ),
    );
  }
}
