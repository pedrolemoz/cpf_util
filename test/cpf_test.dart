import 'package:cpf_util/cpf_util.dart';
import 'package:test/test.dart';

void main() {
  final cpfUtil = CPFUtil();

  test('Should return 100 valid CPFs', () {
    for (var i = 0; i < 100; i++) {
      expect(cpfUtil.validate(cpfUtil.generate()), true);
    }
  });

  test('Should return a valid CPF from São Paulo', () {
    expect(cpfUtil.validate(cpfUtil.generate(state: 8), state: 8), true);
  });

  test('Should return 352.753.028-27', () {
    cpfUtil.format('35275302827');
  });
}
