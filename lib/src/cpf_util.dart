import 'package:meta/meta.dart';

// Copyright (c) 2020, Pedro Lemos (https://github.com/pedrolemoz)

/// A Dart package to generate, validate and format Brazilian's CPF
@immutable
abstract class ICPFUtil {
  /// This method generates a valid CPF, which is returned as a String
  ///
  /// The optional `state` argument refers to the location of the CPF
  /// to be generated. If `state` isn't passed, then a **random state**
  /// will be selected in order to generate a valid CPF.
  ///
  /// Usage:
  ///
  ///
  /// ```dart
  /// final cpf = CPFUtil();
  /// // This will generate 100 valid CPF
  /// for (int i = 0; i < 100; i++) {
  ///   print(cpf.generate()); // -> '352.753.028-27'
  /// }
  /// ```
  ///
  ///
  /// You can check the state of a CPF by looking at the last number
  /// before the two verifiers digits.
  ///
  /// All the information about the generation and the states number
  /// can be obtained here:
  ///
  /// https://pt.wikipedia.org/wiki/Cadastro_de_Pessoas_F%C3%ADsicas
  String generate({int? state});

  /// This method generates a valid CPF from a given list of integers,
  /// which is returned as a String
  ///
  /// Usage:
  ///
  ///
  /// ```dart
  /// final cpf = CPFUtil();
  /// // This will generate a valid CPF from a given list of integers
  /// print(cpf.generateFrom([1, 2, 3])); // -> '123.356.111-19'
  /// ```
  ///
  ///
  /// You can check the state of a CPF by looking at the last number
  /// before the two verifiers digits.
  ///
  /// All the information about the generation and the states number
  /// can be obtained here:
  ///
  /// https://pt.wikipedia.org/wiki/Cadastro_de_Pessoas_F%C3%ADsicas
  String generateFrom(List<int> numbers);

  /// This method will format a given CPF, that should be a `String`
  ///
  ///
  /// Usage:
  ///
  ///
  /// ```dart
  /// final cpf = CPFUtil();
  /// // This will validate a given CPF (Must be a String)
  /// print(cpf.format('35275302827')); // -> '352.753.028-27'
  /// ```
  ///
  String format(String cpf);

  /// This method checks if a given CPF is valid and returns true or false
  ///
  /// The optional `state` argument refers to the location of the CPF
  /// to be generated.
  ///
  /// Usage:
  ///
  ///
  /// ```dart
  /// final cpf = CPFUtil();
  /// // This will validate a given CPF (Must be a String)
  /// print(cpf.validate('352.753.028-27')); // -> true
  /// ```
  ///
  ///
  /// You can check the state of a CPF by looking at the last number
  /// before the two verifiers digits.
  ///
  /// The state is not checked if ommited
  ///
  /// All the information about the validation and the states number
  /// can be obtained here:
  ///
  /// https://pt.wikipedia.org/wiki/Cadastro_de_Pessoas_F%C3%ADsicas
  bool validate(String cpf, {int? state});
}
