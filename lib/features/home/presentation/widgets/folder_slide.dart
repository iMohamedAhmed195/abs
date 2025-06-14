
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_ilearn/core/utils/app_assets.dart';
import 'package:new_ilearn/core/utils/app_strings.dart';
import 'package:new_ilearn/core/widgets/viewAll_widget.dart';
import 'package:new_ilearn/features/folders/presentation/managers/delete_folder_by_id_cubit.dart';
import 'package:new_ilearn/features/home/data/models/home_folders_model.dart';
import 'package:new_ilearn/features/home/presentation/widgets/folders_and_books_widgets.dart';

import '../../../../exports.dart';

class FolderSlide extends StatelessWidget {
    FolderSlide({
    super.key,required this.folders,
  });
  bool show = true;
  final List<Items> folders;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ViewAll(
          showViewAll: folders.length > 4,
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
            itemCount: folders.length,
            itemBuilder: (context, index) {
              return FoldersAndBooks(
                width: MediaQuery.of(context).size.width * 0.32.w,
                idFolder: "${folders[index].id}",
                isBook: false,
                isShowDeleteButton: false,
                delete: () {
                  print(folders[index].id);
                  // context.read<DeleteFolderByIdCubit>().deleteFolder(id: folders[index].id!);

                },
                onClick: () {
                  show  =! show;
                },
                heightImage: 90.h,
                image:   folders[index].imageUrl?? AppAssets.folderImage,
                title: folders[index].name!,
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
