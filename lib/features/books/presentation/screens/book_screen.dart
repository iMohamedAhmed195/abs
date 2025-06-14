import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:new_ilearn/features/books/presentation/Widgets/add_book_card_section.dart';
import 'package:new_ilearn/features/books/presentation/Widgets/create_exam_or_start_section.dart';
import 'package:new_ilearn/features/books/presentation/Widgets/list_of_books_section.dart';
import 'package:new_ilearn/features/books/presentation/Widgets/select_all_books_section.dart';
import 'package:new_ilearn/features/bottom_navigation/presentation/widget/custom_appbar_widget.dart';

import '../../../../exports.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key, required this.titleHeader, required this.idFolder, this.isArchive = false});

  final String titleHeader;
  final String idFolder;
  final bool isArchive;

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: widget.titleHeader ?? AppStrings.books.trans),
      child: _buildMainContent(),
      bottomNavRoute: const CreateExamOrStartSection(),
    );
  }

  /// بناء المحتوى الرئيسي
  Widget _buildMainContent() {
    return ListView(
      controller: _scrollController,
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
      children: [
        AddBookCardSection(idFolder: widget.idFolder,),
        SizedBox(height: 16.h),
        SelectAllBooksSection(isArchive: widget.isArchive),
        ListOfBooksSection(isArchive: widget.isArchive),

      ],
    );
  }


}
