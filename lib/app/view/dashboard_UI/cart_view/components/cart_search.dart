// SEARCH TEXT FORM FIELD
import 'package:flutter/material.dart';
import 'package:shop_cart_app/app/config/themes/app_theme.dart';

class CartSearch extends StatelessWidget {
  final Function(bool) setOnSearchValue;
  final Function(String) setSearchValue;
  const CartSearch({super.key, required this.setOnSearchValue, required this.setSearchValue});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => setOnSearchValue(false),
      child: TextFormField(
        style: AppThemes.textStyles.cartSearch,
        onFieldSubmitted: setSearchValue,
        decoration: InputDecoration(
          hintText: 'Pesquisar',
          hintStyle: AppThemes.textStyles.cartSearchHintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
