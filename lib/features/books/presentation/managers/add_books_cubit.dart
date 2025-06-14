import 'package:new_ilearn/features/books/data/models/add_books_request_model.dart';
import 'package:new_ilearn/features/books/domain/use_cases/add_books_use_case.dart';
import '../../../../exports.dart';

class AddBooksCubit extends Cubit<CubitStates> {
  final AddBooksUseCase useCase;
  AddBooksCubit({required this.useCase}) : super(LoadingState());

  addBook({required AddBooksRequestModel addBooksRequestModel}) => managerExecute(
     useCase.getBooks(addBooksRequestModel: addBooksRequestModel),
    onSuccess: (data) {
      emit(LoadedState(data: data));
    },
    onFail: (message) => emit(FailedState(message: message)),
  );
}
