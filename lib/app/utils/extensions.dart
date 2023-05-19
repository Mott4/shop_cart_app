// adicionar funçoes em classes existentes

extension DoubleExt on double {
  String toBrazilianCurrency() {
    return 'R\$ ${toStringAsFixed(2).replaceAll('.', ',')}';
  }
}
