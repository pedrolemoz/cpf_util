import 'dart:math';

import 'package:cpf_util/src/errors.dart';

import '../cpf_util.dart';

class CPFUtil implements ICPFUtil {
  final random = Random();

  @override
  String format(String cpf) {
    if (cpf.length != 11) throw InvalidCPFError();

    final elements = cpf.split('');

    elements.insert(3, '.');
    elements.insert(7, '.');
    elements.insert(11, '-');

    return elements.reduce((a, b) => a += b);
  }

  @override
  String generate({int? state}) {
    var cpf = List<int>.generate(
      9,
      (index) => index == 8 ? state ?? random.nextInt(9) : random.nextInt(9),
      growable: true,
    );

    cpf.insert(9, _calculateVerifyingDigit(cpf));
    cpf.insert(10, _calculateVerifyingDigit(cpf));

    return format(cpf.map<String>((elements) => elements.toString()).reduce((a, b) => a += b));
  }

  int _calculateVerifyingDigit(List<int> cpf) {
    var sum = 0;
    var index = cpf.length + 1;

    cpf.forEach((element) {
      sum += element * index;
      index -= 1;
    });

    return ((sum % 11) < 2) ? 0 : 11 - (sum % 11);
  }

  @override
  bool validate(String cpf, {int? state}) {
    if (cpf.length < 11) return false;

    cpf = cpf.replaceAll('.', '').replaceAll('-', '');

    final invalidCombinations = List.generate(10, (index) => '${"$index" * 11}');

    if (invalidCombinations.contains(cpf)) return false;

    var parsedCPF = cpf.split('').map<int>((element) => int.parse(element)).toList();

    return (state != null ? parsedCPF[8] == state : true) &&
        _calculateVerifyingDigit(parsedCPF.sublist(0, 9)) == parsedCPF[9] &&
        _calculateVerifyingDigit(parsedCPF.sublist(0, 10)) == parsedCPF[10];
  }
}
