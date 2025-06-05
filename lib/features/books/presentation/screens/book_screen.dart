import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:new_ilearn/core/widgets/textFiled_widget.dart';
import 'package:new_ilearn/features/books/presentation/Widgets/add_book_card_section.dart';
import 'package:new_ilearn/features/books/presentation/Widgets/create_exam_or_start_section.dart';
import 'package:new_ilearn/features/books/presentation/Widgets/list_of_books_section.dart';
import 'package:new_ilearn/features/books/presentation/Widgets/select_all_books_section.dart';
import 'package:new_ilearn/features/bottom_navigation/presentation/widget/custom_appbar_widget.dart';

import '../../../../exports.dart';

/// شاشة الكتب الرئيسية
/// تدعم عرض الكتب والبحث والأرشيف
class BookScreen extends StatefulWidget {
  const BookScreen({
    super.key,
    this.titleHeader,
    this.idFolder,
    this.isSearchScreen = false,
    this.isArchive = false,
  });

  final String? titleHeader;
  final String? idFolder;
  final bool isSearchScreen;
  final bool isArchive;

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  // المتغيرات الخاصة بالتحكم في الواجهة
  late ScrollController _scrollController;
  late TextEditingController _searchController;

  // متغيرات حالة التطبيق
  int _currentPage = 1;
  int _totalPages = 1;
  bool _isLoading = false;
  int _statusCode = 200;
  List<String> _booksPath = [];

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _initializeState();
    _setupScrollListener();
  }

  @override
  void dispose() {
    _disposeControllers();
    _clearState();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(),
      child: _buildMainContent(),
      floatingDirection: FloatingActionButtonLocation.centerFloat,
      bottomNavRoute: const CreateExamOrStartSection(),
    );
  }

  /// تهيئة المتحكمات
  void _initializeControllers() {
    _searchController = TextEditingController();
    _scrollController = ScrollController();
  }

  /// تهيئة حالة التطبيق
  void _initializeState() {
    _booksPath = [];
    _currentPage = 1;
    _isLoading = false;
    _totalPages = 1;
    _statusCode = 200;
  }

  /// إعداد مستمع التمرير للـ pagination
  void _setupScrollListener() {
    // يمكن إضافة منطق pagination هنا عند الحاجة
    // pagination(
    //   scrollController: _scrollController,
    //   countPages: _totalPages,
    //   indexPageList: _currentPage,
    //   pagination: _loadMoreBooks,
    // );
  }

  /// تنظيف المتحكمات
  void _disposeControllers() {
    _searchController.dispose();
    _scrollController.dispose();
  }

  /// تنظيف الحالة
  void _clearState() {
    _booksPath.clear();
  }

  /// بناء شريط التطبيق العلوي
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      title: widget.titleHeader ?? AppStrings.books.trans,
    );
  }

  /// بناء المحتوى الرئيسي
  Widget _buildMainContent() {
    return ListView(
      controller: _scrollController,
      padding: _getMainPadding(),
      children: [
        _buildAddBookSection(),
        _buildVerticalSpacing(16),
        _buildSearchSection(),
        _buildVerticalSpacing(10),
        _buildBooksContent(),
      ],
    );
  }

  /// الحصول على padding الرئيسي
  EdgeInsetsDirectional _getMainPadding() {
    return const EdgeInsetsDirectional.symmetric(horizontal: 16);
  }

  /// بناء قسم إضافة الكتب
  Widget _buildAddBookSection() {
    return const Visibility(
      visible: true,
      child: AddBookCardSection(),
    );
  }

  /// بناء مسافة عمودية
  Widget _buildVerticalSpacing(double height) {
    return SizedBox(height: height.h);
  }

  /// بناء قسم البحث (معطل حالياً)
  Widget _buildSearchSection() {
    // تم تعطيل قسم البحث في الكود الأصلي
    // يمكن تفعيله عند الحاجة
    return const SizedBox.shrink();

    // الكود الأصلي للبحث:
    // return Visibility(
    //   visible: true,
    //   child: _buildSearchRow(),
    // );
  }

  /// بناء صف البحث
  Widget _buildSearchRow() {
    return Row(
      children: [
        _buildSearchField(),
        _buildHorizontalSpacing(15),
        _buildSearchButton(),
      ],
    );
  }

  /// بناء حقل البحث
  Widget _buildSearchField() {
    return Expanded(
      flex: 6,
      child: TextFiledWidget(
        fillColor: Theme.of(context).secondaryHeaderColor,
        hintText: AppStrings.searchBook,
        textInputAction: TextInputAction.search,
        onSubmitted: _onSearchSubmitted,
        type: TextInputType.text,
        textEditingController: _searchController,
      ),
    );
  }

  /// بناء مسافة أفقية
  Widget _buildHorizontalSpacing(double width) {
    return SizedBox(width: width.w);
  }

  /// بناء زر البحث
  Widget _buildSearchButton() {
    return Expanded(
      child: ButtonWidget(
        colorBorder: AppColors.primaryColor,
        colorButton: AppColors.primaryColor.withOpacity(0.20),
        title: 'search',
        onClick: _performSearch,
        multiWidget: _buildSearchIcon(),
      ),
    );
  }

  /// بناء أيقونة البحث
  Widget _buildSearchIcon() {
    return SvgPicture.asset(
      AppAssets.searchIcon,
      width: 22.w,
      height: 22.h,
      color: AppColors.primaryColor,
    );
  }

  /// بناء محتوى الكتب
  Widget _buildBooksContent() {
    return Column(
      children: [
        _buildSelectAllSection(),
        _buildBooksListSection(),
        _buildLoadingIndicator(),
      ],
    );
  }

  /// بناء قسم تحديد الكل
  Widget _buildSelectAllSection() {
    return SelectAllBooksSection(
      isArchive: widget.isArchive,
    );
  }

  /// بناء قسم قائمة الكتب
  Widget _buildBooksListSection() {
    return ListOfBooksSection(
      isArchive: widget.isArchive,
    );
  }

  /// بناء مؤشر التحميل
  Widget _buildLoadingIndicator() {
    return Visibility(
      visible: _isLoading,
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
        child: Center(
          child: LoadingAnimationWidget.threeArchedCircle(
            color: AppColors.primaryColor,
            size: 30,
          ),
        ),
      ),
    );
  }

  /// معالج إرسال البحث
  void _onSearchSubmitted(String searchText) {
    _performSearch();
  }

  /// تنفيذ البحث
  void _performSearch() {
    // يمكن تفعيل هذا المنطق عند الحاجة
    // if (_searchController.text.isNotEmpty) {
    //   BlocProvider.of<BooksBloc>(context).add(
    //     GetBooksEvents(
    //       pageList: 1,
    //       idFolder: widget.idFolder,
    //       nameBook: _searchController.text.trim(),
    //       type: 'search',
    //       isArchive: widget.isArchive,
    //     ),
    //   );
    // }
  }

  /// تحميل المزيد من الكتب (pagination)
  void _loadMoreBooks() {
    if (_currentPage != _totalPages) {
      setState(() {
        _isLoading = true;
        _currentPage++;
      });

      // يمكن تفعيل هذا المنطق عند الحاجة
      // BlocProvider.of<BooksBloc>(context).add(
      //   GetBooksEvents(
      //     idFolder: widget.idFolder,
      //     pageList: _currentPage,
      //     type: 'getBooksWithFolder',
      //     nameBook: _searchController.text,
      //     isArchive: widget.isArchive,
      //   ),
      // );
    }
  }

  /// فحص تحديد جميع الكتب
  void _checkAllSelected(List<dynamic> listBooks) {
    // يمكن تنفيذ هذا المنطق عند الحاجة
    // bool allSelected = true;
    //
    // for (var book in listBooks) {
    //   if (book.checkedBook == false) {
    //     allSelected = false;
    //     break;
    //   }
    // }
    //
    // setState(() {
    //   selectAll = allSelected;
    // });
  }

  /// فحص المسارات المحلية للكتب
  Future<bool> _checkLocalPaths(List<dynamic> books) async {
    bool result = false;

    for (int i = 0; i < books.length; i++) {
      // يمكن تنفيذ هذا المنطق عند الحاجة
      // final hasLocalPath = await BookProccessingController()
      //     .checkThePath(pathFile: books[i].localPath!);
      //
      // if (hasLocalPath) {
      //   setState(() {
      //     _booksPath.add(books[i].localPath!);
      //   });
      //   result = true;
      // } else {
      //   BlocProvider.of<SendMessageBloc>(context).add(
      //     ToFileEvent(books[i].fileUrl!, books[i].id, 'booksScreen'),
      //   );
      //   result = false;
      // }
    }

    return result;
  }

  /// تحديث حالة التحميل
  void _updateLoadingState(bool isLoading) {
    setState(() {
      _isLoading = isLoading;
    });
  }

  /// تحديث الصفحة الحالية
  void _updateCurrentPage(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  /// تحديث العدد الكلي للصفحات
  void _updateTotalPages(int totalPages) {
    setState(() {
      _totalPages = totalPages;
    });
  }

  /// إعادة تعيين حالة البحث
  void _resetSearchState() {
    setState(() {
      _currentPage = 1;
      _isLoading = false;
      _booksPath.clear();
    });
  }
}