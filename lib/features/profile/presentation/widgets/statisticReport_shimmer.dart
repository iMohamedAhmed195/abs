import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class StatisticReportShimmer extends StatelessWidget {
  const StatisticReportShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsetsDirectional.only(end: 8),
                  width: MediaQuery.of(context).size.width * 0.3.w,
                  height: MediaQuery.of(context).size.height * 0.04.h,
                  color: Colors.white,
                ),
                Container(
                  margin: const EdgeInsetsDirectional.only(end: 8),
                  width: MediaQuery.of(context).size.width * 0.3.w,
                  height: MediaQuery.of(context).size.height * 0.04.h,
                  color: Colors.white,
                ),
                Container(
                  margin: const EdgeInsetsDirectional.only(end: 8),
                  width: MediaQuery.of(context).size.width * 0.3.w,
                  height: MediaQuery.of(context).size.height * 0.04.h,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16,),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2.h,
          ),
          const SizedBox(height: 16,),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsetsDirectional.only(end: 8),
                  width: MediaQuery.of(context).size.width * 0.3.w,
                  height: MediaQuery.of(context).size.height * 0.05.h,
                  color: Colors.white,
                ),
                Container(
                  margin: const EdgeInsetsDirectional.only(end: 8),
                  width: MediaQuery.of(context).size.width * 0.3.w,
                  height: MediaQuery.of(context).size.height * 0.05.h,
                  color: Colors.white,
                ),
                Container(
                  margin: const EdgeInsetsDirectional.only(end: 8),
                  width: MediaQuery.of(context).size.width * 0.3.w,
                  height: MediaQuery.of(context).size.height * 0.05.h,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(height: 15,),
          Container(
            margin: const EdgeInsetsDirectional.only(end: 8,bottom: 8),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.07.h,
            color: Colors.white,
          ),  Container(
            margin: const EdgeInsetsDirectional.only(end: 8,bottom: 8),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.07.h,
            color: Colors.white,
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(end: 8, bottom: 8),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.07.h,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
