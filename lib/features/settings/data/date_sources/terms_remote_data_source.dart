import '../../../../exports.dart';

abstract class TermsRemoteDataSource {
  Future<ResponseModel> getTerms();
}
class TermsRemoteDataSourceImp extends RemoteExecuteImpl implements TermsRemoteDataSource {
  TermsRemoteDataSourceImp({required super.dioConsumer});

  @override
  Future<ResponseModel> getTerms()=> getData(endPoint: EndPoints.terms, getFromJsonFunction: ResponseModel.fromJson);

}