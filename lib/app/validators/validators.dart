class Validators {
  Validators._(); // Impede que seja possível usar o Validators().anything(); somente Validator.anything();

  static String? productNameIsValid(String? value) {
    if (value!.isEmpty) {
      return 'Por favor, insira o nome do produto';
    }
    return null;
  }

  static String? isProductPriceValid(String? value) {
    if (value!.isEmpty) {
      return 'Por favor, insira o preço do produto';
    }
    if (double.tryParse(value) == null) {
      return 'Por favor, insira um valor numérico válido';
    }
    return null;
  }
}
