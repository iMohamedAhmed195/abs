import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ListBookShimmer extends StatelessWidget {
  const ListBookShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 8,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.w / 1.22.h,
            mainAxisSpacing: 17,
            crossAxisSpacing: 10,
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Container(
            height: 100.h,
            width: 110.w,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)),
          );
        },
      ),
    );
  }
}
