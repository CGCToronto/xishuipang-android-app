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

String volumeNumber = "溪水旁";
class MainPart extends StatefulWidget {

  MainPart({Key key,}) : super(key: key);
  @override
  _MainPart createState() => new _MainPart();

}

class _MainPart extends State<MainPart> {
  List<int> volumeList;


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
      volumeNumber = latestNumber.toString();
      volumeList = IssueVolume1;
    });
  }


  //receive data and render scaffold
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new VolumeListMenu(volumeList1: volumeList,),
      ),


      body: new IssueMenu(ct11: ListItem.ct1()),
    );
  }



}

