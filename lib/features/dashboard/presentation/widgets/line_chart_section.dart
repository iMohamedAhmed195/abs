import 'package:abs/exports.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartSection extends StatefulWidget {
  const LineChartSection({super.key});

  @override
  State<LineChartSection> createState() => _LineChartSectionState();
}

class _LineChartSectionState extends State<LineChartSection> {
  List<Color> gradientColors = [
    AppColors.primaryColor,
    AppColors.primaryColor,
  ];
  bool showAvg = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('مخطط تسليمك للشحنات', style: getMediumTextStyle(fontSize: 18, color: AppColors.neutral800)),
        10.vs,
        Divider(color: AppColors.neutralDivider, height: 0, thickness: 0.84),
        35.vs,
        Stack(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.999,
              child: LineChart(
                showAvg ? avgData() : mainData(),
              ),
            ),
            // SizedBox(
            //   width: 60,
            //   height: 34,
            //   child: TextButton(
            //     onPressed: () {
            //       setState(() {
            //         showAvg = !showAvg;
            //       });
            //     },
            //     child: Text(
            //       'avg',
            //       style: TextStyle(
            //         fontSize: 12,
            //         color: showAvg
            //             ? Colors.black.withValues(alpha: 0.5)
            //             : Colors.black,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    int day = value.toInt();

    String label = (day >= 1 && day <= 31) ? day.toString().padLeft(2, '0') + '/7' : '';
    return SideTitleWidget(
      axisSide: AxisSide.bottom,
      child: Text(
        label,
        style: getRegularTextStyle(fontSize: 8.35, color: AppColors.neutral700),
      ),
    );
  }
  Widget leftTitleWidgets(double value, TitleMeta meta) {
    int intValue = value.toInt();

    // Only show labels from 0 to 6
    if (intValue < 0 || intValue > 6) return Container();

    String text = '${intValue}';

    return Text(
      text,
      style: getBoldTextStyle(color: AppColors.baseBlack, fontSize: 12),
      textAlign: TextAlign.left,
    );
  }
  LineChartData mainData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        handleBuiltInTouches: true,
        getTouchedSpotIndicator: (barData, spotIndexes) {
          return spotIndexes.map((index) {
            return TouchedSpotIndicatorData(
              FlLine(
                color: AppColors.primaryColor,
              ),
              FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 5,
                    color: AppColors.primaryColor, // fill color of the dot
                    strokeWidth: 2,
                    strokeColor: Colors.white, // border color
                  );
                },
              ),
            );
          }).toList();
        },
        touchTooltipData: LineTouchTooltipData(
          tooltipPadding: const EdgeInsets.all(8),
          tooltipBorder: BorderSide(
            color: AppColors.darkPurple,
            width: 1,
          ),
          tooltipBgColor: AppColors.white.withOpacity(0.7),
          tooltipMargin: 12,
          fitInsideHorizontally: true,
          fitInsideVertically: true,
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((spot) {
              final int day = (spot.x + 1).toInt();
              return LineTooltipItem(
                '\u200F${spot.y.toInt()} شحنات 📦\n\u200F مايو 2025',
                TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
                textAlign: TextAlign.right,
              );
            }).toList();
          },
        ),
      ),
      gridData: FlGridData(
        show: true,
        horizontalInterval: 1.05,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: AppColors.neutral300,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: AppColors.transparent,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false, reservedSize: 0),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 20,
            interval:1.5,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 20.w,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.symmetric(horizontal: BorderSide.none, vertical: BorderSide.none),
      ),
      minX: 0,
      maxX: 15,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0.0, 4),
            FlSpot(0.93, 6.0),
            FlSpot(1.86, 5.33),
            FlSpot(2.79, 6.0),
            FlSpot(3.72, 6.0),
            FlSpot(4.66, 6.0),
            FlSpot(5.59, 5.33),
            FlSpot(6.52, 4.0),
            FlSpot(7.45, 6.0),
            FlSpot(8.38, 5.33),
            FlSpot(9.31, 5.33),
            FlSpot(10.24, 5.33),
            FlSpot(11.17, 4.0),
            FlSpot(12.10, 6.0),
            FlSpot(13.03, 5.33),
            FlSpot(13.97, 5.33),
            FlSpot(14.90, 4.0),
            FlSpot(15.83, 5.33),
            FlSpot(16.76, 6.0),
            FlSpot(17.69, 6.0),
            FlSpot(18.62, 5.33),
            FlSpot(19.55, 6.0),
            FlSpot(20.48, 5.33),
            FlSpot(21.41, 6.0),
            FlSpot(22.34, 5.33),
            FlSpot(23.28, 6.0),
            FlSpot(24.21, 5.33),
            FlSpot(25.14, 4.0),
            FlSpot(26.07, 6.0),
            FlSpot(30.0, 5.33),

          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 2.5.w,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors.map((color) => color.withOpacity(0.1)).toList(),
            ),
          ),
        ),
      ],
    );
  }
  LineChartData avgData() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withValues(alpha: 0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withValues(alpha: 0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
