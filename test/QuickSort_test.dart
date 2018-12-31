import 'package:flutter_test/flutter_test.dart';
import 'package:xishuipang_android/support/QuickSort.dart';

void main() {
  var list=[5,6,8,9,1,2];

  test('Quick Sort Algorithmn testify', () {
    var value=quickSort(list);
    expect(value, [9,8,6,5,2,1]);
  });




}