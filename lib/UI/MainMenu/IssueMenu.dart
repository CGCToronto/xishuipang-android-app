import 'package:flutter/material.dart';
import 'package:xishuipang_android/UI/MainMenu/listItem.dart';
import 'package:xishuipang_android/UI/MainMenu/MainUI.dart';
import 'package:xishuipang_android/UI/MainMenu/cardTile.dart';
import 'package:xishuipang_android/Modal_Service/Menu.dart';

class IssueMenu extends StatefulWidget {
  final Future<List<cardTile>> ct11;

  const IssueMenu({Key key, this.ct11}) : super(key: key);

  @override
  _IssueMenu createState() => new _IssueMenu();
}

class _IssueMenu extends State<IssueMenu> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.ct11,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return new ListItem(snapshot.data[index]);
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),),
          
            );
          }
        });
  }
}
