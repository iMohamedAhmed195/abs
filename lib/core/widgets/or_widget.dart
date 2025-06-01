import 'package:flutter/material.dart';
import 'package:new_ilearn/core/widgets/text_widget.dart';

import '../../exports.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 16),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              height: 20,
              endIndent: 2,
            ),
          ),
          Center(
            child: TextWidget(
              text: AppStrings.or.trans,
              fontSizeText: 14,
              fontWeight: FontWeight.bold,
              colorText: Theme.of(context).highlightColor,
            ),
          ),
          const Expanded(
            child: Divider(
              indent: 2,
              height: 20,
            ),
          ),
        ],
      ),
    );
  }
}
