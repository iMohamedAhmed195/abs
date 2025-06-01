import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:new_ilearn/core/widgets/imageUser_widget.dart' show ImageUser;
import 'package:new_ilearn/features/bottom_navigation/presentation/widget/custom_appbar_widget.dart';

import '../../../exports.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

int _countPage = 1;
int _indexPageList = 1;
bool _loading = false;
late ScrollController _scrollController;

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _countPage = 1;
    _indexPageList = 1;
    _loading = false;
    _scrollController = ScrollController();
    // pagination(
    //   scrollController: _scrollController,
    //   indexPageList: _indexPageList,
    //   countPages: _countPage,
    //   pagination: () {
    //     if (_indexPageList != _countPage) {
    //       setState(() {
    //         _loading = true;
    //         _indexPageList++;
    //       });
    //       BlocProvider.of<NotificationBloc>(context)
    //           .add(GetNotificationList(_indexPageList));
    //     }
    //   },
    // );
    // BlocProvider.of<NotificationBloc>(context).add(GetNotificationList(1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.notification.trans),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
                  child: ListTile(
                    leading:
                    false
                        // ? ImageUser(image: state.listNotification[index].fromUser!.fullImageUrl ?? '')
                        ? ImageUser(image: '')
                        : ImageUser(imageAssets: AppAssets.person, image: AppAssets.person),
                    title: TextWidget(
                      text: "dghdfgsdfgsdfg",
                      fontSizeText: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(text: "dghdfgsdfgssadasdasddfg", fontSizeText: 12),
                        TextWidget(
                          text:"asdasdasd",
                          fontSizeText: 12,
                          colorText: Colors.black26,
                        ),
                      ],
                    ),
                    trailing: Visibility(
                      visible:true,
                      // visibleButtonAccept(
                      //   group: state.listNotification[index].group,
                      //   acceptRequest: state.listNotification[index].acceptRequest,
                      //   type: state.listNotification[index].type,
                      // ),
                      child: ButtonWidget(
                        colorButton: AppColors.primaryColor,
                        width: 60,
                        height: 32,
                        title: AppStrings.acceptance.trans,
                        onClick:
                            () {
                                  // _acceptJoin(
                                  //   state.listNotification[index].type,
                                  //   groupId: state.listNotification[index].group!.id,
                                  //   idUser: state.listNotification[index].fromUser?.id,
                                  // )

                            }
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 10.h),
            Visibility(
              visible: _loading,
              child: LoadingAnimationWidget.discreteCircle(color: AppColors.primaryColor, size: 30),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      )
    );
  }
  //
  // _acceptJoin(String type, {String? idUser, String? groupId}) {
  //   switch (type) {
  //     case 'JoinGroupRequest':
  //       if (idUser != null) {
  //         BlocProvider.of<SingleGroupBloc>(context).add(AcceptUseJoinEvent(idUser));
  //       }
  //       break;
  //     case 'UserAddedTOGroupChat':
  //       if (groupId != null) {
  //         BlocProvider.of<SingleGroupBloc>(context).add(AcceptJoinGroupEvent(groupId));
  //       }
  //       break;
  //     default:
  //       showSnackBar(context: context, message: 'لا يمكن تنفيذ الطلب', visibleMessage: false);
  //   }
  // }
  //
  // bool visibleButtonAccept({required String type, required bool acceptRequest, required GroupDetails? group}) {
  //   if ((type == TypeNotification.JoinGroupRequest.name || type == TypeNotification.UserAddedTOGroupChat.name) &&
  //       acceptRequest == false &&
  //       (group != null && (group.acceptJoin != null && group.acceptJoin == false))) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}
