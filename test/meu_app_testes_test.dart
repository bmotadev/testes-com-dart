import 'package:meu_app_testes/meu_app_testes.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });

  test('calculate1', () {
    expect(calculate(), 41);
  });

  test('calculate2', () {
    expect(calculate(), greaterThan(41));
  });
}
