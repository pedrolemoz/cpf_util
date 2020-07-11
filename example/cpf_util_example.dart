import 'package:cpf_util/cpf_util.dart';

void main() {
  final cpf = CPF();

  cpf.generate(); // This will generate 1 valid CPF
  cpf.validate('352.753.028-27'); // This will validate a given CPF (Must be a String)
  cpf.format('35275302827'); // This will format a given CPF (Can be a String or List<int>)
}
