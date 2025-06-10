import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:new_ilearn/core/models/user_model.dart';
import 'package:new_ilearn/core/utils/app_assets.dart';
import 'package:new_ilearn/core/widgets/imageUser_widget.dart';
import 'package:new_ilearn/features/home/data/models/statistics_model.dart';
import 'package:new_ilearn/features/home/presentation/managers/statistics_cubit.dart';
import 'package:new_ilearn/features/profile/presentation/screens/information_page.dart';
import 'package:new_ilearn/features/profile/presentation/screens/statistics_page.dart';
import 'package:new_ilearn/features/profile/presentation/widgets/statisticReport_shimmer.dart';
import '../../../../exports.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, });
   @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isCollapsed = false;
  int selectedTabIndex = 0;
  File? _imageProfile;
  bool _isLoadingImage = false;

  // بيانات ثابتة بدل الباكند
  final String _username = "أحمد سعيد";
  final String _imageUrl = "https://via.placeholder.com/150";

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    setState(() {
      _isCollapsed = _scrollController.offset > 10;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildProfileHeader(),
          const SizedBox(height: 10),
          _buildTabButtons(),
          const SizedBox(height: 30),
          Expanded(
            child: ListView(
              controller: _scrollController,
              children: [
                selectedTabIndex == 0
                    ?   InformationPage( ) // غير مرتبط ببيانات backend
                    : BlocProvider(
  create: (context) => StatisticsCubit(useCase: ServiceLocator.instance.getIt())..getStatistics(),
  child: BlocBuilder<StatisticsCubit, CubitStates >(
  builder: (context, state) {
    return state is LoadedState? StatisticsPage(isScroled: _isCollapsed,statisticsData:state.data):state is LoadingState?const Center(child: StatisticReportShimmer()):state is FailedState?Center(child: Text(state.message)):const SizedBox();
  },
),
),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.08),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: _isCollapsed ? 70.h : 180.h,
          child: Stack(
            children: [
              AnimatedAlign(
                duration: const Duration(milliseconds: 300),
                alignment: _isCollapsed
                    ? Alignment.topLeft
                    : Alignment.topCenter,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _isCollapsed
                      ? _buildProfileRow()
                      : _buildProfileColumn(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabButtons() {
    return Row(
      children: [
        _buildTabButton(0, AppStrings.profile.trans),
        const SizedBox(width: 8),
        _buildTabButton(1, AppStrings.statistics.trans),
      ],
    );
  }

  Widget _buildTabButton(int index, String label) {
    final bool isSelected = selectedTabIndex == index;

    return Expanded(
      child: ElevatedButton(
        onPressed: () => setState(() => selectedTabIndex = index),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          minimumSize: const Size(0, 40),
          backgroundColor: isSelected
              ? AppColors.primaryColorLighterThan
              : AppColors.lightSplashColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: isSelected
                  ? AppColors.primaryColor
                  : Colors.transparent,
            ),
          ),
        ),
        child: TextWidget(
          text: label,
          fontSizeText: 15,
          colorText: isSelected ? AppColors.primaryColor : Colors.black,
        ),
      ),
    );
  }

  Widget _buildProfileImage({required double size}) {
    return InkWell(
      onTap: () {
        // ممكن تضيف showDialog أو BottomSheet هنا للتعديل مستقبلاً
      },
      child: Stack(
        children: [
          ImageUser(
            imageFile: _imageProfile,
            fileImage: _imageProfile != null,
            image: _imageUrl,
            height: size.h,
            width: size.w,
          ),
          if (_isLoadingImage)
            Container(
              padding: const EdgeInsets.all(5),
              height: size.h,
              width: size.w,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 5.w),
                color: Colors.black.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: LoadingAnimationWidget.inkDrop(
                  color: Colors.white,
                  size: size / 3,
                ),
              ),
            ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset(AppAssets.editeIcon, height: 20.h),
          )
        ],
      ),
    );
  }

  Widget _buildProfileColumn() {
    return Column(
      key: const ValueKey('column'),
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildProfileImage(size: 100),
        const SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.only(top: 4.h),
          child: TextWidget(
            text: _username,
            fontSizeText: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileRow() {
    return Row(
      key: const ValueKey('row'),
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildProfileImage(size: 50),
        const SizedBox(width: 10),
        TextWidget(
          text: _username,
          fontSizeText: 16,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
