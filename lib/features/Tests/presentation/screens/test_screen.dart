// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:lottie/lottie.dart';
// import 'package:new_ilearn/core/widgets/circleStatistics.dart';
// import 'package:new_ilearn/core/widgets/dialog.dart';
// import 'package:new_ilearn/core/widgets/textFiled_widget.dart';
// import 'package:new_ilearn/features/bottom_navigation/presentation/widget/custom_appbar_widget.dart';
// import 'package:percent_indicator/flutter_percent_indicator.dart';
//
// import '../../../../exports.dart';
//
//
// class TestScreen extends StatefulWidget {
//   const TestScreen(
//       {super.key,
//       this.reviewTest = false,
//       this.book,
//       this.quizLevel = 'easy',
//       this.quizType = 'MultiChoic'});
//
//   final bool reviewTest;
//
//   final String quizLevel;
//   final String quizType;
//
//   @override
//   State<TestScreen> createState() => _TestScreenState();
// }
//
// late String radioGroup;
// late PageController _pageController;
// late TextEditingController _answer;
// int _correctAnswers = 0;
// int _wrongAnswers = 0;
// late int _pageCount;
//
//
// class _TestScreenState extends State<TestScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     _answer = TextEditingController();
//     _pageCount = 0;
//     radioGroup = '';
//     _pageController = PageController(initialPage: _pageCount);
//   }
//
//   @override
//   void dispose() {
//     _answer.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//           onClick: () {
//             // _showExitDialog();
//             dialog(
//               context: context,
//               title: AppStrings.exitConfirmation,
//               subTitle: AppStrings.areYouSureYouWantToExit,
//               titleButtonAccess: AppStrings.yes,
//               titleButtonReject: AppStrings.no,
//               onClickAccessButton: () {
//                 // if (ifWritingQuestion() == false) {
//                 //   determineCorrectnessAnswer(_questionsList);
//                 // } else {
//                   // BlocProvider.of<CreateTestsBloc>(context)
//                   //     .add(CorrectAnswerWritingEvent(
//                   //         jsonEncode(_questionsList
//                   //             .map(
//                   //               (e) => e.toJson(),
//                   //             )
//                   //             .toList()),
//                   //         widget.book!.first.localPath!));
//
//
//                 Navigator.pop(context);
//                 loadingSystem(context);
//               },
//               onClickRejectButton: () {
//                 Navigator.pop(context);
//               },
//             );
//           },
//           title: widget.reviewTest ? AppStrings.testReview : 'الاختبار'),
//       body: SingleChildScrollView(
//         physics: const NeverScrollableScrollPhysics(),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             LinearPercentIndicator(
//               trailing: TextWidget(
//                   text: '${_pageCount + 1}/10', fontSizeText: 14),
//               progressColor: AppColors.primaryColor,
//               percent: percent(),
//               barRadius: const Radius.circular(3),
//               lineHeight: 8,
//               isRTL: true,
//               curve: Curves.easeIn,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.70.h,
//               child: PageView.builder(
//                 onPageChanged: (value) {
//                   if (value > _pageCount) {
//                     // محاولة الانتقال للصفحة التالية
//                     if (state.test.questions[_pageCount]
//                         .userAnswerIndex !=
//                         null ||
//                         state.test.questions[_pageCount]
//                             .textUserAnswer.text.isNotEmpty) {
//                       // إذا كانت هناك إجابة، يتم السماح بالانتقال
//                       setState(() {
//                         _pageCount = value;
//                       });
//                       // if (!widget.reviewTest) {
//                       //   setState(() {
//                       //     state.test.questions[_pageCount]
//                       //             .userAnswer =
//                       //         state.test.questions[_pageCount]
//                       //             .textUserAnswer.text;
//                       //   });
//                       // }
//                     } else {
//                       // إذا لم يكن هناك إجابة، إظهار رسالة
//                       _pageController.animateToPage(_pageCount,
//                           duration:
//                           const Duration(milliseconds: 200),
//                           curve: Curves.easeIn);
//                       showSnackBar(
//
//                         message:
//                         '${AppStrings.answerQuestion}\n${_pageCount + 1}',
//                         alertType: AlertTypes.error,
//                       );
//                     }
//                   } else {
//                     // السماح بالرجوع إلى الصفحة السابقة دون شرط الإجابة
//                     setState(() {
//                       _pageCount = value;
//                     });
//                   }
//                 },
//                 controller: _pageController,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: state.test.questions.length,
//                 itemBuilder: (context, index) {
//                   return SingleChildScrollView(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         const SizedBox(height: 24),
//                         Container(
//                           height:
//                           MediaQuery.of(context).size.height *
//                               0.22.h,
//                           width: double.infinity,
//                           color: Colors.transparent,
//                           child: Stack(
//                             children: [
//                               Align(
//                                 alignment: AlignmentDirectional
//                                     .bottomCenter,
//                                 child: InkWell(
//                                   highlightColor:
//                                   Colors.transparent,
//                                   splashColor: Colors.transparent,
//                                   onDoubleTap: () {
//                                     // setState(() {
//                                     //   state.test.questions[index]
//                                     //       .isBookmarked = state
//                                     //       .test
//                                     //       .questions[
//                                     //   index]
//                                     //       .isBookmarked ==
//                                     //       true
//                                     //       ? false
//                                     //       : true;
//                                     // });
//                                     // if (state
//                                     //     .test
//                                     //     .questions[index]
//                                     //     .id !=
//                                     //     null) {
//                                     //   ChatBotController()
//                                     //       .bookMarkMessage(
//                                     //       idMessage: '',
//                                     //       isBokMark: true,
//                                     //       isMessage: false,
//                                     //       questionId: state
//                                     //           .test
//                                     //           .questions[
//                                     //       index]
//                                     //           .id);
//                                     // }
//                                   },
//                                   child: Container(
//                                     height: MediaQuery.of(context)
//                                         .size
//                                         .height *
//                                         0.18.h,
//                                     decoration: BoxDecoration(
//                                       color: AppColors.primaryColorLight,
//                                       borderRadius:
//                                       BorderRadius.circular(
//                                           8),
//                                     ),
//                                     padding:
//                                     const EdgeInsetsDirectional
//                                         .symmetric(
//                                         horizontal: 16,
//                                         vertical: 10),
//                                     child: Center(
//                                       child: Padding(
//                                         padding:
//                                         const EdgeInsetsDirectional
//                                             .only(top: 8),
//                                         child: TextWidget(
//                                           textAlign:
//                                           TextAlign.center,
//                                           maxLine: 4,
//                                           text: state
//                                               .test
//                                               .questions[
//                                           _pageCount]
//                                               .question,
//                                           textOverflow:
//                                           TextOverflow
//                                               .ellipsis,
//                                           fontSizeText: 12,
//                                           fontWeight:
//                                           FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Align(
//                                 alignment: AlignmentDirectional
//                                     .topCenter,
//                                 child: Container(
//                                   height: 70.h,
//                                   width: 70.w,
//                                   decoration: BoxDecoration(
//                                       color: Theme.of(context)
//                                           .secondaryHeaderColor,
//                                       shape: BoxShape.circle),
//                                   child: Center(
//                                     child: CircleStatistics(
//                                       animation: false,
//                                       lineWidth: 5,
//                                       paddingEnd: 0,
//                                       title: '5',
//                                       centerWidget: TextWidget(
//                                         text: '${_pageCount + 1}',
//                                         fontSizeText: 18,
//                                         fontWeight:
//                                         FontWeight.bold,
//                                       ),
//                                       percent: percent(),
//                                       radius: 30.r,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Visibility(
//                                   visible: true,
//                                   child: Padding(
//                                     padding: EdgeInsetsDirectional
//                                         .only(
//                                         top: MediaQuery.of(
//                                             context)
//                                             .size
//                                             .height *
//                                             0.04.h),
//                                     child: Align(
//                                       alignment:
//                                       AlignmentDirectional
//                                           .topEnd,
//                                       child: Lottie.asset(
//                                           AppAssets
//                                               .bookMarkAnimation,
//                                           height: 45.h,
//                                           width: 45.w,
//                                           repeat: false),
//                                     ),
//                                   )),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 24),
//                         state.test.questions[_pageCount]
//                             .answers !=
//                             null &&
//                             state.test.questions[_pageCount]
//                                 .answers!.isNotEmpty
//                             ? ListView.builder(
//                           itemCount: state
//                               .test
//                               .questions[_pageCount]
//                               .answers!
//                               .length,
//                           shrinkWrap: true,
//                           physics:
//                           const NeverScrollableScrollPhysics(),
//                           itemBuilder: (context, index) =>
//                               Padding(
//                                 padding:
//                                 const EdgeInsetsDirectional
//                                     .only(bottom: 16),
//                                 child: AnswerWidget(
//                                   onTap: () {
//                                     setState(() {
//                                       radioGroup =
//                                           index.toString();
//                                       state
//                                           .test
//                                           .questions[_pageCount]
//                                           .userAnswerIndex = index;
//                                       state
//                                           .test
//                                           .questions[_pageCount]
//                                           .userAnswer =
//                                       state
//                                           .test
//                                           .questions[
//                                       _pageCount]
//                                           .answers![index];
//                                     });
//                                   },
//                                   isReview: widget.reviewTest,
//                                   typeAnswer: index ==
//                                       state
//                                           .test
//                                           .questions[
//                                       _pageCount]
//                                           .correctAnswerIndex
//                                       ? true
//                                       : false,
//                                   isAnswer: widget.reviewTest
//                                       ? (index ==
//                                       state
//                                           .test
//                                           .questions[
//                                       _pageCount]
//                                           .correctAnswerIndex
//                                       ? true
//                                       : index ==
//                                       state
//                                           .test
//                                           .questions[
//                                       _pageCount]
//                                           .userAnswerIndex
//                                       ? false
//                                       : null)
//                                       : null,
//                                   onChange: (value) {
//                                     if (value != null) {
//                                       setState(() {
//                                         radioGroup = value;
//                                         state
//                                             .test
//                                             .questions[
//                                         _pageCount]
//                                             .userAnswerIndex =
//                                             int.parse(value);
//                                         state
//                                             .test
//                                             .questions[
//                                         _pageCount]
//                                             .userAnswer =
//                                         state
//                                             .test
//                                             .questions[
//                                         _pageCount]
//                                             .answers![index];
//                                       });
//                                     }
//                                   },
//                                   radioGroup: state
//                                       .test
//                                       .questions[_pageCount]
//                                       .userAnswerIndex
//                                       .toString(),
//                                   titleAnswer: state
//                                       .test
//                                       .questions[_pageCount]
//                                       .answers![index]
//                                       .toString(),
//                                   value: index.toString(),
//                                 ),
//                               ),
//                         )
//                             : Padding(
//                           padding:
//                           EdgeInsetsDirectional.only(
//                               bottom: 24.h),
//                           child: Column(
//                             children: [
//                               TextFiledWidget(
//                                 disabledBorderColor:
//                                 Colors.green,
//                                 enabled: widget.reviewTest
//                                     ? false
//                                     : true,
//                                 error: widget.reviewTest &&
//                                     (state
//                                         .test
//                                         .questions[
//                                     _pageCount]
//                                         .userAnswerIndex !=
//                                         state
//                                             .test
//                                             .questions[
//                                         _pageCount]
//                                             .correctAnswerIndex)
//                                     ? ''
//                                     : null,
//                                 onSubmitted: (p0) async {
//                                   if (state
//                                       .test
//                                       .questions[
//                                   _pageCount]
//                                       .userAnswerIndex !=
//                                       null ||
//                                       state
//                                           .test
//                                           .questions[
//                                       _pageCount]
//                                           .textUserAnswer
//                                           .text
//                                           .isNotEmpty) {
//                                     if (_pageCount < 9) {
//                                       setState(() {
//                                         _pageCount++;
//                                         _pageController.animateToPage(
//                                             _pageCount,
//                                             duration:
//                                             const Duration(
//                                                 milliseconds:
//                                                 200),
//                                             curve: Curves
//                                                 .bounceIn);
//                                         //_answer.text =  state.test.questions[_pageCount].textUserAnswer;
//                                       });
//                                     }
//                                   } else {
//                                     showSnackBar(
//                                         context: context,
//                                         message:
//                                         '${AppStrings.answerQuestion}\n${_pageCount + 1}',
//                                         visibleMessage:
//                                         false);
//                                   }
//                                 },
//                                 textInputAction:
//                                 _pageCount < 9
//                                     ? TextInputAction
//                                     .next
//                                     : TextInputAction
//                                     .done,
//                                 onChange: (val) {
//                                   setState(() {
//                                     state
//                                         .test
//                                         .questions[
//                                     _pageCount]
//                                         .userAnswer = val;
//                                   });
//                                 },
//                                 maxLine: 4,
//                                 type: TextInputType.text,
//                                 textEditingController: state
//                                     .test
//                                     .questions[_pageCount]
//                                     .textUserAnswer,
//                                 hintText:
//                                 'اكتب الاجابة هنا(سيتم تصحيح الاجابة تقريبيا)',
//                               ),
//                               const SizedBox(
//                                 height: 5,
//                               ),
//                               Visibility(
//                                 visible: widget
//                                     .reviewTest &&
//                                     (state
//                                         .test
//                                         .questions[
//                                     _pageCount]
//                                         .answers!
//                                         .isEmpty ||
//                                         state
//                                             .test
//                                             .questions[
//                                         _pageCount]
//                                             .answers ==
//                                             null) &&
//                                     (state
//                                         .test
//                                         .questions[
//                                     index]
//                                         .userAnswerIndex !=
//                                         state
//                                             .test
//                                             .questions[
//                                         index]
//                                             .correctAnswerIndex),
//                                 child: Container(
//                                   width: double.infinity,
//                                   padding:
//                                   const EdgeInsetsDirectional
//                                       .symmetric(
//                                       horizontal: 10,
//                                       vertical: 8),
//                                   decoration: BoxDecoration(
//                                       borderRadius:
//                                       BorderRadius
//                                           .circular(8),
//                                       color: primaryColor
//                                           .withOpacity(
//                                           0.10),
//                                       border: Border.all(
//                                           color:
//                                           primaryColor)),
//                                   child: Row(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment
//                                         .start,
//                                     mainAxisAlignment:
//                                     MainAxisAlignment
//                                         .start,
//                                     children: [
//                                       SvgPicture.asset(
//                                         AppAssets
//                                             .robotIconIlearn,
//                                         height: 20,
//                                         width: 20,
//                                       ),
//                                       Expanded(
//                                         child: TextWidget(
//                                             colorText:
//                                             primaryColor,
//                                             textAlign:
//                                             TextAlign
//                                                 .center,
//                                             text: state
//                                                 .test
//                                                 .questions[
//                                             _pageCount]
//                                                 .aiAnswer ??
//                                                 '',
//                                             fontSizeText:
//                                             12),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//             ButtonWidget(
//               title: _pageCount < 9
//                   ? AppStrings.next
//                   : AppStrings.testResult,
//               onClick: () async {
//                 if (state.test.questions[_pageCount]
//                     .userAnswerIndex !=
//                     null ||
//                     state.test.questions[_pageCount]
//                         .textUserAnswer.text.isNotEmpty) {
//                   // if (!widget.reviewTest) {
//                   //   setState(() {
//                   //     state.test.questions[_pageCount]
//                   //             .userAnswer =
//                   //         state.test.questions[_pageCount]
//                   //             .textUserAnswer.text;
//                   //     log('statesssss=>${state.test.questions[_pageCount].userAnswer}');
//                   //   });
//                   // }
//                   if (_pageCount < 9) {
//                     setState(() {
//                       _pageCount++;
//                       _pageController.animateToPage(_pageCount,
//                           duration:
//                           const Duration(milliseconds: 200),
//                           curve: Curves.bounceIn);
//                       //_answer.text =  state.test.questions[_pageCount].textUserAnswer;
//                     });
//                   } else {
//                     if (widget.reviewTest) {
//                       // Navigator.pushReplacement(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //       builder: (context) => SingleTestPage(
//                       //           testId: state.test.id,
//                       //           correctAnswers: _correctAnswers,
//                       //           wrongAnswers: _wrongAnswers,
//                       //           book: widget.book,
//                       //           titleTest: widget.book != null
//                       //               ? widget.book!.first.name
//                       //               : 'الاختبار'),
//                       //     ));
//                       Navigator.pop(context);
//                     } else {
//                       await dialog(
//                         context: context,
//                         title: AppStrings.endOfTest,
//                         subTitle: AppStrings.endOfTestDescription,
//                         titleButtonAccess: AppStrings.adoption,
//                         titleButtonReject: AppStrings.review,
//                         onClickAccessButton: () async {
//                           // log(state.test.questions
//                           //     .map(
//                           //       (e) => e.userAnswer,
//                           //     )
//                           //     .toString());
//                           if (ifWritingQuestion() == false) {
//                             determineCorrectnessAnswer(
//                                 _questionsList);
//                           } else {
//                             BlocProvider.of<CreateTestsBloc>(
//                                 context)
//                                 .add(CorrectAnswerWritingEvent(
//                                 jsonEncode(
//                                     state.test.questions
//                                         .map(
//                                           (e) => e.toJson(),
//                                     )
//                                         .toList()),
//                                 widget
//                                     .book!.first.localPath!));
//                           }
//
//                           Navigator.pop(context);
//                           loadingSystem(context);
//                         },
//                         onClickRejectButton: () {
//                           Navigator.pop(context);
//                           setState(() {
//                             _pageCount = 0;
//                             _correctAnswers = 0;
//                             _wrongAnswers = 0;
//                             _pageController.animateToPage(0,
//                                 duration:
//                                 const Duration(minutes: 450),
//                                 curve: Curves.bounceIn);
//                           });
//                         },
//                       );
//                     }
//                   }
//                 } else {
//                   showSnackBar(
//                       context: context,
//                       message:
//                       '${AppStrings.answerQuestion}\n${_pageCount + 1}',
//                       visibleMessage: false);
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   determineCorrectnessAnswer(List<Questions> listQuestions) {
//     int iaDone = 0;
//     setState(() {
//       _correctAnswers = 0;
//       _wrongAnswers = 0;
//     });
//     for (int i = 0; i < listQuestions.length; i++) {
//       if (listQuestions[i].userAnswerIndex != null) {
//         iaDone = 0;
//       } else {
//         iaDone = 1;
//       }
//
//       if (listQuestions[i].correctAnswerIndex ==
//           listQuestions[i].userAnswerIndex) {
//         setState(() {
//           _correctAnswers++;
//         });
//       } else {
//         setState(() {
//           _wrongAnswers++;
//         });
//       }
//     }
//     BlocProvider.of<TestBloc>(context).add(AddTestEvent(
//         widget.book!.first.name,
//         _correctAnswers,
//         iaDone,
//         widget.quizType,
//         widget.quizLevel,
//         widget.book!
//             .map(
//               (e) => e.id,
//             )
//             .toList(),
//         listQuestions));
//     log(listQuestions
//         .map(
//           (e) => e.id,
//         )
//         .toString());
//   }
//
//   double percent() {
//     return (_pageCount + 1) / (10);
//   }
//
//   void _showExitDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(AppStrings.exitConfirmation),
//           content: Text(AppStrings.areYouSureYouWantToExit),
//           actions: <Widget>[
//             TextButton(
//               child: Text(AppStrings.no),
//               onPressed: () {
//                 Navigator.of(context).pop(); // إغلاق الديالوج
//               },
//             ),
//             TextButton(
//               child: Text(AppStrings.yes),
//               onPressed: () {
//                 Navigator.of(context).pop(); // إغلاق الديالوج
//                 Navigator.of(context).pop(); // الخروج من الصفحة
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   bool ifWritingQuestion() {
//     bool isWriting = false;
//     for (int i = 0; i < _questionsList.length; i++) {
//       if (_questionsList[i].type == QuizQuestionsType.Writing.name) {
//         log('message');
//         isWriting = true;
//         break;
//       }
//     }
//     return isWriting;
//   }
// }
