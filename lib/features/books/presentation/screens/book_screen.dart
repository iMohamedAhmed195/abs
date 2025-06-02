import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:new_ilearn/features/books/presentation/Widgets/add_book_card_section.dart';
import 'package:new_ilearn/features/books/presentation/Widgets/create_exam_or_start_section.dart';
import 'package:new_ilearn/features/books/presentation/Widgets/list_of_books_section.dart';
import 'package:new_ilearn/features/books/presentation/Widgets/select_all_books_section.dart';
import 'package:new_ilearn/features/bottom_navigation/presentation/widget/custom_appbar_widget.dart';

import '../../../../exports.dart';

class BookScreen extends StatefulWidget {
  const BookScreen(
      {super.key,
      this.titleHeader,
      this.idFolder,
      this.isSearchScreen = false,
      this.isArchive = false});

  final String? titleHeader;
  final String? idFolder;
  final bool isSearchScreen;
  final bool isArchive;

  @override
  State<BookScreen> createState() => _BookScreenState();
}

// final AppAssets = Images();
// List<Book> bookSelected = [];
late ScrollController _controllerScrollBook;
int _pageListBook = 1;
bool _isMoreItems = false;
late bool _isLoading;
int _countPages = 1;
late TextEditingController _search;
int statusCode = 200;
List<String> booksPath = [];

class _BookScreenState extends State<BookScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _search = TextEditingController();
    // bookSelected = [];
    booksPath = [];
    _pageListBook = 1;
    _isLoading = false;
    // BlocProvider.of<BooksBloc>(context).add(GetBooksEvents(
    //     idFolder: widget.idFolder,
    //     pageList: _pageListBook,
    //     type: 'getBooksWithFolder',
    //     isArchive: widget.isArchive));

    _controllerScrollBook = ScrollController();
    // pagination(
    //   scrollController: _controllerScrollBook,
    //   countPages: _countPages,
    //   indexPageList: _pageListBook,
    //   pagination: () {
    //     if (_pageListBook != _countPages) {
    //       setState(() {
    //         _isLoading = true;
    //         _pageListBook++;
    //       });
    //       BlocProvider.of<BooksBloc>(context).add(GetBooksEvents(
    //           idFolder: widget.idFolder,
    //           pageList: _pageListBook,
    //           type: 'getBooksWithFolder',
    //           nameBook: _search.text,
    //           isArchive: widget.isArchive));
    //     }
    //   },
    // );
  }

  @override
  void dispose() {
    _search.dispose();
    booksPath = [];
    // bookSelected = [];
    _controllerScrollBook.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: widget.titleHeader ?? AppStrings.books.trans,
      ),
      child: ListView(
        controller: _controllerScrollBook,
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
        children: [
          Visibility(
            visible: true,
            child: AddBookCardSection(),
          ),
          SizedBox(
            height: 16.h,
          ),
          // Visibility(
          //   visible: true,
          //   child: Row(
          //     children: [
          //       Expanded(
          //         flex: 6,
          //         child: TextFiledWidget(
          //             fillColor: Theme.of(context).secondaryHeaderColor,
          //             hintText: AppStrings.searchBook,
          //             textInputAction: TextInputAction.search,
          //             onSubmitted: (nameBook) {
          //               // search();
          //             },
          //             type: TextInputType.text,
          //             textEditingController: _search),
          //       ),
          //       SizedBox(
          //         width: 15.w,
          //       ),
          //       Expanded(
          //         child: ButtonWidget(
          //           colorBorder: AppColors.primaryColor,
          //           colorButton: AppColors.primaryColor.withOpacity(0.20),
          //           title: 'search',
          //           onClick: () {
          //                 // search();
          //           },
          //           multiWidget: SvgPicture.asset(
          //             AppAssets.searchIcon,
          //             width: 22.w,
          //             height: 22.h,
          //             color: AppColors.primaryColor,
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 10.h,
          ),
          Column(
            children: [
              SelectAllBooksSection(isArchive: widget.isArchive,),
              ListOfBooksSection(isArchive:  widget.isArchive,),
              ///for loading ?  mohamed.
              Visibility(
                  visible: _isLoading,
                  child: Padding(
                    padding:
                    const EdgeInsetsDirectional.symmetric(
                        vertical: 10),
                    child: Center(
                      child: LoadingAnimationWidget
                          .threeArchedCircle(
                          color: AppColors.primaryColor, size: 30),
                    ),
                  ))
            ],
          )
        ],
      ),
      floatingDirection: FloatingActionButtonLocation.centerFloat,
      bottomNavRoute:CreateExamOrStartSection(),
    );
  }

  // void search() {
  //   if (_search.text.isNotEmpty) {
  //     BlocProvider.of<BooksBloc>(context).add(GetBooksEvents(
  //         pageList: 1,
  //         idFolder: widget.idFolder,
  //         nameBook: _search.text.trim(),
  //         type: 'search',
  //         isArchive: widget.isArchive));
  //   }
  // }
  //
  // _checkAllSelected(List<Book> listBooks) {
  //   for (var element in listBooks) {
  //     if (element.checkedBook == false) {
  //       setState(() {
  //         selectAll = false;
  //       });
  //       break;
  //     } else {
  //       setState(() {
  //         selectAll = true;
  //       });
  //     }
  //   }
  // }
  //
  // Future<bool> _checkLocalPath(List<Book> books) async {
  //   bool result = false;
  //   for (int i = 0; i < books.length; i++) {
  //     if (await BookProccessingController()
  //             .checkThePath(pathFile: books[i].localPath!) ==
  //         true) {
  //       setState(() {
  //         booksPath.add(books[i].localPath!);
  //       });
  //       result = true;
  //     } else {
  //       BlocProvider.of<SendMessageBloc>(context)
  //           .add(ToFileEvent(books[i].fileUrl!, books[i].id, 'booksScreen'));
  //       result = false;
  //     }
  //   }
  //   return result;
  // }
}
