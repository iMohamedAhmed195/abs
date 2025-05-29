import 'dart:io';

import 'package:flutter/material.dart';
import 'package:new_ilearn/core/widgets/imageCash_widget.dart';

class ImageUser extends StatelessWidget {
  const ImageUser(
      {super.key,
      required this.image,
      this.height = 90,
      this.width = 90,
      this.margin = 0,
      this.padding = 5,
      this.fileImage = false,
      this.imageFile,
      this.colorBorder = Colors.white,
      this.imageAssets});

  final String image;
  final double height;
  final double width;
  final double margin;
  final double padding;
  final bool fileImage;
  final File? imageFile;
  final Color colorBorder;
  final String? imageAssets;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsetsDirectional.only(end: margin),
      padding: EdgeInsets.all(padding),
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: colorBorder,
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 0), blurRadius: 5)
          ]),
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: double.infinity,
        width: double.infinity,
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: fileImage && imageFile != null
            ? Image.file(
                imageFile!,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              )
            : imageAssets != null
                ? Image.asset(imageAssets!)
                : ImageCached(
                    urlImage: image,
                    isUserImage: true,
                  ),
      ),
    );
  }
}
