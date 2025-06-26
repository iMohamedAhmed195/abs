import 'package:abs/core/widgets/custom_text_form_field.dart';
import 'package:abs/exports.dart';
import 'package:abs/features/dashboard/presentation/widgets/shipment_card.dart';

class ShipmentAndSearchSection extends StatelessWidget {
  const ShipmentAndSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
              'اخر الشحنات',
              style: getSemiBoldTextStyle(fontSize: 18, color: AppColors.neutral800),
            ),
            Spacer(),
            Text(
              'المزيد',
              style: getBoldTextStyle(fontSize: 14, color: AppColors.primaryColor),
            ),
          ],
        ),
        12.vs,
        CustomTextFormField(
          hintText: "ابحث برقم الشحنة",
          backgroundColor: AppColors.lightGrey,
          keyboardType: TextInputType.text,
          color: AppColors.transparent,
          style: getRegularTextStyle(fontSize: 14, color: AppColors.searchTextColor),
          obscureText: false,
          controller: TextEditingController(),
          isPassword:false,
          prefixSvgIcon: CustomSVGImage(asset: AppAssets.search),
          suffixSvgIcon: CustomSVGImage(asset: AppAssets.qrScan),
        ),
        28.vs,
        ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: 3,
          physics:const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => ShipmentCard(key: UniqueKey(),),
          separatorBuilder: (context, index) => 20.vs,
        ),
      ],
    );
  }
}
