
import 'package:shimmer/shimmer.dart';

import '../../exports.dart';

class ShimmerVerticalGroups extends StatelessWidget {
  const ShimmerVerticalGroups({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(

      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 8,
        itemBuilder: (context, index) {
          return ListTile(
            minLeadingWidth: 0,
            leading: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
            ),
            title: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              width: double.infinity,
              height: 50.h,
            ),
          );
        },
      ),
    );
  }
}
