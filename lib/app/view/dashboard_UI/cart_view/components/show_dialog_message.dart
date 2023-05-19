import 'package:flutter/material.dart';

class ShowDialogMessage extends StatelessWidget {
  final String title;
  final String confirmButtonText;
  final String cancelButtonText;
  final VoidCallback onConfirmedPressed;

  const ShowDialogMessage({
    super.key,
    required this.title,
    required this.confirmButtonText,
    required this.cancelButtonText,
    required this.onConfirmedPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      actions: [
        TextButton(
          child: Text(cancelButtonText),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(confirmButtonText),
          onPressed: () {
            onConfirmedPressed();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
