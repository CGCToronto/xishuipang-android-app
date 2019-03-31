import 'package:xishuipang_android/UI/Main.dart';
import 'package:flutter/material.dart';
import 'package:xishuipang_android/Modal_Service/Menu.dart';
import 'package:xishuipang_android/UI/AritcleMenu/ArticleUI.dart';
import 'package:xishuipang_android/Modal_Service/VolumeList.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:xishuipang_android/UI/MainMenu/listItem.dart';
import 'package:xishuipang_android/UI/MainMenu/cardTile.dart';
import 'package:xishuipang_android/Modal_Service/Article.dart';
import 'package:xishuipang_android/UI/MainMenu/IssueMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:xishuipang_android/UI/MainMenu/VolumeListMenu.dart';
import "package:pull_to_refresh/pull_to_refresh.dart";
import 'package:async_loader/async_loader.dart';


class MainPart extends StatefulWidget {

  MainPart({Key key,}) : super(key: key);
  @override
  _MainPart createState() => new _MainPart();

}

class _MainPart extends State<MainPart> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey= new GlobalKey<RefreshIndicatorState>();
  List<int> volumeList;
  String volumeNumber = "溪水旁";
  List<cardTile> ct2 = [];

  @override
  void initState() {
    super.initState();
    _loadData();

  }

  //load all infor that you need at initial
  _loadData() async {
    List<int> IssueVolume1 = await (new IssueVolumeList().fetchVolumeList());
    int latestNumber = IssueVolume1[0];
    setState(() {
      this.volumeNumber = latestNumber.toString();
      this.volumeList = IssueVolume1;
    });
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
  }


  Future<Null> _refresh() async {
    Menu m2 = await new Menu().fetchMenu(this.volumeNumber, 'simplified');
    List<cardTile> ct3 = [];
      for (int i = 0; i < m2.table_of_content.length; i++) {
        for (int j = 0; j < m2.table_of_content[i].articles_list.length; j++) {
          Article a = await (new Article().fetchArticle(m2.volume_number,
              m2.table_of_content[i].articles_list[j].id, m2.character));

          ct3.add(new cardTile.origin(
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
      //print(ct2.length);
    setState(() {
      this.ct2=ct3;
    });
  }


  //receive data and render scaffold
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: VolumeListMenu(
          volumeList1: volumeList, volumeNumber: volumeNumber,),
        actions: <Widget>[

          new IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: '跳转',
              onPressed: () {
                setState(() {
                  this.volumeNumber=VolumeListMenu.volumeNumber;
                });
                _refreshIndicatorKey.currentState.show();
              })
        ],
      ),


      //body: this.currentPage(this.volumeNumber),
      body:RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: _refresh,
          child:new ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount:ct2.length,
            itemBuilder: (context, index) {
              return new ListItem(ct2[index]);
      },
    ),

    ),
    );

}

}

