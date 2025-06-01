 import 'package:flutter/material.dart';

import '../../../../exports.dart';

class GoalWidget extends StatelessWidget {
  const GoalWidget(
      {super.key,
      required this.colorBorder,
      required this.title,
      required this.visible,
      required this.add,
      required this.remove});

  final Color colorBorder;
  final String title;
  final bool visible;
  final Function() add;
  final Function() remove;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 10),
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: colorBorder, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            text: title,
            fontSizeText: 15,
            colorText:
                visible ? null : Theme.of(context).textTheme.titleMedium!.color,
          ),
          Visibility(
            visible: visible,
            child: Row(
              children: [
                IconButton(
                    onPressed: add,
                    icon: Icon(
                      Icons.add,
                      color: Theme.of(context).textTheme.titleMedium!.color,
                    )),
                IconButton(
                    onPressed: remove,
                    icon: Icon(Icons.remove,
                        color: Theme.of(context).textTheme.titleMedium!.color)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
