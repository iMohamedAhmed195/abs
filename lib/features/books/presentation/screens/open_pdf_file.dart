import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:new_ilearn/core/widgets/textFiled_widget.dart';
import 'package:new_ilearn/features/bottom_navigation/presentation/widget/custom_appbar_widget.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../exports.dart';

class OpenFilePdfPage extends StatefulWidget {
  const OpenFilePdfPage({super.key, required this.nameFile, required this.path});

  final String nameFile;
  final String path;

  @override
  State<OpenFilePdfPage> createState() => _OpenFilePdfPageState();
}

late TextEditingController _search;
late PdfViewerController _pdfController;
bool _searchButtonEnable = false;
PdfTextSearchResult _resultSearch = PdfTextSearchResult();
bool _isSearchingNow = false;
int _totalInstanceCount = 0;
int _instanceCount = 1;

class _OpenFilePdfPageState extends State<OpenFilePdfPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _search = TextEditingController();
    _pdfController = PdfViewerController();
    _searchButtonEnable = false;
    _totalInstanceCount = 0;
    _instanceCount = 1;
    _isSearchingNow = false;
  }

  @override
  void dispose() {
    _search.dispose();
    _pdfController.dispose();
    _searchButtonEnable = false;
    _totalInstanceCount = 0;
    _isSearchingNow = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: false,
        title: widget.nameFile,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (_searchButtonEnable) {
                  _resultSearch.clear();
                }
                _searchButtonEnable = !_searchButtonEnable;
              });
            },
            icon:
                !_searchButtonEnable
                    ? SvgPicture.asset(AppAssets.searchIcon, color: Theme.of(context).textTheme.titleMedium!.color)
                    : const Icon(Icons.close, color: Colors.red),
          ),
          Visibility(
            visible: _totalInstanceCount > 1,
            child: Row(
              children: [
                TextWidget(text: _totalInstanceCount.toString(), fontSizeText: 10),
                IconButton(
                  onPressed: () {
                    if (_instanceCount > 1) {
                      _resultSearch.previousInstance();
                      setState(() {
                        _instanceCount = _resultSearch.currentInstanceIndex;
                      });
                    }
                  },
                  icon: Icon(Icons.keyboard_arrow_up_sharp, color: Theme.of(context).textTheme.titleLarge!.color),
                ),
                TextWidget(text: _instanceCount.toString(), fontSizeText: 10),
                IconButton(
                  onPressed: () {
                    if (_instanceCount != _totalInstanceCount) {
                      _resultSearch.nextInstance();
                      setState(() {
                        _instanceCount = _resultSearch.currentInstanceIndex;
                      });
                    }
                  },
                  icon: Icon(Icons.keyboard_arrow_down_rounded, color: Theme.of(context).textTheme.titleLarge!.color),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Visibility(
            visible: _searchButtonEnable,
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: TextFiledWidget(
                      hintText: AppStrings.searchFromFile,
                      type: TextInputType.text,
                      textEditingController: _search,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: ButtonWidget(
                      colorBorder: AppColors.primaryColor,
                      colorButton: AppColors.primaryColor.withOpacity(0.20),
                      title: 'search',
                      onClick: () => search(),
                      multiWidget:
                          _isSearchingNow
                              ? CupertinoActivityIndicator(color: Theme.of(context).textTheme.titleLarge!.color!)
                              : SvgPicture.asset(
                                AppAssets.searchIcon,
                                width: 22.w,
                                height: 22.h,
                                color: AppColors.primaryColor,
                              ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: SfPdfViewer.file(
              controller: _pdfController,
              File(widget.path),
              currentSearchTextHighlightColor: AppColors.primaryColor.withOpacity(0.60),
              otherSearchTextHighlightColor: Colors.yellow.withOpacity(0.30),
            ),
          ),
        ],
      ),
    );
  }

  search() {
    log('textSearch${_search.text}');
    if (_isSearchingNow == false) {
      setState(() {
        _isSearchingNow = true;
        _resultSearch = _pdfController.searchText(_search.text);
      });
      _resultSearch.addListener(() {
        setState(() {
          _isSearchingNow = false;
          setState(() {
            _totalInstanceCount = _resultSearch.totalInstanceCount;
            _instanceCount = _resultSearch.currentInstanceIndex;
          });
        });
      });
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    }
  }
}
