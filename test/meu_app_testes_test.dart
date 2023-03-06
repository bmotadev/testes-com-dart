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
}
