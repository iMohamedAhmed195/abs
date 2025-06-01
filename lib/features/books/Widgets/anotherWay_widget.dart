import 'package:flutter/material.dart';
import 'package:new_ilearn/core/widgets/text_widget.dart';
import 'package:new_ilearn/core/utils/app_strings.dart';

import '../../../exports.dart';

class AnotherWay extends StatelessWidget {
  const AnotherWay({super.key, required this.onClick});

  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Row(
        children: [
           TextWidget(text: AppStrings.anotherWay.trans, fontSizeText: 15),
          IconButton(
              onPressed:onClick,
              icon: const Icon(
                Icons.close,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}
