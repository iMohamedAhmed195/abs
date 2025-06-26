import 'package:abs/features/dashboard/presentation/widgets/date_selector_section.dart';
import 'package:abs/features/dashboard/presentation/widgets/commision_bar_section.dart';
import 'package:abs/features/dashboard/presentation/widgets/date_section.dart';
import 'package:abs/features/dashboard/presentation/widgets/kpi_grid_view_section.dart';
import 'package:abs/features/dashboard/presentation/widgets/line_chart_section.dart';
import 'package:abs/features/dashboard/presentation/widgets/shipment_and_search_section.dart';
import '../../../../exports.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Align(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            16.vs,
            DateSection(),
            17.vs,
            DateSelectorSection(startDate: DateTime(2025, 6, 16)),
            15.vs,
            Divider(color: AppColors.lightGrey, height: 0, thickness: 1),
            24.vs,
            KpiGridViewSection(),
            24.vs,
            CommissionBarSection(),
            24.vs,
            LineChartSection(),
            24.vs,
            ShipmentAndSearchSection(),
            20.vs,
          ],
        ),
      ),
    );
  }
}
