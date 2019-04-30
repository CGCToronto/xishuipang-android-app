import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:xishuipang_android/UI/MainMenu/MainUI.dart';
import 'package:xishuipang_android/Modal_Service/Menu.dart';
import 'package:xishuipang_android/UI/MainMenu/listItem.dart';

class VolumeListMenu extends StatefulWidget {
  final List<int> volumeList1;
  static String volumeNumber = "溪水旁";

  VolumeListMenu({Key key, this.volumeList1, volumeNumber}) : super(key: key);

  @override
  _VolumeListMenu createState() => _VolumeListMenu();
}

class _VolumeListMenu extends State<VolumeListMenu> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        child: Text(
          VolumeListMenu.volumeNumber != "溪水旁" ? "第${VolumeListMenu
              .volumeNumber}期" : "溪水旁\u25FF",
          style: TextStyle(
            color: Colors.white,

            //fontStyle: ,
          ),
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 200.0,
                  child: CupertinoPicker(
                      itemExtent: 40.0,
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          VolumeListMenu.volumeNumber =
                              this.widget.volumeList1[index].toString();
                        });

                        return VolumeListMenu.volumeNumber;
                      },

                      children: new List<Widget>.generate(
                          widget.volumeList1.length, (int index) {
                        return new Center(
                          child: Text(
                            '第' + widget.volumeList1[index].toString() + '期',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              //fontStyle: ,
                            ),
                          ),
                        );
                      }),
                    looping: true,
                  ),
                );
              });
        });
  }
}
