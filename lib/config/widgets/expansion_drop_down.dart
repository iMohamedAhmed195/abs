
import '../../exports.dart';

class ExpansionDropDown extends StatefulWidget {
  final void Function(ItemModel selectedList) onSelected;
  final List<ItemModel>? items;
  final Color? borderColor;
  final TextStyle? titleStyle;
  final String? emptyText;
  final double? textWidth;
  final String title;
  final bool showError;
  final Widget? leading;
  final Color? backgroundColor;
   String? activeText;

   ExpansionDropDown({
    required this.onSelected,
    required this.items,
    this.borderColor,
    this.emptyText,
     required this.title,
    this.showError = false,
    this.leading,
    this.textWidth,
     this.backgroundColor,
    this.titleStyle,
    this.activeText,
    super.key,
  });

  @override
  State<ExpansionDropDown> createState() => _ExpansionDropDownState();
}

class _ExpansionDropDownState extends State<ExpansionDropDown> {
  int? selectedCountryId;

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: isExpanded ? 200.h:50.h,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 24,
              color: AppColors.black.withOpacity(0.08)
            )
          ],
          border:Border(
            right: BorderSide(color: AppColors.primaryColor,width: 1.5)
          )
          // Border.all(width:widget.showError ? 2 : 1, color: widget.borderColor.isNotNull ?widget.borderColor! : widget.showError ? AppColors.brown : AppColors.borderColor2),
        ),
        child: Center(
          child: SingleChildScrollView(
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
              child: ExpansionTile(
                  maintainState: true,
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
                  /*shapes*/
                  //collapse shape
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: widget.borderColor ?? AppColors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(6.h)), //the whole widget shape while expanding
                  title: SizedBox(
                    width: widget.textWidth ?? null,
                    child: Text(
                      '${widget.title!} : ${widget.activeText ?? ''}',
                      overflow: TextOverflow.ellipsis,
                      style: widget.titleStyle ??
                          getRegularTextStyle(
                            color: AppColors.black.withOpacity(0.5),
                            fontSize: 12,
                          ),
                    ),
                  ),
                  children: List.generate(
                    widget.items!.length,
                        (index) => buildExpandedItem(index),
                  )),
            ),
          ),
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
        padding: EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 10),
        margin: EdgeInsetsDirectional.only(start: 20,end: 20, bottom: 15),
        decoration: BoxDecoration(
          color: widget.items![index].isSelected.orFalse ? AppColors.primaryColor : AppColors.grey.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.items![index].name.validate,
              style: getRegularTextStyle(
                fontSize: 15,
                color: widget.items![index].isSelected.isTrue ? AppColors.white : null,
              ),
              textAlign: TextAlign.start,
            ),
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
