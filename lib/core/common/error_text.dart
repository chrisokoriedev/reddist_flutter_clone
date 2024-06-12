import 'package:flutter/material.dart';

class ErrorTextWidget extends StatelessWidget {
  final String errorText;
  const ErrorTextWidget({super.key, required this.errorText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorText),
    );
  }
}
