 import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../exports.dart';

class TileWidget extends StatelessWidget {
  const TileWidget(
      {super.key,
      required this.icon,
      required this.title,
      this.trailing,
      this.colorTile,
      this.onClickIcon,
      this.sizeTitle = 16});

  final String title;
  final String icon;
  final Widget? trailing;
  final Color? colorTile;
  final Function()? onClickIcon;
  final double sizeTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onClickIcon,
        contentPadding: EdgeInsetsDirectional.zero,
        title: TextWidget(
          text: title,
          fontSizeText: sizeTitle,
          colorText: colorTile ?? Theme.of(context).textTheme.titleLarge!.color,
          fontWeight: FontWeight.bold,
        ),
        leading: SvgPicture.asset(
          icon,
          color: colorTile ?? Theme.of(context).textTheme.titleLarge!.color,
        ),
        trailing: trailing ??
            IconButton(
                onPressed: onClickIcon,
                icon: Icon(
                  Icons.keyboard_arrow_left_rounded,
                  size: 35,
                  color: Theme.of(context).textTheme.titleLarge!.color,
                )));
  }
}
