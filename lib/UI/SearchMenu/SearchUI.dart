import 'package:flutter/material.dart';
import 'package:xishuipang_android/Support/TouchCallBack.dart';
import 'package:xishuipang_android/Modal_Service/Search.dart';
//搜索模块
class SearchUI extends StatefulWidget {
  @override
  SearchState createState() => new SearchState();
}

class SearchState extends State<SearchUI> {
  //定义焦点节点
  FocusNode focusNode = new FocusNode();

  //请求获取焦点
  _requestFocus() {
    FocusScope.of(context).requestFocus(focusNode);
    return focusNode;
  }


  //搜索页面渲染
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //顶部留一定距离
        margin: const EdgeInsets.only(top: 25.0),
        //整体垂直布局
        child: Column(
          //水平方向居中
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //顶部导航栏 包括返回按钮 搜索框及麦克风按钮
            Stack(
              children: <Widget>[
                //使用触摸回调组件
                TouchCallBack(
                  isfeed: false,
                  onPressed: () {
                    //使用导航器返回上一个页面
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 45.0,
                    margin: const EdgeInsets.only(left: 12.0, right: 10.0),
                    //添加返回按钮
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                    ),
                  ),
                ),
                //搜索框容器
                Container(
                  alignment: Alignment.centerLeft,
                  height: 45.0,
                  margin: const EdgeInsets.only(left: 50.0, right: 10.0),
                  //搜索框底部边框
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.green)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        //输入框
                        child: TextField(
                          //请求获取焦点
                          focusNode: _requestFocus(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                          onChanged: (String text) {},
                          decoration: InputDecoration(
                              hintText: '搜索', border: InputBorder.none),
                        ),
                      ),

                    ],
                  ),
                ),

                Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}