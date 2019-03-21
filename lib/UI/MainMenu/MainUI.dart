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


class MainPart extends StatefulWidget {

  MainPart({Key key,}) : super(key: key);
  @override
  _MainPart createState() => new _MainPart();

}

class _MainPart extends State<MainPart> {
  List<int> volumeList;
  String volumeNumber = "溪水旁";

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
  }

  currentPage(String volumeNumber) {
    return IssueMenu(ct11: ListItem.ct1(volumeNumber));
  }





  //receive data and render scaffold
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: VolumeListMenu(
          volumeList1: volumeList, volumeNumber: volumeNumber,),
        actions: <Widget>[

          CupertinoButton(

            onPressed: () {
              setState(() {
                this.volumeNumber = VolumeListMenu.volumeNumber;
                print(this.volumeNumber);
              });
            },
            child: Text("跳转", style: TextStyle(
              color: Colors.white,
              //fontStyle: ,
            ),),
          ),
        ],
      ),


      body: this.currentPage(this.volumeNumber),

    );
  }


}

