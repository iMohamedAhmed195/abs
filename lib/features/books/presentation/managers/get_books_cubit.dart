import 'package:new_ilearn/features/books/data/models/get_books_model.dart';
import 'package:new_ilearn/features/books/domain/use_cases/get_books_use_case.dart';
import '../../../../exports.dart';

class GetBooksCubit extends Cubit<CubitStates> {
  final GetBooksUseCase useCase;
  GetBooksCubit({required this.useCase}) : super(LoadingState());

  getBooks({required String? categoryId}) => managerExecute<BooksDataModel>(
    useCase.getBooks(categoryId: categoryId!),

    onSuccess: (data) {
      emit(LoadedState(data: data));
    },
    onFail: (message) => emit(FailedState(message: message)),
  );
}
