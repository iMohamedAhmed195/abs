import 'dart:async';
import 'dart:developer';

import 'package:docx_to_text/docx_to_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../constants/localization_constants.dart';
import '../../exports.dart';
import '../widgets/custom_dialog.dart';
import 'package:photo_view/photo_view_gallery.dart';

void showToast({
  required BuildContext context,
  required String message,
  required visibleMessage,
  ToastGravity gravity = ToastGravity.BOTTOM,
  int durationSeconds = 3,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: gravity,
    backgroundColor: visibleMessage ? Colors.green : Colors.red,
    textColor: Colors.white,
    fontSize: 14.0,
    timeInSecForIosWeb: durationSeconds,
  );
}

showSnackBar({required String message, required AlertTypes alertType, Duration? duration}) {
  Color backgroundColor = AppColors.white;
  if (alertType == AlertTypes.success) {
    backgroundColor = AppColors.green;
  } else if (alertType == AlertTypes.error) {
    backgroundColor = AppColors.red;
  } else if (alertType == AlertTypes.loading) {
    backgroundColor = AppColors.brown;
  }
  SnackBar snackBar = SnackBar(
    dismissDirection: DismissDirection.startToEnd,
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(message, style: getMediumTextStyle(color: AppColors.white, fontSize: 16))),
        if (alertType == AlertTypes.loading)
          SizedBox(height: 30, width: 30, child: CircularProgressIndicator(color: AppColors.white)),
      ],
    ),
    backgroundColor: backgroundColor,
    duration: duration ?? const Duration(seconds: 3),
  );
  ScaffoldMessenger.of(getContext).showSnackBar(snackBar);
}

dismissSnackBar() {
  ScaffoldMessenger.of(getContext).hideCurrentSnackBar();
}

Future<T?> showCustomDialog<T>({
  String? message,
  Widget? child,
  bool isAlert = true,
  AlertTypes dialogType = AlertTypes.loading,
  bool dismissible = false,
}) => showDialog<T>(
  context: getContext,
  barrierDismissible: dismissible,
  builder: (context) {
    return isAlert ? AlertDialog(content: child) : CustomDialog(message: message, dialogType: dialogType);
  },
);
Future showCustomDialogWithTimer({
  String? message,
  bool dismissible = true,
  AlertTypes dialogType = AlertTypes.loading,
  DialogTimingTypes dialogTimingType = DialogTimingTypes.long,
  void Function()? onTimeOut,
}) async {
  if (_isThereCurrentDialogShowing(getContext).isTrue) {
    pop();
  }
  showCustomDialog(isAlert: false, message: message, dialogType: dialogType, dismissible: dismissible);
  Timer(
    Duration(
      milliseconds:
          dialogTimingType == DialogTimingTypes.long
              ? AppConstants.dialogLongDuration
              : AppConstants.dialogShortDuration,
    ),
    () {
      pop();
      if (onTimeOut.isNotNull) {
        onTimeOut!();
      }
    },
  );
}

/* check whether Alert Dialog is open */
bool _isThereCurrentDialogShowing(BuildContext context) => ModalRoute.of(context)?.isCurrent != true;
/*hide keypad if it is shown*/
requestFocus(FocusNode focusNode) => FocusScope.of(getContext).requestFocus(focusNode);
showDateTimeDialog({DateTime? initialDate, DateTime? firstDate, DateTime? lastDate}) => showDatePicker(
  context: getContext,
  builder:
      (context, child) => Theme(
        data: ThemeData.light().copyWith(
          dialogBackgroundColor: AppColors.white,
          colorScheme: const ColorScheme.light(
            primary: AppColors.primaryColor, //dialog header background color
            onPrimary: AppColors.white, //selected text color and border
          ),
        ),
        child: child!,
      ),
  locale:
      // getBlocData<LanguageCubit>().isEn
      //     ? AppConstants.enLocale
      //     :
      AppLocalizationsConstants().arLocale,
  initialDate: initialDate.isNotNull ? initialDate! : DateTime.now(),
  firstDate: firstDate.isNotNull ? firstDate! : DateTime.now(),
  lastDate: lastDate.isNotNull ? lastDate! : DateTime(DateTime.now().year + AppConstants.maxYears),
);

/// show child widget in dialog
Future<T?> showInDialog<T>({
  String? title,
  Widget? child,
  Widget? Function(BuildContext)? builder,
  ShapeBorder? shape,
  TextStyle? titleTextStyle,
  EdgeInsetsGeometry? contentPadding,
  //bool scrollable = false,
  EdgeInsetsGeometry? titlePadding,
  Color? backgroundColor,
  DialogAnimation dialogAnimation = DialogAnimation.DEFAULT,
  double? elevation,
  Color? barrierColor,
  //EdgeInsets insetPadding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
  List<Widget>? actions,
  bool barrierDismissible = true,
  bool hideSoftKeyboard = true,
  Duration? transitionDuration,
  Curve curve = Curves.easeInBack,
}) async {
  if (hideSoftKeyboard) hideKeyboard;

  return await showGeneralDialog<T>(
    context: getContext,
    barrierColor: barrierColor ?? Colors.black54,
    pageBuilder: (context, animation, secondaryAnimation) {
      return Container();
    },
    barrierLabel: '',
    barrierDismissible: barrierDismissible,
    transitionDuration: transitionDuration ?? 400.milliseconds,
    transitionBuilder: (context, animation, secondaryAnimation, c) {
      return dialogAnimatedWrapperWidget(
        animation: animation,
        dialogAnimation: dialogAnimation,
        curve: curve,
        child: AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          content: builder != null ? builder.call(context) : child,
          shape: shape,
          titlePadding: titlePadding,
          title: Text(title!),
          titleTextStyle: titleTextStyle,
          contentPadding: contentPadding ?? const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
          //scrollable: scrollable,
          backgroundColor: backgroundColor,
          elevation: elevation ?? AppConstants.defaultElevation,
          //insetPadding: insetPadding,
          actions: actions,
          icon: GestureDetector(
            onTap: pop,
            child: Align(alignment: AlignmentDirectional.centerStart, child: Icon(Icons.close)),
          ),
        ),
      );
    },
  );
}

viewImage({
  required BuildContext context,
  required int initialPage,
  int itemCount = 1,
  required PhotoViewGalleryPageOptions Function(BuildContext context, int index) builder,
}) async {
  await showDialog(
    barrierColor: Colors.black38,
    context: context,
    builder:
        (context) => Dismissible(
          resizeDuration: const Duration(microseconds: 1),
          direction: DismissDirection.vertical,
          onDismissed: (direction) {
            Navigator.of(context).pop();
          },
          key: const Key('imageView'),
          child: PhotoViewGallery.builder(
            loadingBuilder: (context, event) {
              return Center(child: LoadingAnimationWidget.discreteCircle(color: Colors.white, size: 30));
            },
            pageController: PageController(initialPage: initialPage),
            backgroundDecoration: const BoxDecoration(color: Colors.transparent),
            builder: builder,
            itemCount: itemCount,
          ),
        ),
  );
}

Future<PlatformFile?> selectFileFunction() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(allowedExtensions: ['pdf'], type: FileType.custom);

  if (result != null) {
    File selectedFile = File(result.files.single.path!);
    Directory? documentsDir = await getApplicationDocumentsDirectory();

    // Replace spaces in the file name with underscores (or remove them)
    String fileName = selectedFile.path.split('/').last.replaceAll(' ', '_');

    String newFilePath = "${documentsDir.path}/$fileName";
    log(newFilePath);

    File newFile = await selectedFile.copy(newFilePath);

    PlatformFile platformFile = PlatformFile(
      name: fileName, // Use the sanitized file name
      size: await newFile.length(),
      path: newFile.path,
    );

    return platformFile;
  }
  return null;
}

Future<String> convertToPdf({String? path, String? content}) async {
  final ByteData bytes = await rootBundle.load('assets/fonts/arial.ttf');
  final List<int> fontBytes = bytes.buffer.asUint8List();
  final PdfFont arabicFont = PdfTrueTypeFont(fontBytes, 24);

  var docx;
  if (path != null && path.isNotEmpty) {
    docx = docxToText(File(path).readAsBytesSync());
  }

  String text = docx ?? content ?? "";

  PdfDocument pdfDocument = PdfDocument();
  pdfDocument.pageSettings.size = PdfPageSize.a4;

  PdfTextElement textElement = PdfTextElement(
    text: text,
    font: arabicFont,
    format: PdfStringFormat(textDirection: PdfTextDirection.rightToLeft, alignment: PdfTextAlignment.center),
  );

  textElement.draw(
    page: pdfDocument.pages.add(),
    bounds: Rect.fromLTWH(0, 0, pdfDocument.pageSettings.size.width, pdfDocument.pageSettings.size.height),
  );

  final directory = await getApplicationDocumentsDirectory();
  final String filePath = '${directory.path}/${DateTime.now()}_ILearnDocumentFile.pdf';
  var save = await pdfDocument.save();
  var file = await File(filePath).writeAsBytes(save);

  await file.readAsBytes();
  return file.path;
}
Future<File?> selectImageFunction({bool isChoseWithGallery = true}) async {
  final ImagePicker picker = ImagePicker();
  XFile? image = await picker.pickImage(
      source: isChoseWithGallery ? ImageSource.gallery : ImageSource.camera);
  if (image != null) {
    log('image.path${image.path}');
    return File(image.path);
  }
  return null;
}
Future<File?> photoBook(List<File> images) async {
  var file = await convertImagesToPdf(images);
  if (file != null) {
    log(file.path);
    return file;
  }
  return null;
}

Future<File?> convertImagesToPdf(List<File> images) async {
  if (images.isNotEmpty) {
    final PdfDocument document = PdfDocument();
    for (var img in images) {
      final imageFile = File(img.path);
      final imageBytes = imageFile.readAsBytesSync();
      final PdfBitmap pdfImage = PdfBitmap(imageBytes);
      final page = document.pages.add();
      page.graphics.drawImage(pdfImage,
          const Rect.fromLTWH(0, 0, 500, 500)); // حجم الصورة في الصفحة
    }

    final outputDirectory = await getApplicationDocumentsDirectory();
    final outputFile =
    File('${outputDirectory.path}/${DateTime.now()}_photo_book.pdf');
    await outputFile.writeAsBytes(await document.save());
    document.dispose();

    return outputFile;
  }
  return null;
}
