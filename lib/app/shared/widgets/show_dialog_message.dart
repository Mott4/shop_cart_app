import 'package:flutter/material.dart';

class ShowDialogMessage extends StatelessWidget {
  final String title;
  final String cancelButtonText;
  final String confirmButtonText;
  final Function onConfirmedPressed;

  const ShowDialogMessage({
    required this.title,
    required this.cancelButtonText,
    required this.confirmButtonText,
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
            Navigator.of(context).pop(false);
          },
        ),
        TextButton(
          child: Text(confirmButtonText),
          onPressed: () {
            onConfirmedPressed();

            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}
