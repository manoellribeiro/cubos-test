import 'package:cubos_test/app/core/functions/getYearFromReleaseDate.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('getYearFromReleaseDate is returning the correct value', () {
    expect(getYearFromReleaseDate("2020-07-07"), "2020");
  });
}
