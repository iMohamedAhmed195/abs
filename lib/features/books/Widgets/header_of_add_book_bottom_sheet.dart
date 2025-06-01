import '../../../exports.dart';

class HeaderOfAddBookBottomSheet extends StatelessWidget {
  const HeaderOfAddBookBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 14),
      padding: const EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 20),
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(topRight: Radius.circular(9), topLeft: Radius.circular(9)),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            height: 4,
            width: 60,
            decoration: BoxDecoration(
              color: Theme.of(context).textTheme.titleMedium!.color,
              borderRadius: BorderRadius.circular(11),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(text: AppStrings.addNewBook.trans, fontSizeText: 20, fontWeight: FontWeight.bold),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(size: 20, Icons.close, color: Theme.of(context).textTheme.titleLarge!.color),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
