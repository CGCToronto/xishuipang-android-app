import 'package:flutter_test/flutter_test.dart';
import 'package:xishuipang_android/Modal_Service/Article.dart';
import "dart:async";

import 'package:xishuipang_android/Modal_Service/Article.dart';

void main() {
  test('article parse', () async{
    Article a=await Article().fetchArticle("57","11_qa_s" , "simplified");
    expect(a.article_content[20],"http://www.xishuipang.com/content/volume_57/images/11_qa.jpeg");
    expect(a.volume_number, "57");
  });
}