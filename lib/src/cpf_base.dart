import 'dart:math' show Random;

/// A Dart package to generate, validate and format Brazilian's CPF
class CPFUtil {
  /// This method generate a valid CPF, which is returned as a String
  String generate() {
    final random = Random();

    var buildCPF =
        List<int>.generate(9, (_) => random.nextInt(9), growable: true);

    for (var i = 0; i < 2; i++) {
      buildCPF.add(_verifyingDigit(buildCPF));
    }

    var cpf = '';

    for (var i in buildCPF) {
      cpf += i.toString();
    }

    return format(cpf);
  }

  /// This private method returns the verifying digit for CPF, as an integer
  int _verifyingDigit(List<int> buildCPF) {
    var sum = 0;
    var index = buildCPF.length + 1;

    for (var i in buildCPF) {
      sum += i * index;
      index -= 1;
    }

    return ((sum % 11) < 2) ? 0 : 11 - (sum % 11);
  }

  /// This method formats the given String and returns it as a String
  String format(String buildCPF) {
    var getNumbers = <String>[];
    var formattedCPF = "";

    for (var i = 0; i < buildCPF.length; i++) {
      getNumbers.add(buildCPF[i]);
    }

    getNumbers.insert(3, ".");
    getNumbers.insert(7, ".");
    getNumbers.insert(11, "-");

    formattedCPF = getNumbers.reduce((value, element) => value += element);

    return formattedCPF;
  }

  /// This method checks if a given CPF is valid and returns true or false
  bool validate(String insertedCPF) {
    if (insertedCPF.length < 11) {
      return false;
    }

    insertedCPF = insertedCPF.replaceAll('.', '').replaceAll('-', '');

    var cpf = List<int>.generate(11, (index) => int.parse(insertedCPF[index]));

    return _verifyingDigit(cpf.sublist(0, 9)) == cpf[9] &&
            _verifyingDigit(cpf.sublist(0, 10)) == cpf[10]
        ? true
        : false;
  }
}
