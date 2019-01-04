import 'package:flutter_test/flutter_test.dart';
import 'package:xishuipang_android/Modal_Service/VolumeList.dart';
import "dart:async";

void main() {
  test('Quick Sort Algorithmn on volume list', () async{
    int value = (await IssueVolumeList().fetchVolumeList())[0];
    expect(value,57);
  });
}