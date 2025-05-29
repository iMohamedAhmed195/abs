
import '../../exports.dart';

class MyDropdownExample extends StatefulWidget {
  final void Function(ItemModel selectedList) onSelected;
  final List<ItemModel>? items;
  final Color? borderColor;
  final TextStyle? titleStyle;
  final String? emptyText;
  final String title;
  final bool showError;
  final Widget? leading;
  final Color? backgroundColor;
  String? activeText;

  MyDropdownExample({
    required this.onSelected,
    required this.items,
    this.borderColor,
    this.emptyText,
    required this.title,
    this.showError = false,
    this.leading,
    this.backgroundColor,
    this.titleStyle,
    this.activeText,
    super.key,
  });

  @override
  State<MyDropdownExample> createState() => _MyDropdownExampleState();
}

class _MyDropdownExampleState extends State<MyDropdownExample> {
  int? selectedCountryId;

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 24,
                color: AppColors.black.withOpacity(0.08)
            )
          ],
          border:Border(
              right: BorderSide(color: AppColors.primaryColor,width: 1.5)
          )
        // Border.all(width:widget.showError ? 2 : 1, color: widget.borderColor.isNotNull ?widget.borderColor! : widget.showError ? AppColors.brown : AppColors.borderColor2),
      ),
      height: isExpanded ? 150.h:50.h,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 24,
                color: AppColors.black.withOpacity(0.04)
            )
          ],
        ),
        child: SingleChildScrollView(
          child: ExpansionTile(
              maintainState: false,
              key: GlobalKey(),
              /* expansion */
              visualDensity: VisualDensity.compact,
              dense: true,
              initiallyExpanded: isExpanded,
              tilePadding: EdgeInsetsDirectional.only(start: 10, end: 10, top: 2 , bottom: 2),
              childrenPadding: EdgeInsetsDirectional.only(top: 10.h),
              onExpansionChanged: (value) {
                isExpanded = value;
                print(isExpanded);
                setState(() {});
              },
              iconColor: AppColors.grey,
              collapsedIconColor: AppColors.grey,
              backgroundColor: AppColors.transparent, //whole widget color while expanding
              trailing: getTrailingWidget,
              leading: widget.leading,
              collapsedBackgroundColor: AppColors.transparent, //collapse color
              minTileHeight: 0, //make min height 0
              // childrenPadding: getPadding(horizontal: 100),
              /*shapes*/ //collapse shape
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: widget.borderColor ?? AppColors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(6.h)), //the whole widget shape while expanding
              title: Row(
                children: [
                  Text(
                    '${widget.activeText ?? widget.title!} ',
                    style: widget.titleStyle ??
                        getRegularTextStyle(
                          color: AppColors.black.withOpacity(0.5),
                          fontSize: 14,
                        ),
                  ),
                ],
              ),
              children: List.generate(
                widget.items!.length,
                    (index) => buildExpandedItem(index),
              )),
        ),
      ),
    );
    // return StatusMessage(
    //   text: widget.emptyText.validate,
    //   iconData: Icons.account_balance,
    // );
  }

  buildExpandedItem(int index) => GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        widget.items.deselectAll;
        widget.items![index].isSelected = true;
        widget.activeText = widget.items![index].name.validate;
        widget.onSelected.call(widget.items![index]);
        isExpanded = false;
        setState(() {});
      },
      child: Container(
        padding: EdgeInsetsDirectional.only(top:10, ),
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 21.w),
              child: Text(
                widget.items![index].name.validate,
                style: getRegularTextStyle(
                  fontSize: 14,
                  color: widget.items![index].isSelected.isTrue ? AppColors.black : null,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            index != widget.items!.length-1 ?  10.vs : SizedBox.shrink(),
            index != widget.items!.length-1 ?   Divider() : Divider(color: AppColors.transparent,),

          ],
        ),
      ));
  get getTrailingWidget {
    if (isExpanded.isTrue) {
      return const Icon(
        Icons.keyboard_arrow_up_outlined,
        color: AppColors.black,
      );
    } else {
      return const Icon(
        Icons.keyboard_arrow_down_outlined,
        color: AppColors.black,
      );
    }
  }
}
