import 'package:image_picker/image_picker.dart';

import 'package:new_ilearn/exports.dart';

class SelectImageCubit extends Cubit<CubitStates> {
  SelectImageCubit() : super(LoadedState(data: []));

  final ImagePicker imagePicker = ImagePicker();
  List<String> images = [];

  Future<List<String>> selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.isNotNullOrEmpty) {
      selectedImages!.forEach((element) {
        print('ssd');
        print('added');
        images.add(element.path);
      });
      emit(LoadedState(data: images));
    }
    print("Image List Length:" + images.length.toString());
    return images;
  }

  void removeIndexOrRemoveAllImages({int? index}) async {
    if (index != null) {
      images.removeAt(index);
    } else {
      images.clear();
    }
    emit(LoadedState(data: images));
  }
}
