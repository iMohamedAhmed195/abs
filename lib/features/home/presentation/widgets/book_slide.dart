 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_ilearn/core/widgets/viewAll_widget.dart';
import 'package:new_ilearn/features/home/presentation/widgets/foldersAndBooks_widgets.dart';

import '../../../../exports.dart';

class BookSlide extends StatelessWidget {
  const BookSlide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible:true,
      child: Column(
        children: [
          ViewAll(
            showViewAll: true,
            title: AppStrings.books.trans,
            onClick: (){},
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.26.h,
            child: ListView.builder(
              padding: const EdgeInsetsDirectional.symmetric(
                  vertical: 10, horizontal: 16),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount:  10,
              itemBuilder: (context, index) {
                return FoldersAndBooks(
                  isBook: true,
                  width: MediaQuery.of(context).size.width * 0.35.w,
                  isShowDeleteButton: false,
                  delete: () {
                    // BlocProvider.of<BooksBloc>(context).add(
                    //     DeleteBookEvent(
                    //         state.listBooks![index].id));
                  },
                  onClick: () {},
                  showButton: true,
                  bookId: "3",
                  heightImage: 90.h,
                  image: AppAssets.InfoIcon,
                  title: "title",
                  fileUrl: "https://example.com/file.pdf",
                  path: "https://example.com/file.pdf",
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
