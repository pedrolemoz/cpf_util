import 'package:cpf_util/cpf_util.dart';

void main() {
  final cpf = CPFUtil();

  // This will generate 100 valid CPF
  for (int i = 0; i < 100; i++) {
    print(cpf.generate());
  }

  // This will validate a given CPF (Must be a String)
  print(cpf.validate('352.753.028-27')); // -> true

  // This will format a given CPF (Must be a String)
  print(cpf.format('35275302827')); // -> 352.753.028-27
}
