import 'dart:async';
import 'package:xishuipang_android/UI/main.dart';
import 'package:flutter/material.dart';
import 'package:xishuipang_android/Modal_Service/Article.dart';
import 'package:share/share.dart';
import 'package:xishuipang_android/UI/AritcleMenu//FavouriteButton.dart';
import  'package:xishuipang_android/UI/AritcleMenu/Content.dart';




class sliver_test extends State<MyHomePage> {
//Demo fetch article's values
  String image="http://www.xishuipang.com/content/volume_57/images/9_yx.jpeg" ;
  Article as=Article();
  bool fetchSuccess=false;
  @override
  Widget build(BuildContext context){

    //fetch data and transfer to plain object
    as.fetchArticle("57", "9_yx_s", "simplified").then((resultArticle){
      setState(() {
        as=resultArticle;
        fetchSuccess=true;
      });
    });
    return Scaffold(
      body:buildScrollable(context),
    );

  }

  Widget buildScrollable(BuildContext context){



    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
    SliverAppBar(
    backgroundColor: Colors.black,
      expandedHeight: 220,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          image ,
          fit: BoxFit.cover,
        ),
      ),
    ),


    //border line
   Container(
      height: 4,
      color: const Color(0xffbceac5a),
    ),


    //first row with two texts have space between
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(15.0),
          child:
          Text(
            as.category ,
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
            '第'+as.volume_number+'期',
            style: TextStyle(
              color: const Color(0xffbadacaa),
              fontSize: 10.0,
              //fontStyle: ,
            ),
          ),
        )
      ],
    ),

    // Article title
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 80, 10),
              child: Text(
                as.title,

                style: TextStyle(
                  color: const Color(0xffb4c4b4a),
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  //fontStyle: ,
                ),
              ),
            ),
          ]),
        ),
      ],
    ),


    //author
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            as.author,
            style: TextStyle(
              color: const Color(0xffbadacaa),
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              //fontStyle: ,
            ),
          ),
        ),

      ],
    ),




      ],
    );
  }




}