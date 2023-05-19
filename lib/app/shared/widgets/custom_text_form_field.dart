import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    this.initialValue = '',
    this.textInputType = TextInputType.text,
    this.hintText,
    this.icon,
    this.controller,
    this.showError,
    this.obscureText,
    this.inputFormatters,
    this.enabledPadding = true,
    this.height,
    this.width,
    this.textSize,
    this.centerText,
    this.validator,
    this.showErrorMessage,
    this.enabled = true,
    this.disableIcon,
    this.boldText,
    this.hintColor,
    this.onChanged,
    this.focusNode,
  }) : super(key: key);

  final String initialValue;
  final TextInputType textInputType;
  final String? hintText;
  final TextEditingController? controller;
  final IconData? icon;
  final void Function(String?)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool? showError;
  final bool? obscureText;
  final bool? enabled;
  final bool enabledPadding;
  final double? height;
  final double? width;
  final double? textSize;
  final bool? centerText;
  final bool? disableIcon;
  final bool? boldText;
  final bool? showErrorMessage;
  final Color? hintColor;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isEmpty = false;

  @override
  void dispose() {
    if (widget.focusNode != null) {
      widget.focusNode!.dispose();
    }
    super.dispose();
  }

  _formTextStyle() {
    return GoogleFonts.montserrat(
      color: widget.hintColor ?? const Color(0xFFA68150),
      fontSize: widget.boldText != null && widget.boldText == true ? 24 : widget.textSize ?? 15,
      fontWeight: FontWeight.w500,
      wordSpacing: 1.2,
    );
  }

  _hintTextStyle() {
    return GoogleFonts.montserrat(
      color: widget.hintColor ?? const Color.fromARGB(255, 226, 226, 226),
      fontSize: widget.textSize ?? 14,
      fontWeight: FontWeight.w500,
      wordSpacing: 1.2,
    );
  }

  _errorTextStyle() {
    return GoogleFonts.montserrat(
      color: Colors.red[600],
      fontWeight: FontWeight.w400,
      wordSpacing: 1.2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? MediaQuery.of(context).size.width,
      child: TextFormField(
        textAlign: widget.centerText != null && widget.centerText! == true ? TextAlign.center : TextAlign.left,
        inputFormatters: widget.inputFormatters ?? [],
        obscureText: widget.obscureText ?? false,
        cursorColor: const Color.fromARGB(255, 46, 46, 46),
        keyboardType: widget.textInputType,
        enabled: widget.enabled ?? true,
        controller: widget.controller,
        focusNode: widget.focusNode,
        style: _formTextStyle(),
        validator: widget.validator,
        onChanged: widget.onChanged,
        maxLines: 1,
        decoration: InputDecoration(
          fillColor: widget.enabled == null || widget.enabled == false
              ? const Color.fromARGB(255, 200, 200, 200)
              : widget.hintColor != null
                  ? const Color.fromARGB(255, 33, 33, 33)
                  : const Color.fromARGB(225, 225, 225, 225),
          prefixIcon: widget.disableIcon != null && widget.disableIcon == false
              ? Icon(widget.icon, color: widget.hintColor ?? const Color(0xFFA68150), size: 24)
              : null,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(style: BorderStyle.none, width: 0)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          hintStyle: _hintTextStyle(),
          hintText: widget.hintText,
          isDense: true,
          errorStyle: _errorTextStyle(),
          filled: true,
        ),
      ),
    );
  }
}
