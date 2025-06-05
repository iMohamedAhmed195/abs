import 'package:new_ilearn/core/widgets/statistics_slide.dart';
import 'package:new_ilearn/features/bottom_navigation/presentation/managers/bottom_nav_operation_cubit.dart';
import 'package:new_ilearn/features/home/presentation/widgets/appBar_widget.dart';
import 'package:new_ilearn/features/home/presentation/widgets/folders_and_books_section.dart';
import 'package:new_ilearn/features/home/presentation/widgets/groups_widget.dart';

import '../../../../exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen>  {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: context.read<BottomNavOperationCubit>().index != 2,
          child: Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                AppAssets.bubbleDashBordLight,
              )),
        ),
        Visibility(
          visible: context.read<BottomNavOperationCubit>().index != 2,
          child: Align(
              alignment: Alignment.topRight,
              child: Image.asset(AppAssets.bubbleDashBord)),
        ),

        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
                bottom: MediaQuery.of(context).size.height * 0.10.h),
            child:   Column(
              children: [
                Visibility(
                  visible: context.read<BottomNavOperationCubit>().index != 4 &&
                      context.read<BottomNavOperationCubit>().index != 2,
                  child: AppBarDashBord(
                    image: AppAssets.person,
                    point: 10,
                  ),
                ),
                StatisticsSlide(),
                GroupsBlocBuilder(),
                FoldersAndBooksSection()

              ],
            ),
          ),
        ),
      ],
    );
  }
}

