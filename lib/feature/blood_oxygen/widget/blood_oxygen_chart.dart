import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/utils/color_utils.dart';
import 'package:medical_app/utils/ui/molecule/text/app_text.dart';
import 'package:medical_app/utils/ui_utils.dart';

class BloodOxygenChartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: UIUtils.width(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: AspectRatio(
          aspectRatio: 1.5,
          child: LineChart(LineChartData(
            gridData: FlGridData(
              show: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: AppColor.blueColor0076BE.withOpacity(0.25),
                  strokeWidth: 1,
                );
              },
              drawHorizontalLine: true,
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: AppColor.blueColor0076BE.withOpacity(0.25),
                  strokeWidth: 1,
                );
              },
              drawVerticalLine: true,
            ),
            lineBarsData: [
              LineChartBarData(
                spots: points.map((point) => FlSpot(point.x, point.y)).toList(),
                isCurved: false,
                color: AppColor.blueColor0076BE,
                barWidth: 2,
                belowBarData: BarAreaData(
                  color: AppColor.blueColor0076BE.withOpacity(0.20),
                  show: true,
                ),
                dotData: FlDotData(
                  show: false,
                ),
                show: true,
              ),
            ],
            borderData: FlBorderData(
              border: Border(
                bottom: BorderSide(
                  color: AppColor.blueColor0076BE.withOpacity(0.25),
                ),
                left: BorderSide(
                  color: AppColor.blueColor0076BE.withOpacity(0.25),
                ),
                top: BorderSide(
                  color: AppColor.blueColor0076BE.withOpacity(0.25),
                ),
              ),
            ),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: _bottomTitles,
              ),
              leftTitles: AxisTitles(
                sideTitles: _leftTitles,
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            lineTouchData: LineTouchData(
                enabled: true,
                touchCallback:
                    (FlTouchEvent event, LineTouchResponse? touchResponse) {
                  // TODO : Utilize touch event here to perform any operation
                },
                touchTooltipData: LineTouchTooltipData(
                  tooltipBgColor: AppColor.blueColor0076BE,
                  tooltipRoundedRadius: 20.0,
                  showOnTopOfTheChartBoxArea: false,
                  fitInsideHorizontally: true,
                  tooltipMargin: 100,
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots.map(
                      (LineBarSpot touchedSpot) {
                        const textStyle = TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: AppColor.white,
                        );
                        return LineTooltipItem(
                          points[touchedSpot.spotIndex].y.toStringAsFixed(0),
                          textStyle,
                        );
                      },
                    ).toList();
                  },
                ),
                getTouchedSpotIndicator:
                    (LineChartBarData barData, List<int> indicators) {
                  return indicators.map(
                    (int index) {
                      final line = FlLine(
                          color: AppColor.blueColor0076BE,
                          strokeWidth: 1,
                          dashArray: [5]);
                      return TouchedSpotIndicatorData(
                        line,
                        FlDotData(show: true),
                      );
                    },
                  ).toList();
                },
                getTouchLineEnd: (_, __) => double.infinity),
          )),
        ),
      ),
    );
  }

  List<Point> points = [
    Point(1.5, 200),
    Point(1, 250),
    Point(3, 300),
    Point(3.5, 450),
    Point(5, 550),
    Point(6, 600),
    Point(7, 700),
  ];

  SideTitles get _bottomTitles => SideTitles(
        reservedSize: 40,
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          int data = 0;
          switch (value.toInt()) {
            case 1:
              text = 'Mon';
              data = 15;
              break;
            case 2:
              text = "Tues";
              data = 16;

              break;
            case 3:
              text = 'Wed';
              data = 17;

              break;
            case 4:
              text = 'Thu';
              data = 18;

              break;
            case 5:
              text = 'Fri';
              data = 19;

              break;
            case 6:
              text = 'Sat';
              data = 20;

              break;
            case 7:
              text = 'Son';
              data = 21;

              break;
            case 9:
              text = 'Mon';
              data = 22;

              break;

            default:
              return Container();
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                title: text,
                fontSize: 8,
                textColor: AppColor.blueColor0076BE,
              ),
              AppText(
                title: "${data.toInt()}",
                fontSize: 12,
                textColor: AppColor.blueColor0076BE,
              )
            ],
          );
        },
      );

  SideTitles get _leftTitles => SideTitles(
        reservedSize: 40,
        showTitles: true,
        getTitlesWidget: (value, meta) {
          return AppText(
            title: "${value.toInt()}",
            fontSize: 12,
            textColor: AppColor.blueColor0076BE,
          );
        },
      );
}

class Point {
  double y;
  double x;

  Point(this.x, this.y);
}

class Cal {
  String day;
  String name;

  Cal(this.day, this.name);

  @override
  String toString() {
    return '$day  \n $name';
  }
}
