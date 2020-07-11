# CPF Util

A lib to generate, validate and format Brazilian's CPF

### Usage

```dart
final cpf = CPF();

cpf.generate() // This will generate 1 valid CPF
cpf.validate() // This will validate a given CPF (Must be a String)
cpf.format() // This will format a given CPF (Can be a String or List<int>)
```