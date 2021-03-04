import 'dart:math' show Random;

/// A Dart package to generate, validate and format Brazilian's CPF
class CPFUtil {
  /// This method generate a valid CPF, which is returned as a String
  ///
  /// The optional [state] argument refers to the location of the CPF
  /// to be generated. If [state] isn't passed, then a random state
  /// will be selected in order to generate a valid CPF.
  ///
  /// Usage:
  ///
  ///     final cpf = CPFUtil();
  ///     // This will generate a CPF from São Paulo
  ///     cpf.generate(state: 8);
  ///
  /// You can check the state of a CPF by looking at the last number
  /// before the two verifiers digits.
  ///
  /// The argument follows the table below:
  ///
  ///
  /// 0 -	Rio Grande do Sul
  ///
  /// 1 -	Distrito Federal, Goiás, Mato Grosso, Mato Grosso do Sul, Tocantins
  ///
  /// 2 -	Amazonas, Pará, Roraima, Amapá, Acre, Rondônia
  ///
  /// 3 -	Ceará, Maranhão, Piauí
  ///
  /// 4 -	Paraíba, Pernambuco, Alagoas, Rio Grande do Norte
  ///
  /// 5 -	Bahia, Sergipe
  ///
  /// 6 -	Minas Gerais
  ///
  /// 7 -	Rio de Janeiro, Espírito Santo
  ///
  /// 8 -	São Paulo
  ///
  /// 9 -	Paraná, Santa Catarina
  static String generate({int? state}) {
    final random = Random();

    var buildCPF = List<int>.generate(
      9,
      (index) => index == 8 ? state ?? random.nextInt(9) : random.nextInt(9),
      growable: true,
    );

    for (var i = 0; i < 2; i++) {
      buildCPF.add(_verifyingDigit(buildCPF));
    }

    var cpf = buildCPF
        .map((e) => e.toString())
        .reduce((value, element) => value += element);

    return format(cpf);
  }

  /// This private method returns the verifying digit for CPF, as an integer
  static int _verifyingDigit(List<int> buildCPF) {
    var sum = 0;
    var index = buildCPF.length + 1;

    // ignore: avoid_function_literals_in_foreach_calls
    buildCPF.forEach((element) {
      sum += element * index;
      index -= 1;
    });

    return ((sum % 11) < 2) ? 0 : 11 - (sum % 11);
  }

  /// This method formats the given String and returns it as a String
  static String format(String buildCPF) {
    var getNumbers = <String>[];
    var formattedCPF = '';

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
  ///
  /// The optional [state] argument refers to the location of the CPF
  /// to be generated.
  ///
  /// Usage:
  ///
  ///     final cpf = CPFUtil();
  ///     // This will check if the given CPF is from São Paulo
  ///     cpf.validate('352.753.028-27', state: 8);
  ///
  /// You can check the state of a CPF by looking at the last number
  /// before the two verifiers digits.
  ///
  /// This isn't checked if [state] isn't passed.
  ///
  /// The argument follows the table below:
  ///
  ///
  /// 0 -	Rio Grande do Sul
  ///
  /// 1 -	Distrito Federal, Goiás, Mato Grosso, Mato Grosso do Sul, Tocantins
  ///
  /// 2 -	Amazonas, Pará, Roraima, Amapá, Acre, Rondônia
  ///
  /// 3 -	Ceará, Maranhão, Piauí
  ///
  /// 4 -	Paraíba, Pernambuco, Alagoas, Rio Grande do Norte
  ///
  /// 5 -	Bahia, Sergipe
  ///
  /// 6 -	Minas Gerais
  ///
  /// 7 -	Rio de Janeiro, Espírito Santo
  ///
  /// 8 -	São Paulo
  ///
  /// 9 -	Paraná, Santa Catarina
  static bool validate(String insertedCPF, {int? state}) {
    if (insertedCPF.length < 11) {
      return false;
    }

    insertedCPF = insertedCPF.replaceAll('.', '').replaceAll('-', '');

    var cpf = List<int>.generate(11, (index) => int.parse(insertedCPF[index]));

    return (state != null ? cpf[8] == state : true) &&
            _verifyingDigit(cpf.sublist(0, 9)) == cpf[9] &&
            _verifyingDigit(cpf.sublist(0, 10)) == cpf[10]
        ? true
        : false;
  }
}
