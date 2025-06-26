import 'package:abs/exports.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelectorSection extends StatefulWidget {
  final DateTime startDate;
  const DateSelectorSection({super.key, required this.startDate});

  @override
  State<DateSelectorSection> createState() => _DateSelectorSectionState();
}

class _DateSelectorSectionState extends State<DateSelectorSection> {
  late DateTime selectedDate;

  // Arabic day names
  final List<String> weekDaysArabic = ['سبت', 'حد', 'اتنين', 'ثلاث', 'اربع', 'خميس', 'جمعة'];

  @override
  void initState() {
    super.initState();
    selectedDate = widget.startDate;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(7, (index) {
        final currentDate = widget.startDate.add(Duration(days: index));
        final isSelected =
            selectedDate.day == currentDate.day &&
            selectedDate.month == currentDate.month &&
            selectedDate.year == currentDate.year;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedDate = currentDate;
              print('Selected: ${DateFormat('EEEE, d MMMM y', 'ar').format(selectedDate)}');
              _showCustomDateSheet();
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: 42.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: isSelected ? Colors.orange : Colors.transparent,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  weekDaysArabic[index],
                  style: getMediumTextStyle(
                    fontSize: 12,
                    color: isSelected ? AppColors.white : AppColors.textCalendarColor,
                  ),
                ),
                Text(
                  currentDate.day.toString(),
                  style: getBoldTextStyle(
                    fontSize: 16,
                    color: isSelected ? AppColors.white : AppColors.textCalendarColor,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
  void _showCustomDateSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(24.w),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.info_outline, size: 32, color: AppColors.primaryColor),
              12.vs,
              Text(
                "غير متوفر حاليًا",
                style: getBoldTextStyle(fontSize: 16, color: AppColors.black),
              ),
              8.vs,
              Text(
                "سيتم إضافة هذه الميزة قريبًا.",
                style: getRegularTextStyle(color: AppColors.neutral800, fontSize: 13),
              ),
              12.vs,
            ],
          ),
        );
      },
    );
  }
}
