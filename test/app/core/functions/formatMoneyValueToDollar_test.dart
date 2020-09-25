import 'package:cubos_test/app/core/functions/formatMoneyValueToDollar.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  test('formatMoneyValueToDollar is returning the correct value', (){
    expect(formatMoneyValueToDolar(1000), "1,000");
  });

}