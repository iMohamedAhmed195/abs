import 'package:new_ilearn/features/home/presentation/widgets/foldersAndBooks_widgets.dart';

import '../../../exports.dart';

class ListOfBooksSection extends StatelessWidget {
  const ListOfBooksSection({super.key, required this.isArchive});
  final bool isArchive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.w / 1.13.h,
              mainAxisSpacing: 17,
              crossAxisSpacing: 2,
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return FoldersAndBooks(
                isShowDeleteButton: isArchive,
                isBook: true,
                delete: () {
                  // loadingSystem(context);
                  // BlocProvider.of<BooksBloc>(context).add(
                  //     DeleteBookEvent(
                  //         state.listBooks![index].id));
                },
                bookId: "5",
                path:  "5",
                fileUrl:  "5",
                heightImage: 100.h,
                showButton: true,
                checkSelected: (values) {
                  // if (values != null) {
                  //   setState(() {
                  //     state.listBooks![index]
                  //         .checkedBook = values;
                  //   });
                  //   if (values) {
                  //     setState(() {
                  //       bookSelected
                  //           .add(state.listBooks![index]);
                  //     });
                  //   } else {
                  //     setState(() {
                  //       bookSelected.remove(
                  //           state.listBooks![index]);
                  //     });
                  //   }
                  // }
                  // _checkAllSelected(state.listBooks!);
                },
                // checked: selectAll ? true : state.listBooks![index].checkedBook,
                // onClick: widget.isArchive ?
                //     () {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) =>
                //               TapsArchivePage(
                //                 book: state
                //                     .listBooks!
                //                     .first,
                //                 bookId: state
                //                     .listBooks![
                //                 index]
                //                     .id,
                //                 titleHeader: state
                //                     .listBooks![
                //                 index]
                //                     .name,
                //               )));
                // } : state.listBooks![index].fileUrl != null && !state.listBooks![index].fileUrl!.startsWith('https://www.youtube.com/watch')
                //     ? () {
                //   {
                //     setState(() {
                //       state.listBooks![index]
                //           .checkedBook =
                //       !state
                //           .listBooks![index]
                //           .checkedBook;
                //     });
                //     if (state.listBooks![index]
                //         .checkedBook) {
                //       setState(() {
                //         bookSelected.add(state
                //             .listBooks![index]);
                //       });
                //     } else {
                //       setState(() {
                //         bookSelected.remove(
                //             state.listBooks![
                //             index]);
                //       });
                //     }
                //
                //     _checkAllSelected(
                //         state.listBooks!);
                //   }
                // }
                //     : () {},
                showCheckBox: isArchive,
                onLongClick: () {},
                radius: 16.r,
                image: '',
                title: 'asdasdasdasdasdas');
          },
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
