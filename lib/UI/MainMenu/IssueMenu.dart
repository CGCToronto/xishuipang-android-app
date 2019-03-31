//import 'package:flutter/material.dart';
//import 'package:xishuipang_android/UI/MainMenu/listItem.dart';
//import 'package:xishuipang_android/UI/MainMenu/MainUI.dart';
//import 'package:xishuipang_android/UI/MainMenu/cardTile.dart';
//import 'package:xishuipang_android/Modal_Service/Menu.dart';
//import 'dart:async';
//import 'package:async_loader/async_loader.dart';
//import 'package:xishuipang_android/Modal_Service/Article.dart';
//
//
//
//class IssueMenu extends StatefulWidget {
//  String VolumNuber;
//
//  IssueMenu({Key key, this.VolumNuber}) : super(key: key);
//
//  @override
//  _IssueMenu createState() => new _IssueMenu();
//}
//
//class _IssueMenu extends State<IssueMenu> {
//
////   ct1(String volumeNumber) async {
////    Menu m2 = await new Menu().fetchMenu(volumeNumber, 'simplified');
////    List<cardTile> ct2 = [];
////    if(m2!=null){
////
////      for (int i = 0; i < m2.table_of_content.length; i++) {
////        for (int j = 0; j < m2.table_of_content[i].articles_list.length; j++) {
////          Article a = await (new Article().fetchArticle(m2.volume_number,
////              m2.table_of_content[i].articles_list[j].id, m2.character));
////
////          ct2.add(new cardTile.origin(
////            a.volume_number,
////            m2.table_of_content[i].articles_list[j].id,
////            //id
////            m2.character,
////            // character
////            m2.table_of_content[i].articles_list[j].author,
////            //author
////            m2.table_of_content[i].category_name,
////            //category_name
////            m2.table_of_content[i].articles_list[j].title,
////            //title
////            a.pictureList,
////            //picture could be used
////            a.sentenceList, //sentnce could be used
////          ));
////        }
////      }
////      return ct2;
////    }
////    else{
////      return null;
////    }
////
////  }
//
//
//  @override
//  Widget build(BuildContext context) {
//    return new FutureBuilder( future: ct1(this.widget.VolumNuber),
//        builder: (BuildContext context, AsyncSnapshot snapshot) {
////          if (snapshot.hasData) {
////            return ListView.builder(
////              physics: BouncingScrollPhysics(),
////              itemCount: snapshot.data.length,
////              itemBuilder: (context, index) {
////                return new ListItem(snapshot.data[index]);
////              },
////            );
////          }
//
////         return snapshot.hasData==false? new Center(
////            child: CircularProgressIndicator(
////              valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),),
////
////          ): new ListView.builder(
////            physics: BouncingScrollPhysics(),
////            itemCount: snapshot.data.length,
////            itemBuilder: (context, index) {
////              new ListItem(snapshot.data[index]);
////            },
////          );
//          if (snapshot.hasData) {
//
//            return new ListView.builder(
//              physics: BouncingScrollPhysics(),
//              itemCount: snapshot.data.length,
//              itemBuilder: (context, index) {
//                return new ListItem(snapshot.data[index]);
//              },
//            );
//          }
////          if (snapshot.hasError) {
////            Center(
////              child: Text("${snapshot.error}"),
////
////            );
////          }
//          else {
//            return new Center(
//              child: CircularProgressIndicator(
//                valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),),
//
//            );
//          }
//        });
//  }
//}
