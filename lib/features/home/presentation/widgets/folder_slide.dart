
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_ilearn/core/utils/app_assets.dart';
import 'package:new_ilearn/core/utils/app_strings.dart';
import 'package:new_ilearn/core/widgets/viewAll_widget.dart';
import 'package:new_ilearn/features/home/presentation/widgets/foldersAndBooks_widgets.dart';

import '../../../../exports.dart';

class FolderSlide extends StatelessWidget {
    FolderSlide({
    super.key,
  });
  bool show = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ViewAll(
          showViewAll: true,
          title: AppStrings.volumes.trans,
          onClick: () {
             // Routes.foldersScreen.moveTo();
          },
        ),
        show
            ? SizedBox(
          height: MediaQuery.of(context).size.height * 0.21.h,
          child: ListView.builder(
            padding: const EdgeInsetsDirectional.symmetric(
                vertical: 10, horizontal: 16),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return FoldersAndBooks(
                width: MediaQuery.of(context).size.width * 0.32.w,
                idFolder: "${index + 1}",
                isBook: false,
                isShowDeleteButton: false,
                delete: () {},
                onClick: () {
                  show  =! show;
                },
                heightImage: 90.h,
                image: AppAssets.error,
                title: AppStrings.egypt.trans,
              );
            },
          ),
        )
            : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ButtonWidget(
            title:
            'انتقل لاضافة مجلدات وتمتع بمميزات التطبيق الفريدة',
            onClick: () {

            },
          ),
        ),
      ],
    );
  }
}
