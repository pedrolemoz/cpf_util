import 'package:cpf_util/cpf_util.dart';
import 'package:test/test.dart';

void main() {
  final cpf = CPFUtil();

  test('Should return 100 valid CPFs', () {
    for (var i = 0; i < 100; i++) {
      expect(cpf.validate(cpf.generate()), true);
    }
  });

  test('Should return a valid CPF from São Paulo', () {
    expect(cpf.validate(cpf.generate(state: 8), state: 8), true);
  });

  test('Should return 352.753.028-27', () {
    cpf.format('35275302827');
  });
}
