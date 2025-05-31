import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_ilearn/core/pdf_handle/get_file_cubit.dart';
import 'package:new_ilearn/core/widgets/form_widget.dart';
import 'package:new_ilearn/core/widgets/imageCash_widget.dart';

import '../../../../exports.dart';

class BottomSheetAddFolder extends StatefulWidget {
  const BottomSheetAddFolder({
    super.key,
    this.folderImage,
    this.folderName,
    this.update = false,
    this.idFolder,
  });

  final String? folderName;
  final String? folderImage;
  final bool update;
  final String? idFolder;

  @override
  State<BottomSheetAddFolder> createState() => _BottomSheetAddFolderState();
}

class _BottomSheetAddFolderState extends State<BottomSheetAddFolder> {
  File? _imageFolder;
  String? _errorNameFolder;
  String? _errorImageFolder;
  late TextEditingController _nameFolder;

  @override
  void initState() {
    super.initState();
    _nameFolder = TextEditingController(text: widget.folderName ?? '');
  }

  @override
  void dispose() {
    _nameFolder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(context),
          _buildForm(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: double.infinity,
      height: 80,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(9),
          topLeft: Radius.circular(9),
        ),
        color: AppColors.white,
      ),
      child: Column(
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
              TextWidget(
                text: widget.update
                    ? AppStrings.updateFolder.trans
                    : AppStrings.createNewFolder.trans,
                fontSizeText: 20,
                fontWeight: FontWeight.bold,
              ),
              IconButton(
                onPressed: () => pop(),
                icon: Icon(
                  Icons.close,
                  size: 20,
                  color: Theme.of(context).textTheme.titleLarge!.color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormAuthentication(
            limitChar: 15,
            errorFiled: _errorNameFolder,
            textInputType: TextInputType.text,
            textEditingController: _nameFolder,
            hint: '',
            title: AppStrings.folderName.trans,
          ),
          TextWidget(
            text: '${AppStrings.imageGlory.trans} (${AppStrings.optional.trans})',
            fontSizeText: 14,
          ),
          const SizedBox(height: 8),
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: _selectImageFolder,
            child: Container(
              height: 140.h,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _errorImageFolder == null
                      ? Theme.of(context).textTheme.titleSmall!.color!
                      : Colors.red,
                ),
              ),
              child: Center(
                child: _imageFolder != null
                    ? Image.file(_imageFolder!)
                    : (widget.folderImage != null && widget.update)
                    ? ImageCached(
                  height: double.infinity,
                  urlImage: widget.folderImage!,
                )
                    : SvgPicture.asset(AppAssets.galleryAdd),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          if (_errorImageFolder != null)
            TextWidget(
              text: _errorImageFolder!,
              fontSizeText: 12,
              colorText: Colors.red,
            ),
          const SizedBox(height: 32),
          ButtonWidget(
            title: widget.update
                ? AppStrings.updateFolder.trans
                : AppStrings.create.trans,
            onClick: _createFolder,
          ),
        ],
      ),
    );
  }

  void _selectImageFolder() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFolder = File(pickedFile.path);
        _errorImageFolder = null;
        log('Selected Image: ${pickedFile.path}');
      });
    }
  }

  void _createFolder() {
    if (_checkForms()) {

      // Call your folder creation logic here
      // Ex: context.read<FolderCubit>().createFolder(_nameFolder.text, _imageFolder);
    }
  }

  bool _checkForms() {
    setState(() {
      _errorNameFolder = _nameFolder.text.isEmpty
          ? AppStrings.thisFieldRequired.trans
          : null;
      // _errorImageFolder = _imageFolder == null ? AppStrings.thisFieldRequired.trans : null;
    });

    return _errorNameFolder == null;
  }
}
