
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:new_ilearn/core/utils/app_colors.dart';

import '../../exports.dart';

class ImageCached extends StatelessWidget {
  const ImageCached(
      {super.key,
      required this.urlImage,
      this.height = 30,
      this.sizeErrorIcon = 50,
      this.widthImage = double.infinity,
      this.boxFit,
      this.placeholderUrlImage,
      this.isUserImage = false});

  final String urlImage;
  final String? placeholderUrlImage;
  final double? height;
  final double sizeErrorIcon;
  final double widthImage;
  final BoxFit? boxFit;
  final bool isUserImage;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      imageUrl: urlImage,
      width: widthImage,
      fit: BoxFit.cover,
      placeholder: (context, url) => Center(
        child: Container(
          color: AppColors.primaryColor.withAlpha(30),
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(
                    AppAssets.logoName,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: LoadingAnimationWidget.fourRotatingDots(
                    color: AppColors.primaryColor, size: 30),
              )
            ],
          ),
        ),
      ),
      errorWidget: (context, url, error) {
        return isUserImage
            ? Image.asset(AppAssets.person)
            : Center(
                child: Container(
                  color: AppColors.primaryColor,
                  child: Center(
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        AppAssets.logoName,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
