import 'package:cpf_util/cpf_util.dart';

void main() {
  final cpfUtil = CPFUtil();

  /// This will generate 100 valid CPF
  for (int i = 0; i < 100; i++) {
    print(cpfUtil.generate());
  }

  /// This will validate a given CPF (Must be a String)
  print(cpfUtil.validate('352.753.028-27', state: 8)); // -> true
  print(cpfUtil.validate('000.000.000-00')); // -> false

  /// This will format a given CPF (Must be a String)
  print(cpfUtil.format('35275302827')); // -> 352.753.028-27
}
