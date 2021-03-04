import 'package:cpf_util/cpf_util.dart';

void main() {
  /// This will generate 100 valid CPF
  for (int i = 0; i < 100; i++) {
    print(CPFUtil.generate());
  }

  /// This will validate a given CPF (Must be a String)
  print(CPFUtil.validate('352.753.028-27', state: 8)); // -> true

  /// This will format a given CPF (Must be a String)
  print(CPFUtil.format('35275302827')); // -> 352.753.028-27
}
