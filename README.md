# CPF Util

A Dart package to generate, validate and format Brazilian's CPF in an easy way.

[![style: effective dart](https://img.shields.io/badge/style-effective_dart-40c4ff.svg)](https://pub.dev/packages/effective_dart)
![GitHub repo size](https://img.shields.io/github/repo-size/pedrolemoz/cpf_util?color=40c4ff)
[![Project Owner](https://img.shields.io/badge/owner-Pedro%20Lemos-40c4ff)](https://github.com/pedrolemoz/)
![GitHub stars](https://img.shields.io/github/stars/pedrolemoz/cpf_util?style=social)
[![GitHub forks](https://img.shields.io/github/forks/pedrolemoz/cpf_util?style=social)](https://github.com/pedrolemoz/cpf_util/fork)

### Use cases

You can validate data in a `TextField`, or even format it without any effort, inside a Flutter application.

Also, you can generate valid CPFs, for testing purposes.

### Usage

```dart
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
```
