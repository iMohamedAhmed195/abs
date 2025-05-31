


import 'package:new_ilearn/core/widgets/viewAll_widget.dart';

import '../../../../exports.dart';

class ActiveGroups extends StatelessWidget {
  const ActiveGroups({super.key});
 final bool sowViewAll = true;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: sowViewAll,
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
              itemCount: 1,
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
                                CircleAvatar(

                                radius: 35,
                                    backgroundImage:   Image.asset(AppAssets.person).image),
                                // OpenContainerAnimation(
                                //
                                //   closedWidget: ImageUser(
                                //     image: state
                                //         .listActiveGroups[index].imageUrl,
                                //     height: 65.h,
                                //     width: 65.w,
                                //     margin: 9,
                                //   ),
                                //   openWidget: ChatScreen(
                                //     chatBackgroundColor: state
                                //         .listActiveGroups[index]
                                //         .backgroundColor,
                                //     typeChat: 'group',
                                //     chatGroup:
                                //         state.listActiveGroups[index],
                                //   ),
                                // ),
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
                            text: AppStrings.groupName.trans,
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
