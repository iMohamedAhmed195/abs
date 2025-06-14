import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:new_ilearn/features/folders/presentation/managers/delete_folder_by_id_cubit.dart';
import 'package:new_ilearn/features/home/presentation/widgets/folders_and_books_widgets.dart';

import '../../../../exports.dart';

class FoldersGrid extends StatelessWidget {
  const FoldersGrid({super.key,  });

  @override
  Widget build(BuildContext context) {
    final mockFolders = List.generate(10, (index) => {
      "id": "$index",
      "title": "${AppStrings.egypt.trans} $index",
      "image": AppAssets.logo
    });

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
          itemCount: mockFolders.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 0.99,
            mainAxisSpacing: 17,
            crossAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            final folder = mockFolders[index];
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 400),
              columnCount: 9,
              child: ScaleAnimation(
                child: FadeInAnimation(
                  child: FoldersAndBooks(
                    idFolder: folder["id"]!,
                    isBook: false,
                    radius: 16,
                    image: folder["image"]!,
                    title: folder["title"]!,
                    delete: () {
                    },
                    onClick: () {},
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
