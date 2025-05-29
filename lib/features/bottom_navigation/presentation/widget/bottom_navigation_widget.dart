//
// import '../../../../exports.dart';
// import '../../data/models/title_icon_model.dart';
// import '../managers/bottom_nav_operation_cubit.dart';
//
// class BottomNavigationWidget extends StatelessWidget {
//   BottomNavigationWidget({super.key, required this.navBar});
//   final List<TitleIconModel> navBar;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 76.h,
//       decoration: BoxDecoration(
//         color: AppColors.white.withOpacity(0.7), // Container background color
//         borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)), // Example: Rounded corners
//         boxShadow: [
//           BoxShadow(
//             color: AppColors.black.withOpacity(0.08), // Convert hex color to Color
//             offset: Offset(0, 0),
//             blurRadius: 24,
//             spreadRadius: 0,
//           ),
//         ],
//       ),
//       padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w) ,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: List.generate(
//           navBar.length,
//           (index) => GestureDetector(
//             behavior: HitTestBehavior.translucent,
//             onTap: () {
//               context.read<BottomNavOperationCubit>().changIndex(index);
//             },
//             child: Padding(
//               padding:EdgeInsets.only(top: 5.h) ,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   SizedBox(
//                     height: 24,
//                     width: 24,
//                     child: CustomSVGImage(
//                       asset: navBar[index].icon,
//                       fit: BoxFit.fill,
//                       matchTextDirection: false,
//                       color: context.read<BottomNavOperationCubit>().index == index ? AppColors.primaryColor : AppColors.grey,
//                     ),
//                   ),
//                   5.vs,
//                   Text(
//                       navBar[index].name.trans,
//                     style: getBoldTextStyle(fontSize: 14,color: context.read<BottomNavOperationCubit>().index == index ? AppColors.primaryColor : AppColors.grey),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
