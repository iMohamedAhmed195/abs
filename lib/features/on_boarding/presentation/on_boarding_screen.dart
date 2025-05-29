import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_ilearn/config/widgets/custom_background.dart';
import 'package:new_ilearn/features/on_boarding/presentation/widget/circle_indecator_pageView.dart';
import 'package:new_ilearn/features/on_boarding/presentation/widget/details_wellcome.dart';

import '../../../exports.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}
late PageController _pageViewController;
int _currentPage = 0;

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    super.initState();
    _pageViewController = PageController(initialPage: _currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      showSafeArea: false,
      child: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3.h,
            left: 0,
            child: Image.asset(AppAssets.bubbleWelcomeScreenLight),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(AppAssets.bubbleWelcomeScreen),
          ),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              Expanded(
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: MediaQuery.of(context).size.height * 0.05), // تم تقليل الـ margin
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 37,
                        offset: Offset(0, 10),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: PageView(
                    onPageChanged: (value) => setState(() {
                      _currentPage = value;
                    }),
                    controller: _pageViewController,
                    scrollDirection: Axis.horizontal,
                    children: [
                      DetailsWelcome(
                        subTitle:AppStrings.uploadYourBooksTitleDetails,
                        title:AppStrings.uploadYourBooks,
                        image: AppAssets.uploadBook,
                      ),
                      DetailsWelcome(
                        subTitle:AppStrings.createQuizTitleDetails,
                        title:AppStrings.createQuiz,
                        image: AppAssets.createQuiz,
                      ),
                      DetailsWelcome(
                        subTitle:AppStrings
                            .joinOurCommunityTitleDetails,
                        title:AppStrings.joinOurCommunity,
                        image: AppAssets.joinOurCommunity,
                      ),
                      DetailsWelcome(
                        showButton: _currentPage == 3,
                        subTitle:AppStrings
                            .uploadQuestionsTitleDetails,
                        title:AppStrings.uploadQuestions,
                        image: AppAssets.uploadQuestions,
                      ),
                    ],
                  ),
                ),
              ),
              // مؤشرات الصفحة
              Padding(
                padding:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.1), // تم تقليل الـ padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return CircleIndecatorPageview(
                      colorCircle: _currentPage == index
                          ? AppColors.primaryColor
                          : AppColors.primaryColorLight,
                    );
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}