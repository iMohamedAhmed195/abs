
import 'package:image_picker/image_picker.dart';

import '../../exports.dart';
import 'image_picker_dialog.dart';

Future getCameraImage({bool isCamera = true}) async {
  final pickedImage =
      await ImagePicker().pickImage(imageQuality: 60, source: isCamera ? ImageSource.camera : ImageSource.gallery);

  return File(pickedImage!.path);
}

Future<List<File>> getMultipleImageSource({bool isCamera = true}) async {
  final List<XFile> pickedImage = await ImagePicker().pickMultiImage(
    imageQuality: 60,
  );
  return pickedImage.map((e) => File(e.path)).toList();
}

Future<String> get getFromGallery async {
  List<File> files = await getMultipleImageSource();
  return files[0].path;
}

Future<String> get getImageFromCamera async {
  File file = await getCameraImage();

  return file.path;
}

Future<String?> showPickDialog(BuildContext context, String? image) async {
  GalleryFileTypes? galleryFileTypes = await showInDialog<GalleryFileTypes>(
    //textDirection: getBlocData<LanguageCubit>().isEn ? TextDirection.ltr : TextDirection.rtl,
    contentPadding: const EdgeInsets.symmetric(vertical: 16),
    title: AppStrings.chooseAction.trans,
    titleTextStyle: getBoldTextStyle(fontSize: 16, color: Colors.amber),
    builder: (context) => FilePickerDialog(isSelected: (image.isNotNull)),
  );
  if (galleryFileTypes.isNotNull) {
    if (galleryFileTypes.isEqualTo(GalleryFileTypes.CAMERA)) {
      // image = await getImageFromCamera;
    } else if (galleryFileTypes.isEqualTo(GalleryFileTypes.GALLERY)) {
      image = await getFromGallery;
    } else if (galleryFileTypes.isEqualTo(GalleryFileTypes.REMOVE)) {
      image = null;
    }
  }
  return image;
}
