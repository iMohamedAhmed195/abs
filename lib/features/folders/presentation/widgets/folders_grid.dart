import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:new_ilearn/features/folders/data/models/folders_model.dart';
import 'package:new_ilearn/features/folders/presentation/managers/delete_folder_by_id_cubit.dart';
import 'package:new_ilearn/features/home/presentation/widgets/folders_and_books_widgets.dart';
import '../../../../exports.dart';

class FoldersGrid extends StatelessWidget {
  const FoldersGrid({super.key, required this.folders,});

  final List<Folders> folders;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteFolderByIdCubit(useCase: ServiceLocator.instance.getIt()),
      child: Column(
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
                columnCount: folders.length,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: FoldersAndBooks(
                      idFolder: folder.id!,
                      isBook: false,
                      radius: 16,
                      image: folder.fullImageUrl!,
                      title: folder.name!,
                      delete: () {
                        context.read<DeleteFolderByIdCubit>().deleteFolder(id: folder.id!);
                      },
                      onClick: () {
                       Routes.bookRoute.moveToWithArgs({
                         "idFolder" : folder.id,
                         "titleHeader" :folder.name!,
                         "isArchive" :false
                       });
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
