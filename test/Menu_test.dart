import 'package:flutter_test/flutter_test.dart';
import 'package:xishuipang_android/Modal_Service/Menu.dart';
import "dart:async";


void main() {
  test('menu parse', () async{
    Menu m=await Menu().fetchMenu("57","simplified");
    expect(m.table_of_content[0].articles_list[0].title,"心灵祷告");
    expect(m.volume_number, "57");
  });
}