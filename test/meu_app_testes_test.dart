import 'dart:js_util';

import 'package:meu_app_testes/meu_app_testes.dart' as app;
import 'package:test/test.dart';

void main() {
  test('Calcula o valor do produto com desconto e sem porcentagem', () {
    expect(app.calcularDesconto(1000, 150, false), equals(850));
  });

  test(
      'Calcula o valor do produto com desconto e sem porcentagem passando o valor do produto zerado',
      () {
    expect(() => app.calcularDesconto(0, 150, false),
        throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Calcula o desconto do produto com porcentagem', () {
    expect(app.calcularDesconto(1000, 15, true), equals(850));
  });

  test('Calcula o valor do produto com desconto zerado e sem porcentagem', () {
    expect(() => app.calcularDesconto(1000, 0, false),
        throwsA(TypeMatcher<ArgumentError>()));
  });

  group("Calcula o valor do produto com desconto: ", () {
    var valuesToTest = {
      {'valor': 1000, 'desconto': 150, 'percentual': false}: 850,
      {'valor': 1000, 'desconto': 15, 'percentual': true}: 850,
    };
    valuesToTest.forEach((values, expected) {
      test('Entrada: $values Esperado: $expected', () {
        expect(
            app.calcularDesconto(
                double.parse(values["valor"].toString()),
                double.parse(values["desconto"].toString()),
                values["percentual"] == true),
            equals(expected));
      });
    });
  });

  group("Calcula o valor informando valores zerados, deve gerar erro. ", () {
    var valuesToTest = {
      {'valor': 0, 'desconto': 150, 'percentual': false},
      {'valor': 1000, 'desconto': 0, 'percentual': true},
    };
    for (var values in valuesToTest) {
      test('Entrada: $values', () {
        expect(
            () => app.calcularDesconto(
                double.parse(values["valor"].toString()),
                double.parse(values["desconto"].toString()),
                values["percentual"] == true),
            throwsA(TypeMatcher<ArgumentError>()));
      });
    }
  });

  test('Testar conversão para uppercase', () {
    expect(app.convertToUpper("dio"), equals("DIO"));
  });

  test('Testar conversão para uppercase teste 2', () {
    expect(app.convertToUpper("dio"), equalsIgnoringCase("dio"));
  });

  test('Valor maior que 50', () {
    expect(app.retornaValor(50), greaterThanOrEqualTo(50));
  });

  test('Começa com', () {
    expect(app.convertToUpper("dio"), startsWith("D"));
  });

  test('Valor diferente', () {
    expect(app.retornaValor(50), isNot(equals(49)));
  });
}
