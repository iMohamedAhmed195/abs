import 'package:new_ilearn/features/books/presentation/screens/add_book_bottom_sheet.dart';

import '../../../../exports.dart';

class AddBookCardSection extends StatelessWidget {
  const AddBookCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                color: Colors.black12)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: AppStrings.addNewBook.trans,
            fontSizeText: 18,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 8,
          ),
          ButtonWidget(
              title: AppStrings.add.trans,
              onClick: () {
                showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(9),
                          topRight: Radius.circular(9))),
                  useSafeArea: true,
                  backgroundColor:
                  Theme
                      .of(context)
                      .scaffoldBackgroundColor,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) =>
                      SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: AddBookPage(
                          folderId: "5",
                        ),
                      ),
                );
              })
        ],
      ),
    );
  }
}
