import 'package:new_ilearn/core/widgets/dialog.dart';
import 'package:new_ilearn/core/widgets/imageCash_widget.dart';
import 'package:new_ilearn/features/home/presentation/widgets/craeteFolderPage.dart';

import '../../../../exports.dart';

/// Widget لعرض المجلدات والكتب في التطبيق
/// يدعم العمليات التالية: الحذف، التحديث، التحديد المتعدد
class FoldersAndBooks extends StatelessWidget {
  const FoldersAndBooks({
    super.key,
    required this.image,
    required this.title,
    required this.delete,
    required this.isBook,
    this.radius = 8,
    this.numberPage,
    this.showButton = false,
    this.onClick,
    this.heightImage = 120,
    this.checked = false,
    this.showCheckBox = false,
    this.checkSelected,
    this.onLongClick,
    this.fileUrl,
    this.path,
    this.bookId,
    this.isShowDeleteButton = true,
    this.width = 110,
    this.idFolder = '',
  });

  // الخصائص الأساسية
  final String? image;
  final String title;
  final bool isBook;
  final VoidCallback delete;

  // خصائص التصميم
  final double radius;
  final double heightImage;
  final double width;

  // خصائص التفاعل
  final VoidCallback? onClick;
  final VoidCallback? onLongClick;
  final ValueChanged<bool?>? checkSelected;

  // خصائص الكتاب
  final int? numberPage;
  final String? fileUrl;
  final String? path;
  final String? bookId;

  // خصائص العرض
  final bool showButton;
  final bool showCheckBox;
  final bool checked;
  final bool isShowDeleteButton;

  // خصائص المجلد
  final String idFolder;

  @override
  Widget build(BuildContext context) {
    return _buildMainContainer(context);
  }

  /// بناء الحاوية الرئيسية للويدجت
  Widget _buildMainContainer(BuildContext context) {
    return InkWell(
      onLongPress: onLongClick,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onClick,
      child: Container(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsetsDirectional.only(end: 12),
        width: width.w,
        decoration: _buildContainerDecoration(),
        child: Stack(
          children: [
            _buildContentColumn(context),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  /// تصميم الحاوية الخارجية
  BoxDecoration _buildContainerDecoration() {
    return BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 4),
          blurRadius: 4,
        )
      ],
    );
  }

  /// بناء العمود الأساسي للمحتوى
  Widget _buildContentColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImageSection(),
        SizedBox(height: 10.h),
        _buildTextSection(),
      ],
    );
  }

  /// بناء قسم الصورة
  Widget _buildImageSection() {
    if (image != null) {
      return ImageCached(
        urlImage: image!.replaceAll(' ', '%'),
        height: heightImage.h,
      );
    }

    return _buildDefaultImage();
  }

  /// بناء الصورة الافتراضية
  Widget _buildDefaultImage() {
    return Container(
      color: AppColors.primaryColor,
      child: Center(
        child: SizedBox(
          height: heightImage.h,
          child: Image.asset(
            AppAssets.logoName,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  /// بناء قسم النصوص
  Widget _buildTextSection() {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleText(),
          _buildPageCountText(),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

  /// بناء نص العنوان
  Widget _buildTitleText() {
    return Align(
      alignment: _getTitleAlignment(),
      child: TextWidget(
        text: title,
        fontSizeText: 14,
        textOverflow: TextOverflow.ellipsis,
        maxLine: 1,
      ),
    );
  }

  /// تحديد محاذاة العنوان
  AlignmentDirectional _getTitleAlignment() {
    return numberPage != null
        ? AlignmentDirectional.centerStart
        : AlignmentDirectional.center;
  }

  /// بناء نص عدد الصفحات
  Widget _buildPageCountText() {
    return Visibility(
      visible: numberPage != null,
      child: TextWidget(
        textOverflow: TextOverflow.ellipsis,
        maxLine: 1,
        text: 'عدد الصفحات :${numberPage ?? 0}',
        fontSizeText: 12,
      ),
    );
  }

  /// بناء أزرار الإجراءات
  Widget _buildActionButtons(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCheckbox(),
        _buildActionButton(context),
      ],
    );
  }

  /// بناء Checkbox للتحديد المتعدد
  Widget _buildCheckbox() {
    return Visibility(
      visible: _shouldShowCheckbox(),
      child: Align(
        alignment: AlignmentDirectional.topStart,
        child: Checkbox(
          activeColor: AppColors.primaryColor,
          hoverColor: Colors.white,
          fillColor: WidgetStatePropertyAll(
            checked ? AppColors.primaryColor : Colors.white,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          value: checked,
          onChanged: checkSelected ?? (value) {},
        ),
      ),
    );
  }

  /// تحديد ما إذا كان يجب عرض Checkbox
  bool _shouldShowCheckbox() {
    return showCheckBox &&
        fileUrl != null &&
        !fileUrl!.startsWith('https://www.youtube.com/watch');
  }

  /// بناء زر الإجراء (حذف أو قائمة خيارات)
  Widget _buildActionButton(BuildContext context) {
    return Visibility(
      visible: isShowDeleteButton,
      child: IconButton(
        onPressed: () => _handleActionButtonPress(context),
        icon: _buildActionIcon(context),
      ),
    );
  }

  /// التعامل مع ضغط زر الإجراء
  void _handleActionButtonPress(BuildContext context) {
    if (isBook) {
      _showDeleteDialog(context);
    }
  }

  /// بناء أيقونة زر الإجراء
  Widget _buildActionIcon(BuildContext context) {
    return CircleAvatar(
      radius: 13.r,
      backgroundColor: AppColors.primaryColor,
      child: isBook ? _buildDeleteIcon() : _buildPopupMenu(context),
    );
  }

  /// بناء أيقونة الحذف للكتب
  Widget _buildDeleteIcon() {
    return SvgPicture.asset(
      AppAssets.deleteAccount,
      height: 17.h,
      width: 17.w,
      color: Colors.red,
    );
  }

  /// بناء قائمة الخيارات للمجلدات
  Widget _buildPopupMenu(BuildContext context) {
    return Center(
      child: PopupMenuButton(
        color: AppColors.white,
        icon: const Icon(
          Icons.more_vert,
          color: AppColors.white,
        ),
        onSelected: (value) => _handlePopupMenuSelection(context, value),
        padding: EdgeInsetsDirectional.zero,
        iconColor: Colors.white,
        itemBuilder: (context) => _buildPopupMenuItems(),
      ),
    );
  }

  /// التعامل مع اختيار عنصر من قائمة الخيارات
  void _handlePopupMenuSelection(BuildContext context, String value) {
    switch (value) {
      case 'update':
        _showUpdateBottomSheet(context);
        break;
      case 'delete':
        _showDeleteDialog(context);
        break;
    }
  }

  /// بناء عناصر قائمة الخيارات
  List<PopupMenuEntry<String>> _buildPopupMenuItems() {
    return [
      PopupMenuItem(
        value: 'update',
        child: TextWidget(
          text: AppStrings.update.trans,
          fontSizeText: 15,
        ),
      ),
      PopupMenuItem(
        value: 'delete',
        child: TextWidget(
          text: AppStrings.delete.trans,
          fontSizeText: 15,
        ),
      ),
    ];
  }

  /// عرض BottomSheet للتحديث
  void _showUpdateBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(9),
          topLeft: Radius.circular(9),
        ),
      ),
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: BottomSheetAddFolder(
            idFolder: idFolder,
            update: true,
            folderName: title,
            folderImage: image,
          ),
        );
      },
    );
  }

  /// عرض حوار الحذف
  void _showDeleteDialog(BuildContext context) {
    final itemType = isBook ? AppStrings.books : AppStrings.folder;

    dialog(
      context: context,
      title: '${AppStrings.delete.trans} ${itemType.trans}',
      subTitle: '${AppStrings.doReallyWantDelete.trans} $title',
      titleButtonAccess: AppStrings.delete.trans,
      titleButtonReject: AppStrings.cancel.trans,
      onClickAccessButton: () {
        Navigator.pop(context);
        delete();
      },
      onClickRejectButton: () {
        Navigator.pop(context);
      },
    );
  }
}