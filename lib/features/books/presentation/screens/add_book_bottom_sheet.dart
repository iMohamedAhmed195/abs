import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_ilearn/core/widgets/buttonAnimation_widget.dart';
import 'package:new_ilearn/core/widgets/errorBox_widget.dart';
import 'package:new_ilearn/core/widgets/form_widget.dart';
import 'package:new_ilearn/core/widgets/imageCash_widget.dart';
import 'package:new_ilearn/core/widgets/or_widget.dart';
import 'package:new_ilearn/core/widgets/select_file_or_Image_widget.dart';
import 'package:new_ilearn/core/widgets/textFiled_widget.dart';
import 'package:new_ilearn/features/books/data/models/add_books_request_model.dart';
import 'package:new_ilearn/features/books/presentation/Widgets/header_of_add_book_bottom_sheet.dart';
import 'package:new_ilearn/features/books/presentation/managers/add_books_cubit.dart';
import 'package:new_ilearn/features/bottom_navigation/presentation/managers/bottom_nav_operation_cubit.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../../../exports.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({super.key, required this.folderId});

  final String folderId;

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

late TextEditingController _nameBook;
late TextEditingController _link;
late TextEditingController _boxWriteTheBook;
late List<File> imageBook;
String? nameFile;
String? extension;
String? _path;
int size = 0;
String? _errorNameBook;
String? _errorImageBok;
String? _errorBook;
String? _errorLink;
File? book;
File? _bookWithImages;
File? _bookWithContent;
bool link = false;
bool content = false;
String progressText = '';
double progress = 0;
late String _status; //unClicked  clicked  success  failed
String idClickButton = '';

class _AddBookPageState extends State<AddBookPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameFile = null;
    idClickButton = '';
    extension = null;
    progressText = '';
    progress = 0;
    _errorNameBook = null;
    imageBook = [];
    book = null;
    link = false;
    content = false;
    _bookWithImages = null;
    _bookWithContent = null;
    _errorImageBok = null;
    _errorLink = null;
    _errorBook = null;
    _path = null;
    size = 0;

    _status = 'unClicked';
    _nameBook = TextEditingController();
    _link = TextEditingController();
    _boxWriteTheBook = TextEditingController();
  }

  @override
  void dispose() {
    _nameBook.dispose();
    _link.dispose();
    link = false;
    content = false;
    _bookWithImages = null;
    _bookWithContent = null;
    _boxWriteTheBook.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)  =>AddBooksCubit(useCase: ServiceLocator.instance.getIt()),
      child: BlocListener<AddBooksCubit, CubitStates>(
        listener: (context, state) {
          if (state is LoadedState){
            _status = 'success';
            // showToast(context: context, message: AppStrings.loginSuccessfully.trans, visibleMessage: true);
            setState(() {
            });
            pop();
            context.read<BottomNavOperationCubit>().changeIndex(0);
            Routes.bottomNavigationRoute.moveToCurrrentRouteAndRemoveAll;
          }
          else if (state is FailedState){
            _status = 'failed';
            // showToast(context: context, message: AppStrings.loginFailed.trans, visibleMessage: false);
            Future.delayed(Duration(seconds: 1), () {
              _status = 'unClicked';
              setState(() {
              });
            });
            setState(() {

            });
          }
          else if (state is LoadingState){
            _status = 'clicked';
            setState(() {

            });
          }
        },
        child: StatefulBuilder(
          builder:
              (context, setState) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HeaderOfAddBookBottomSheet(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8.h,
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(start: 20, end: 20, bottom: 30),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FormAuthentication(
                                limitChar: 15,
                                errorFiled: _errorNameBook,
                                textInputType: TextInputType.text,
                                textEditingController: _nameBook,
                                hint: AppStrings.bookName.trans,
                                title: AppStrings.bookName.trans,
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (enabledForms(type: 'bookFile')) {
                                    await selectFile();
                                  }
                                },
                                child: BoxSelectFileOrImage(
                                  useAnotherWay: () {
                                    clearForms();
                                  },
                                  showClearIcon: nameFile != null,
                                  enabled: enabledForms(type: 'bookFile'),
                                  borderColor: Theme.of(context).textTheme.titleSmall!.color!,
                                  extension: extension,
                                  isUploaded: nameFile != null ? true : false,
                                  icon: AppAssets.document_text_chat,
                                  title: AppStrings.uploadFile.trans,
                                  subTitle: nameFile != null ? '$nameFile' : AppStrings.uploadFileDescription.trans,
                                ),
                              ),
                              //Upload File
                              const OrWidget(),
                              //Divider or choose
                              const SizedBox(height: 16),
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (enabledForms(type: 'imageBook')) {
                                    if (imageBook.isEmpty) {
                                      await onSelectImages();
                                    }
                                  }
                                },
                                child: BoxSelectFileOrImage(
                                  useAnotherWay: () {
                                    clearForms();
                                  },
                                  showClearIcon: imageBook.isNotEmpty,
                                  // enabled: true,
                                  enabled: enabledForms(type: 'imageBook'),
                                  multiImages: ListView.builder(
                                    itemCount: imageBook.length + 1,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      int indexImage = index - 1;
                                      return Container(
                                        margin: const EdgeInsetsDirectional.only(end: 5),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                                        child:
                                            index == 0
                                                ? InkWell(
                                                  onTap: () async {
                                                    await onSelectImages();
                                                  },
                                                  child: Container(
                                                    width: MediaQuery.of(context).size.width * 0.35.w,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(8),
                                                      border: Border.all(
                                                        color: Theme.of(context).textTheme.titleSmall!.color!,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Icon(
                                                          Icons.image_sharp,
                                                          color: Theme.of(context).textTheme.titleLarge!.color,
                                                        ),
                                                        SizedBox(height: 10.h),
                                                        TextWidget(text: AppStrings.photoShoot.trans, fontSizeText: 13),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                                : Stack(
                                                  children: [
                                                    InkWell(
                                                      onTap: () async {
                                                        await viewImage(
                                                          itemCount: imageBook.length,
                                                          context: context,
                                                          initialPage: indexImage,
                                                          builder:
                                                              (context, imageIndex) => PhotoViewGalleryPageOptions(
                                                                errorBuilder: (context, error, stackTrace) {
                                                                  return const Center(child: ImageCached(urlImage: ''));
                                                                },
                                                                minScale: PhotoViewComputedScale.contained,
                                                                imageProvider: FileImage(imageBook[imageIndex]),
                                                              ),
                                                        );
                                                      },
                                                      child: Image.file(
                                                        imageBook[indexImage],
                                                        width: MediaQuery.of(context).size.width * 0.35.w,
                                                        height: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          imageBook.removeAt(indexImage);
                                                        });
                                                      },
                                                      child: const Align(
                                                        alignment: AlignmentDirectional.topStart,
                                                        child: Icon(Icons.cancel, color: Colors.red),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                      );
                                    },
                                  ),
                                  imagesPathList: imageBook,
                                  borderColor:
                                      _errorImageBok != null ? Colors.red : Theme.of(context).textTheme.titleSmall!.color!,
                                  // imagePath: imageBook,
                                  icon: AppAssets.cameraIcon,
                                  title: AppStrings.photoShoot.trans,
                                  subTitle: AppStrings.photoShootDescription.trans,
                                ),
                              ),
                              //Photo Shoot
                              const OrWidget(),
                              FormAuthentication(
                                  onChange: (val) {
                                    setState(() {
                                      link = val.isNotEmpty ? true : false;
                                    });
                                    removeError(context, Errors.CHOOSE_IMAGE_OR_FILE_ERROR);
                                  },
                                  suffixIcon: Visibility(
                                    visible: link,
                                    child: IconButton(
                                      onPressed: () => clearForms(),
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  fillColor: enabledForms(type: 'link') ? null : Theme.of(context).textTheme.titleSmall!.color,
                                  enabled: enabledForms(type: 'link'),
                                  errorFiled: _errorLink,
                                  textInputType: TextInputType.text,
                                  textEditingController: _link,
                                  hint: 'https://www.youtube.com',
                                  title: AppStrings.addYoutubeLink.trans),
                              const OrWidget(),

                              const SizedBox(height: 16),
                              TextFiledWidget(
                                onChange: (val) {
                                  setState(() {
                                    content = val.isNotEmpty ? true : false;
                                    removeError(context, Errors.CHOOSE_IMAGE_OR_FILE_ERROR);
                                  });
                                },
                                // enabled: true,
                                enabled: enabledForms(type: 'content'),
                                hintColor: Theme.of(context).textTheme.titleMedium!.color!,
                                fillColor:
                                    enabledForms(type: 'content')
                                        ? Theme.of(context).splashColor
                                        : Theme.of(context).textTheme.titleSmall!.color,
                                type: TextInputType.text,
                                textEditingController: _boxWriteTheBook,
                                maxLine: 4,
                                hintText: AppStrings.writeHere.trans,
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: CubitErrorWidget(errorType: Errors.CHOOSE_IMAGE_OR_FILE_ERROR),
                                ),
                              ),
                              const SizedBox(height: 10),
                              ButtonAnimation(
                                progress: progress,
                                progressText: progressText,
                                showProgress: true,
                                status: _status,
                                onClickButton: () async{
                                  errorForm();
                                  checkBoolError(context, _boxWriteTheBook.text.isNotEmpty || _link.text.isNotEmpty || _path.isNotNull || _bookWithImages.isNotNull, Errors.CHOOSE_IMAGE_OR_FILE_ERROR);
                                  if (checkForms() && dontHaveErrors(context)) {
                                    if (_boxWriteTheBook.text.isNotEmpty) {
                                      await contentToPdf();
                                    }
                                    setState(() {
                                      idClickButton = DateTime.now().toString();
                                    });
                                    print('a7oo');
                                    print(_nameBook.text);
                                    print(_bookWithImages?.path);
                                    print( widget.folderId);
                                    print(_path);
                                    print(_boxWriteTheBook.text);
                                    context.read<AddBooksCubit>().addBook(
                                      addBooksRequestModel: AddBooksRequestModel(
                                        name: _nameBook.text,
                                        image: _bookWithImages?.path,
                                        categoryId: widget.folderId,
                                        file: _path,
                                        content: _boxWriteTheBook.text,
                                        link: _link.text,
                                      ),
                                    );
                                  }
                                },
                                titleButton: AppStrings.create.trans,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }

  selectFile() async {
    PlatformFile? resultSelectFile = await selectFileFunction();
    if (resultSelectFile != null) {
      setState(() {
        nameFile = resultSelectFile.name;
        extension = resultSelectFile.extension;
        size = resultSelectFile.size;
        _path = resultSelectFile.path;
        removeError(context, Errors.CHOOSE_IMAGE_OR_FILE_ERROR);
        book = File(_path!);
        log(extension!);
        log('file path=> ${resultSelectFile.path}');
      });
    }
  }

  bool checkForms() {
    if (_nameBook.text.isNotEmpty &&
        (_path != null ||
            _bookWithImages != null ||
            (_link.text.isNotEmpty && isValidUrl() == true) ||
            _boxWriteTheBook.text.isNotEmpty)) {
      return true;
    } else {
      return false;
    }
  }

  errorForm() {
    setState(() {
      _errorNameBook = _nameBook.text.isNotEmpty ? null : AppStrings.thisFieldRequired.trans;

      _errorBook =
          _nameBook.text.isNotEmpty &&
                  (_path != null ||
                      _bookWithImages != null ||
                      _link.text.isNotEmpty ||
                      _boxWriteTheBook.text.isNotEmpty)
              ? null
              : _nameBook.text.isEmpty
              ? '${AppStrings.bookName.trans} ${AppStrings.thisFieldRequired.trans}'
              : AppStrings.errorAddBookValidation.trans;

      _errorLink = _link.text.isNotEmpty ? isValidUrl() == true ? null : AppStrings.errorLinkWithAddBook.trans : null;
    });
  }

  bool isValidUrl() {
    final regExp = RegExp(
      r'^(https?:\/\/)?(www\.)?(youtube\.com|youtu\.be)\/.+',
      caseSensitive: false,
    );
    return regExp.hasMatch(_link.text.trim());
  }

  addBook() async {

  }

  onSelectImages() async {
    bool? result = await choseImage();
    if(result.isNotNull)
   {
     if (result!) {
       var permission = await Permission.camera.request();
       File? image = await selectImageFunction(isChoseWithGallery: false);
       if (image != null) {
         setState(() {
           imageBook.insert(0, image);
         });
         var bookWithImage = await photoBook(imageBook);
         setState(() {
           _bookWithImages = bookWithImage;
           removeError(context, Errors.CHOOSE_IMAGE_OR_FILE_ERROR);
         });
       }
     }
     else {
       var images = await ImagePicker().pickMultiImage();
       setState(() {
         imageBook.insertAll(0, images.map((e) => File(e.path)).toList());
       });

       var bookWithImage = await photoBook(imageBook);
       setState(() {
         _bookWithImages = bookWithImage;
         removeError(context, Errors.CHOOSE_IMAGE_OR_FILE_ERROR);
       });
     }
   }
  }

  Future<bool?> choseImage() async {
    bool? choseImageWithCamera ;
    await showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(9), topRight: Radius.circular(9)),
      ),
      useSafeArea: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      isScrollControlled: true,
      context: context,
      builder:
          (context) => SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsetsDirectional.only(bottom: 14),
                  padding: const EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 20),
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(9), topLeft: Radius.circular(9)),
                    color: Theme.of(context).cardColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        height: 4,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Theme.of(context).textTheme.titleMedium!.color,
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(text: AppStrings.chooseImage.trans, fontSizeText: 20, fontWeight: FontWeight.bold),
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(size: 20, Icons.close, color: Theme.of(context).textTheme.titleLarge!.color),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    choseImageWithCamera = true;
                  },
                  leading: const Icon(Icons.camera),
                  title: TextWidget(text: AppStrings.useCamera, fontSizeText: 15),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    choseImageWithCamera = false;
                  },
                  leading: const Icon(Icons.image),
                  title: TextWidget(text: AppStrings.usingGallery, fontSizeText: 15),
                ),
              ],
            ),
          ),
    );
    return choseImageWithCamera ?? null;
  }

  contentToPdf() async {
    if (_boxWriteTheBook.text.isNotEmpty && book == null && _bookWithImages == null) {
      String path = await convertToPdf(content: _boxWriteTheBook.text);
      setState(() {
        _bookWithContent = File(path);
      });
    }
  }

  bool enabledForms({required String type}) {
    switch (type) {
      case 'link':
        return nameFile == null && imageBook.isEmpty && content == false ? true : false;
      case 'bookFile':
        return link == false && imageBook.isEmpty && content == false ? true : false;
      case 'imageBook':
        return link == false && nameFile == null && content == false ? true : false;
      case 'content':
        return link == false && nameFile == null && imageBook.isEmpty ? true : false;
      default:
        return true;
    }
  }

  clearForms() {
    setState(() {
      content = false;
      link = false;
      nameFile = null;
      book = null;
      imageBook = [];
      _path = null;
      _bookWithImages = null;
      _link.text = '';
      _boxWriteTheBook.text = '';
    });
  }
}
