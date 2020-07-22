import 'dart:math' show Random;

class CPFUtil {
  String generate() {
    /// This method generate a valid CPF, which is returned as a String
    final Random random = Random();

    List<int> buildCPF =
        List<int>.generate(9, (_) => random.nextInt(9), growable: true);

    for (int i = 0; i < 2; i++) {
      buildCPF.add(_verifyingDigit(buildCPF));
    }

    String cpf = '';

    for (int i in buildCPF) {
      cpf += i.toString();
    }

    return format(cpf);
  }

  int _verifyingDigit(List<int> buildCPF) {
    /// This private method returns the verifying digit for CPF, as an integer
    int sum = 0;
    int index = buildCPF.length + 1;

    for (int i in buildCPF) {
      sum += i * index;
      index -= 1;
    }

    return ((sum % 11) < 2) ? 0 : 11 - (sum % 11);
  }

  String format(String buildCPF) {
    /// This method formats the given String and returns it as a String
    List<String> getNumbers = [];
    String formattedCPF = "";

    for (int i = 0; i < buildCPF.length; i++) {
      getNumbers.add(buildCPF[i]);
    }

    getNumbers.insert(3, ".");
    getNumbers.insert(7, ".");
    getNumbers.insert(11, "-");

    formattedCPF = getNumbers.reduce((value, element) => value += element);

    return formattedCPF;
  }

  bool validate(String insertedCPF) {
    /// This method checks if a given CPF is valid and returns true or false
    if (insertedCPF.length < 11) {
      return false;
    }

    insertedCPF = insertedCPF.replaceAll('.', '');
    insertedCPF = insertedCPF.replaceAll('-', '');

    List<int> cpf =
        List<int>.generate(11, (int index) => int.parse(insertedCPF[index]));

    return _verifyingDigit(cpf.sublist(0, 9)) == cpf[9] &&
            _verifyingDigit(cpf.sublist(0, 10)) == cpf[10]
        ? true
        : false;
  }
}
