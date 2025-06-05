


import 'package:new_ilearn/config/widgets/status_message.dart';
import 'package:new_ilearn/core/widgets/imageUser_widget.dart';
import 'package:new_ilearn/core/widgets/openContainerAnimation_widget.dart';
import 'package:new_ilearn/core/widgets/viewAll_widget.dart';
import 'package:new_ilearn/features/home/presentation/managers/groups_chat_cubit.dart';

import '../../../../exports.dart';
import '../../data/models/groups_chat_model.dart';

class ActiveGroups extends StatelessWidget {
  const ActiveGroups({super.key, required this.active, required this.activeGroups});
 final bool active ;
 final GroupsDataChatModel activeGroups;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: active,
      child: Column(
        children: [
          ViewAll(
            title: AppStrings.activeGroups.trans,
            onClick: () {
              // BlocProvider.of<NavigationBetweenPagesBloc>(context)
              //     .add(AddIndexPages(indexPage: 2));
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.14.h,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding:
              const EdgeInsetsDirectional.symmetric(horizontal: 16),
              itemCount: activeGroups.items!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                    width: MediaQuery.of(context).size.height * 0.08.w,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {},
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height *
                                0.07.h,
                            child: Stack(
                              children: [
                                // CircleAvatar(
                                //
                                // radius: 35,
                                //     backgroundImage:   Image.asset(AppAssets.person).image),
                                OpenContainerAnimation(

                                  closedWidget: ImageUser(
                                    image: "${EndPoints.image}${activeGroups.items?[index].fullImageUrl}" ??'',
                                    height: 65.h,
                                    width: 65.w,
                                    margin: 9,
                                  ),

                                  // ChatScreen(
                                  //   chatBackgroundColor:activeGroups[index]
                                  //       .backgroundColor,
                                  //   typeChat: 'group',
                                  //   chatGroup:
                                  //   activeGroups[index],
                                  // ),
                                ),
                                Align(
                                  alignment:
                                  AlignmentDirectional.bottomStart,
                                  child: Container(
                                    height: 16,
                                    width: 16,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        border: Border.all(
                                            color: Colors.white,
                                            width: 2),
                                        shape: BoxShape.circle),
                                  ),
                                )
                              ],
                            ),
                          ),
                          TextWidget(
                            text: activeGroups.items![index].name.toString(),
                            fontSizeText: 13,
                            maxLine: 1,
                            textOverflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
class GroupsBlocBuilder extends StatelessWidget {
  const GroupsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => GroupsChatCubit(useCase: ServiceLocator.instance.getIt())..getGroups(),
  child: BlocBuilder<GroupsChatCubit, CubitStates>(
  builder: (context, state) {

    return state is LoadedState ? ActiveGroups(activeGroups:state.data,active: state.data.items!.isNotEmpty?true:false,):state is FailedState? Center(child: StatusMessage(text: state.message, padding: EdgeInsetsDirectional.only(bottom: 60.h), iconData: Icons.error)):const Center(child: CircularProgressIndicator(),);
  },
),
);
  }
}
