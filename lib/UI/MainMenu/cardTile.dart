import 'package:xishuipang_android/main.dart';
import 'package:flutter/material.dart';
import 'package:xishuipang_android/Modal_Service/Menu.dart';
import 'package:xishuipang_android/UI/AritcleMenu/ArticleUI.dart';
import 'package:xishuipang_android/Modal_Service/VolumeList.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:xishuipang_android/UI/MainMenu/listItem.dart';
import 'package:xishuipang_android/Modal_Service/Article.dart';

class cardTile extends Article {
  cardTile(String character, String title, String author, String id,
      String categoryName, List<String> pictureList, List<String> sentenceList)
      : super();

  cardTile.origin(
      String volume_number,
      String article_id,
      String character,
      String author,
      String category,
      String title,
      List<String> pictureList,
      List<String> sentenceList)
      : super.origin(volume_number, article_id, character, author, category,
            title, pictureList, sentenceList);
}
