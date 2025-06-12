import 'package:new_ilearn/features/profile/data/models/profile_model.dart';
import 'package:new_ilearn/features/profile/data/models/reports_model.dart';

import '../../../../exports.dart';

abstract class UpdateProfileRemoteDataSource {
  Future<ResponseModel> updateProfile({required ProfileModel profileModel});
}
class  UpdateProfileRemoteDataSourceImp  extends RemoteExecuteImpl implements UpdateProfileRemoteDataSource {
  UpdateProfileRemoteDataSourceImp({required super.dioConsumer});

  @override
  Future<ResponseModel> updateProfile({required ProfileModel profileModel}) =>updateData(
      isFormData: true,
       data: profileModel.toJson(),
      endPoint: EndPoints.profile, getFromJsonFunction: ProfileResponseModel.fromJson);
}