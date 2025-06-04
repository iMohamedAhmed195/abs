import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
import 'package:lottie/lottie.dart';
import 'package:new_ilearn/core/widgets/circleStatistics.dart';
import 'package:new_ilearn/features/bottom_navigation/presentation/widget/custom_appbar_widget.dart';

import '../../../../exports.dart';

class SingleTestPage extends StatefulWidget {
  const SingleTestPage(
      {super.key,
      required this.titleTest,
      required this.correctAnswers,
      required this.wrongAnswers,
  
      this.testId});

  final String titleTest;
  final int correctAnswers;
  final int wrongAnswers;
 
  final String? testId;

  @override
  State<SingleTestPage> createState() => _SingleTestPageState();
}

 

class _SingleTestPageState extends State<SingleTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.titleTest,
        leading: true,
      ),
      body: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 30),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 4))
                  ],
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleStatistics(
                      title:
                          '${(widget.correctAnswers * 10).toStringAsFixed(0)}%',
                      percent: widget.correctAnswers / 10,
                      color: const Color(0xff00C2F6),
                      radius: 35,
                    ),
                    Column(
                      children: [
                        TextWidget(
                          text:
                              '${AppStrings.correctAnswers} ${widget.correctAnswers}',
                          fontSizeText: 20,
                          colorText: Colors.green,
                        ),
                        TextWidget(
                          text:
                              '${AppStrings.wrongAnswers} ${widget.wrongAnswers}',
                          fontSizeText: 20,
                          colorText: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                // Image.asset(AppAssets.finishTestIcon),
                widget.correctAnswers >= 5
                    ? Stack(
                        children: [
                          Lottie.asset(AppAssets.successTest,
                              repeat: false,
                              height:
                                  MediaQuery.of(context).size.height * 0.3.h,
                              width:
                                  MediaQuery.of(context).size.height * 0.3.w),
                          Lottie.asset(AppAssets.successTestPomp,
                              repeat: false,
                              height:
                                  MediaQuery.of(context).size.height * 0.3.h,
                              width:
                                  MediaQuery.of(context).size.height * 0.3.w),
                        ],
                      )
                    : Lottie.asset(AppAssets.sadEmojiAnimation,
                        height: MediaQuery.of(context).size.height * 0.3.h,
                        width: MediaQuery.of(context).size.height * 0.3.w),

                TextWidget(
                    textAlign: TextAlign.center,
                    text: widget.correctAnswers >= 5
                        ? AppStrings.testSuccess
                        : AppStrings.testFailed,
                    fontSizeText: 20),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2.h,
            ),
            Row(
              children: [
                Expanded(
                  child: ButtonWidget(
                      title: AppStrings.browseArchives,
                      onClick: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => Scaffold(
                        //         appBar: CustomAppBar(title: widget.titleTest),
                        //         body: Padding(
                        //           padding:
                        //               const EdgeInsetsDirectional.symmetric(
                        //                   horizontal: 16),
                        //           child: ArchivesTab(
                        //             bookId: '',
                        //             quizId: widget.testId,
                        //           ),
                        //         ),
                        //       ),
                        //     ));
                      }),
                ),
                const SizedBox(
                  width: 23,
                ),
                Expanded(
                  child: ButtonWidget(
                      colorButton: Colors.white,
                      colorBorder: Colors.black12,
                      colorTitleButton: Colors.black,
                      title: AppStrings.testReview,
                      onClick: () {
                        // if (widget.testId != null) {
                        //   BlocProvider.of<CreateTestsBloc>(context)
                        //       .add(GetSingleTestEvent(widget.testId!));
                        // }
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => TestScreen(
                        //         reviewTest: true,
                        //         book: widget.book,
                        //       ),
                        //     ));
                      }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
