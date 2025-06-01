 import 'package:flutter/material.dart';

import '../../exports.dart';

class ErrorBoxWidget extends StatelessWidget {
  const ErrorBoxWidget({super.key, required this.errorTitle});

  final String? errorTitle;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: errorTitle != null,
      child: Container(
        width: double.infinity,
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.30),
            borderRadius: BorderRadius.circular(8)),
        child: TextWidget(
          textAlign: TextAlign.center,
          text: errorTitle ?? '',
          fontSizeText: 12,
          colorText: Colors.red,
        ),
      ),
    );
  }
}
