import 'package:new_ilearn/exports.dart';

class DefaultFilter extends FilterAbstract {
  @override
  // TODO: implement props
  List<Object?> get props => [];

  @override
  toJson() => {'page': page};
}

abstract class CubitListView<Model> extends Cubit<CubitStates> {
  ListUseCases listUseCases;
  List<Model> list = [];
  int? numberOfPages;
  bool isFirstLoaded = false;
  bool isAllLoaded = false;
  CubitListView({required this.listUseCases}) : super(InitialState());
  FilterAbstract? filterAbstract;
  int? id;

  Future<List<Model>?>? getList({int? id, FilterAbstract? query}) async {
    this.id = id;
    if (query == null) {
      filterAbstract = DefaultFilter();
    } else {
      this.filterAbstract = query;
    }
    List<Model> returnedData = (await managerExecute<ListModel<Model>>(
          listUseCases.getList(id: id, query: filterAbstract),
          onSuccess: (ListModel<Model>? data) {
            print("entered sta");
            list = data!.list!;
            numberOfPages = data.numberOfPages ?? 1;
            if (numberOfPages! > 1) {
              isAllLoaded = false;
            }
            isFirstLoaded = true;
            print("length from cubit" + list.length.toString());
            emit(LoadedState<List<Model>>(data: list));
          },
          onFail: (message) {
            emit(FailedState(message: message));
          },
          onStart: () {
            emit(LoadingState());
          },
        ))
            ?.list ??
        [];
    return returnedData;
  }

  getMoreList() {
    if (filterAbstract!.page < numberOfPages! && !(state is LoadingMoreState)) {
      filterAbstract!.page++;
      if (filterAbstract!.page == numberOfPages) {
        isAllLoaded = true;
      }
      return managerExecute<ListModel<Model>>(
        listUseCases.getList(id: id, query: filterAbstract),
        onSuccess: (ListModel<Model>? data) {
          list.addAll(data!.list!);
          emit(LoadedState<List<Model>>(data: list));
        },
        onFail: (message) {
          emit(FailedState(message: message));
        },
        onStart: () {
          emit(LoadingMoreState(data: list));
        },
      );
    }
  }

  removeFromList(Model item) {
    list.remove(item);
    emit(LoadedState<List<Model>>(data: list));
  }

  addTolList(Model item) {
    list.add(item);
    emit(LoadedState<List<Model>>(data: list));
  }

  insetAt(int index, Model item) {
    list.insert(index, item);
    emit(LoadedState<List<Model>>(data: list));
  }
}
