 import 'package:flutter/material.dart';

import '../../exports.dart';

class ViewAll extends StatelessWidget {
  const ViewAll(
      {super.key,
      required this.title,
      required this.onClick,
      this.showViewAll = true});

  final String title;
  final Function() onClick;
  final bool showViewAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 16, start: 16, end: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            text: title,
            fontSizeText: 21,
            fontWeight: FontWeight.bold,
          ),
          Visibility(
            visible: showViewAll,
            child: TextButton(
                onPressed: onClick,
                child: TextWidget(
                  text: AppStrings.viewAll,
                  fontSizeText: 14,
                  colorText: Theme.of(context).indicatorColor,
                )),
          )
        ],
      ),
    );
  }
}
