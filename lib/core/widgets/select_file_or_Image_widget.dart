import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../exports.dart';

class BoxSelectFileOrImage extends StatelessWidget {
  const BoxSelectFileOrImage(
      {super.key,
      required this.icon,
      required this.title,
      this.subTitle,
      this.imagePath,
      this.isUploaded = false,
      this.extension,
      this.borderColor = Colors.black12,
      this.imagesPathList,
      this.multiImages,
      this.enabled = true,
      this.showClearIcon = false,
      this.useAnotherWay});

  final String icon;
  final String title;
  final String? subTitle;
  final String? imagePath;
  final List<File>? imagesPathList;
  final Widget? multiImages;
  final bool isUploaded;
  final String? extension;
  final Color borderColor;
  final bool enabled;
  final bool showClearIcon;
  final Function()? useAnotherWay;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.28.h,
          width: double.infinity,
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: 24.w, vertical: 24.h),
          decoration: BoxDecoration(
              color: enabled
                  ? Colors.transparent
                  : Theme.of(context).textTheme.titleSmall!.color,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: borderColor)),
          child: imagesPathList != null && imagesPathList!.isNotEmpty
              ? multiImages
              : imagePath != null
                  ? Image.file(
                      File(imagePath!),
                      height: 120.h,
                      width: 120.w,
                      fit: BoxFit.cover,
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        isUploaded
                            ? Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(bottom: 8),
                                child: SvgPicture.asset(iconFile(extension)))
                            : Column(
                                children: [
                                  Container(
                                      margin: EdgeInsetsDirectional.only(
                                          bottom: 12.h),
                                      padding:
                                          const EdgeInsetsDirectional.all(10),
                                      decoration: BoxDecoration(
                                          gradient: AppColors.buttonColor,
                                          shape: BoxShape.circle),
                                      child: Center(
                                          child: SvgPicture.asset(icon))),
                                  TextWidget(
                                    text: title,
                                    fontSizeText: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                ],
                              ),
                        Visibility(
                          visible: subTitle != null,
                          child: TextWidget(
                            textAlign: TextAlign.center,
                            text: subTitle ?? '',
                            fontSizeText: isUploaded ? 15 : 12,
                            colorText: isUploaded
                                ?  AppColors.primaryColor
                                : Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .color,
                          ),
                        ),
                      ],
                    ),
        ),
        Visibility(
          visible: showClearIcon,
          child: Padding(
            padding: const EdgeInsetsDirectional.all(5),
            child: Align(
              alignment: AlignmentDirectional.topEnd,
              child: InkWell(
                  onTap: useAnotherWay,
                  child: const Icon(
                    Icons.close,
                    color: Colors.red,
                  )),
            ),
          ),
        ),
      ],
    );
  }

  String iconFile(extension) {
    switch (extension) {
      case "pdf":
        return AppAssets.iconFile;
      case "doc":
        return AppAssets.docFile;
      default:
        return AppAssets.iconFile;
    }
  }
}
