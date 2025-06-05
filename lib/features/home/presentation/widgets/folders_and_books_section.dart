 import 'package:new_ilearn/features/home/presentation/widgets/book_slide.dart';
import 'package:new_ilearn/features/home/presentation/widgets/folder_slide.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../exports.dart';
import '../managers/folders_cubit.dart';

class FoldersAndBooksSection extends StatelessWidget {
  const FoldersAndBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoldersCubit, CubitStates>(
      builder: (context, state) {
        return state is LoadedState? Column(
          children: [
            FolderSlide(folders: state.data.categories.items,),
            SizedBox(
              height: 15,
            ),
            BookSlide(books:  state.data.books.items,)
          ],
        ):Container();
      },
    );
  }
}