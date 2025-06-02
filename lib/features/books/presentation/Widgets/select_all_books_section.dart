import 'package:new_ilearn/core/widgets/check_box_widget.dart';

import '../../../../exports.dart';

class SelectAllBooksSection extends StatefulWidget {
  const SelectAllBooksSection({super.key, required this.isArchive});
  final bool isArchive;

  @override
  State<SelectAllBooksSection> createState() => _SelectAllBooksSectionState();
}

class _SelectAllBooksSectionState extends State<SelectAllBooksSection> {
  bool selectAll = false;

  @override
  void initState() {
    selectAll = false;
    super.initState();
  }
  @override
  void dispose() {
    selectAll = false;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              text: widget.isArchive
                  ? AppStrings
                  .archivedBooks.trans
                  : AppStrings.library.trans,
              fontSizeText: 18,
            ),
            Visibility(
              visible: true,
              child: Row(
                children: [
                  TextWidget(
                    text: AppStrings
                        .selectAll.trans,
                    fontSizeText: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  CheckboxWidget(
                    isSelected: selectAll,
                    onCheck: (value) {
                      setState(() {
                        selectAll = !selectAll;
                      });
                      // for (var element in state.listBooks!) {
                      //   element.checkedBook = selectAll;
                      // }
                      // if (selectAll) {
                      //   setState(() {
                      //     bookSelected.clear();
                      //     bookSelected
                      //         .addAll(state.listBooks!);
                      //   });
                      // }
                      // else {
                      //   setState(() {
                      //     bookSelected.clear();
                      //   });
                      // }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}
