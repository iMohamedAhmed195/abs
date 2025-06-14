import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:new_ilearn/core/widgets/dialog.dart';
import 'package:new_ilearn/features/books/data/models/get_books_model.dart';
import 'package:new_ilearn/features/books/presentation/managers/get_books_cubit.dart';
import 'package:new_ilearn/features/home/presentation/widgets/books_widgets.dart';
import '../../../../exports.dart';

class ListOfBooksSection extends StatefulWidget {
  const ListOfBooksSection({super.key, required this.isArchive});

  final bool isArchive;


  @override
  State<ListOfBooksSection> createState() => _ListOfBooksSectionState();
}

class _ListOfBooksSectionState extends State<ListOfBooksSection> {
  List<Books> bookSelected = [];
  bool selectAll = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<GetBooksCubit, CubitStates>(
          builder: (context, state) {
            if (state is LoadedState) {
              if (state.data.items.isNotEmpty) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.data.items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.w / 1.13.h,
                    mainAxisSpacing: 17,
                    crossAxisSpacing: 2,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return BooksWidgetItem(
                      isShowDeleteButton: widget.isArchive,
                      isBook: true,
                      delete: () {
                        loadingSystem(context);
                        // BlocProvider.of<BooksBloc>(context).add(
                        //     DeleteBookEvent(
                        //         state.listBooks![index].id));
                      },
                      bookId: state.data.items[index].id,
                      path: state.data.items[index].localPath,
                      fileUrl: state.data.items[index].fileUrl,
                      heightImage: 100.h,
                      showButton: true,
                      checkSelected: (values) {
                        if (values != null) {
                          setState(() {
                            state.data.items[index].checkedBook = values;
                          });
                          if (values) {
                            setState(() {
                              bookSelected.add(state.data.items[index]);
                            });
                          } else {
                            setState(() {
                              bookSelected.remove(state.data.items[index]);
                            });
                          }
                        }
                        _checkAllSelected(state.data.items!);
                      },
                      checked: selectAll ? true : state.data.items![index].checkedBook,
                      onClick: widget.isArchive
                              ? () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             TapsArchivePage(
                                //               book: state
                                //                   .listBooks!
                                //                   .first,
                                //               bookId: state
                                //                   .listBooks![
                                //               index]
                                //                   .id,
                                //               titleHeader: state
                                //                   .listBooks![
                                //               index]
                                //                   .name,
                                //             )));
                              }
                              : () {
                                setState(() {
                                  state.data.items![index].checkedBook = !state.data.items![index].checkedBook;
                                });
                                if (state.data.items![index].checkedBook) {
                                  setState(() {
                                    bookSelected.add(state.data.items![index]);
                                  });
                                } else {
                                  setState(() {
                                    bookSelected.remove(state.data.items![index]);
                                  });
                                }

                                _checkAllSelected(state.data.items!);
                              },
                      showCheckBox: widget.isArchive,
                      numberPage: 5,
                      onLongClick: () {},
                      radius: 16.r,
                      image: state.data.items[index].fullImageUrl,
                      title: state.data.items[index].name,
                    );
                  },
                );
              } else {
                return SizedBox.shrink();
              }
            } else if (state is FailedState) {
              return ListOfBooksSection(isArchive: widget.isArchive);
            }
            return Padding(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
              child: Center(child: LoadingAnimationWidget.threeArchedCircle(color: AppColors.primaryColor, size: 30)),
            );
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  _checkAllSelected(List<Books> listBooks) {
    for (var element in listBooks) {
      if (element.checkedBook == false) {
        setState(() {
          selectAll = false;
        });
        break;
      } else {
        setState(() {
          selectAll = true;
        });
      }
    }
  }
}
