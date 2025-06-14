
import 'package:file_picker/file_picker.dart';

import 'package:new_ilearn/exports.dart';
class GetFileCubit extends Cubit<CubitStates> {
  GetFileCubit() : super(LoadingState());


  String? fileName;
  File? pickedFile;
  String? fileExtension;
  String? uploadFileUrl;


  Future pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpg', 'jpeg', 'png', 'pdf', 'zip', 'docx', 'txt' // Added zip, docx, txt
      ],
    );

    if (result != null && result.files.isNotEmpty) {
      fileName = result.files.single.name;
      pickedFile = File(result.files.single.path!);
      fileExtension = result.files.single.extension;
      uploadFileUrl = result.files.single.path;
      emit(ChangeState());
    }
  }

  void removeIndexOrRemoveAllImages() async {

    fileName= null;
    pickedFile= null;
    fileExtension = null;

    emit(ChangeState());
  }

}
