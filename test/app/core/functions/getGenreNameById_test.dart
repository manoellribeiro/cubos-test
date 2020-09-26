import 'package:cubos_test/app/core/functions/getGenreNameById.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('getGenreNameById is returning the correct value', () {
    expect(getGenreNameById(16), "Animação");
  });
}
