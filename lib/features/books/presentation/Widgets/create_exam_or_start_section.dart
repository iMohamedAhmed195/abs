import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../exports.dart';

class CreateExamOrStartSection extends StatefulWidget {
  const CreateExamOrStartSection({super.key});

  @override
  State<CreateExamOrStartSection> createState() => _CreateExamOrStartSectionState();
}

class _CreateExamOrStartSectionState extends State<CreateExamOrStartSection> {
  bool _loadingButton = false;
  String type = 'chatBoot';

  @override
  void initState() {
  bool _loadingButton = false;
  type = 'chatBoot';

  super.initState();
  }
  @override
  void dispose() {
    bool _loadingButton = false;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      // visible: selectAll || bookSelected.isNotEmpty,
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 16, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: ButtonWidget(
                    colorButton: Colors.transparent,
                    colorBorder: AppColors.primaryColor,
                    colorTitleButton: AppColors.primaryColor,
                    multiWidget: _loadingButton == true && type != 'test'
                        ? LoadingAnimationWidget.discreteCircle(
                        color: AppColors.primaryColor, size: 30)
                        : null,
                    title: AppStrings.startChat.trans,
                    onClick: () async {
                      // if (bookSelected.isNotEmpty && bookSelected.first.fileUrl != null) {
                      //   if (bookSelected.length > 1) {
                      //     setState(() {
                      //       _loadingButton = true;
                      //     });
                      //     if (await _checkLocalPath(bookSelected)) {
                      //       if (booksPath.length == bookSelected.length) {
                      //         BlocProvider.of<BooksBloc>(context)
                      //             .add(AddBooksToMergeEvent(bookSelected
                      //                 .map(
                      //                   (e) => e.localPath!,
                      //                 )
                      //                 .toList()));
                      //       }
                      //     }
                      //   } else {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => ChatScreen(
                      //           bookObject: bookSelected,
                      //           listBooksWithChatBot: bookSelected,
                      //           isNewChatBoot: true,
                      //           typeChat: 'ChatBoot',
                      //         ),
                      //       ),
                      //     );
                      //   }
                      // } else {
                      //   showSnackBar(
                      //       context: context,
                      //       message: 'اختار كتابا',
                      //       visibleMessage: false);
                      // }
                    }
                )),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: ButtonWidget(
                  colorButton: Colors.transparent,
                  colorBorder: AppColors.primaryColor,
                  colorTitleButton: AppColors.primaryColor,
                  title: AppStrings.createTest.trans,
                  multiWidget: _loadingButton == true && type == 'test'
                      ? LoadingAnimationWidget.discreteCircle(
                      color: AppColors.primaryColor, size: 30)
                      : null,
                  onClick: () async {
                    // if (bookSelected.length > 1) {
                    //   setState(() {
                    //     _loadingButton = true;
                    //     type = 'test';
                    //   });
                    //   if (await _checkLocalPath(bookSelected)) {
                    //     BlocProvider.of<BooksBloc>(context)
                    //         .add(AddBooksToMergeEvent(bookSelected
                    //             .map(
                    //               (e) => e.localPath!,
                    //             )
                    //             .toList()));
                    //   }
                    // }
                    // else {
                    //   showModalBottomSheet(
                    //     shape: const RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.only(
                    //             topLeft: Radius.circular(9),
                    //             topRight: Radius.circular(9))),
                    //     useSafeArea: true,
                    //     backgroundColor:
                    //         Theme.of(context).scaffoldBackgroundColor,
                    //     isScrollControlled: true,
                    //     context: context,
                    //     builder: (context) => SingleChildScrollView(
                    //       physics: const NeverScrollableScrollPhysics(),
                    //       child: TestSettingPage(
                    //         book: bookSelected,
                    //       ),
                    //     ),
                    //   );
                    // }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
