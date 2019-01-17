import 'dart:async';
import 'package:xishuipang_android/UI/main.dart';
import 'package:flutter/material.dart';
import 'package:xishuipang_android/Modal_Service/Article.dart';
import 'package:share/share.dart';
import 'package:xishuipang_android/UI/AritcleMenu//FavouriteButton.dart';
import  'package:xishuipang_android/UI/AritcleMenu/Content.dart';


//Demo fetch article's values
//String image="http://www.xishuipang.com/content/volume_57/images/9_yx.jpeg" ;
//Article as=Article();
//bool fetchSuccess=false;

class sliver_test extends State<MyHomePage> {

  @override
  Widget build(BuildContext context){

//    //fetch data and transfer to plain object
//    as.fetchArticle("57", "9_yx_s", "simplified").then((resultArticle){
//      setState(() {
//        as=resultArticle;
//        fetchSuccess=true;
//      });
//    });

    return Scaffold(
      body:_buildScrollable(context),
    );

  }

  Widget _buildScrollable(BuildContext context){
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text('Hello'),
        ),

      ],
    );
  }




}