import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:new_ilearn/features/folders/data/models/folders_model.dart';
import 'package:new_ilearn/features/home/data/models/home_folders_model.dart';
import 'package:new_ilearn/features/home/presentation/widgets/foldersAndBooks_widgets.dart';

import '../../../../exports.dart';

class FoldersGrid extends StatelessWidget {
  const FoldersGrid({super.key, required this.folders,  });
final List<Folders> folders;
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextWidget(text: AppStrings.volumes.trans, fontSizeText: 18),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          itemCount: folders.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 0.99,
            mainAxisSpacing: 17,
            crossAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            final folder = folders[index];
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 400),
              columnCount: folders.length,
              child: ScaleAnimation(
                child: FadeInAnimation(
                  child: FoldersAndBooks(
                    idFolder: folder.id!,
                    isBook: false,
                    radius: 16,
                    image: folder.fullImageUrl!,
                    title: folder.name!,
                    delete: () {},
                    onClick: () {
                      Routes.bookRoute.moveTo();
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
