import 'package:cubos_test/app/core/functions/formatMoneyValueToDollar.dart';
import 'package:cubos_test/app/core/functions/formatMovieRuntime.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('formatMovieRuntime is returning the correct value', () {
    expect(formatMovieRuntime(100), "1h 40 min");
  });
}
