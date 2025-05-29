
import 'package:file_picker/file_picker.dart';

import 'package:new_ilearn/exports.dart';
class GetFileCubit extends Cubit<CubitStates> {
  GetFileCubit() : super(LoadingState());


  String? fileName;
  File? pickedFile;
  String? fileExtension;


  Future pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'], // Restrict to images and PDFs
    );

    if (result != null && result.files.isNotEmpty) {
        fileName = result.files.single.name;
        pickedFile = File(result.files.single.path!);
        fileExtension = result.files.single.extension;
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
