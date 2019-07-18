import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:kecipe/common/indicator.dart';
import 'package:kecipe/models/meal_model.dart';

class NutritionPieChart extends StatefulWidget {
  final Recipe recipe;
  NutritionPieChart({this.recipe});

  @override
  State<StatefulWidget> createState() => PieChart2State();

}

class PieChart2State extends State<NutritionPieChart> {

  List<PieChartSectionData> pieChartRawSections;
  List<PieChartSectionData> showingSections;

  StreamController<PieTouchResponse> pieTouchedResultStreamController;

  int touchedIndex;

  @override
  void initState() {
    super.initState();

    final section1 = PieChartSectionData(
      color: Colors.redAccent,
      value: widget.recipe.totalNutrients.cHOCDF.quantity/ widget.recipe.yield,
      title: "${(widget.recipe.totalNutrients.cHOCDF.quantity/ widget.recipe.yield).round()} %",
      radius: 50,
      titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xffffffff)),
    );

    final section2 = PieChartSectionData(
      color: Colors.greenAccent,
      value: widget.recipe.totalNutrients.pROCNT.quantity/ widget.recipe.yield,
      title: "${(widget.recipe.totalNutrients.pROCNT.quantity/ widget.recipe.yield).round()} %",
      radius: 50,
      titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xffffffff)),
    );

    final section3 = PieChartSectionData(
      color: Colors.orangeAccent,
      value: widget.recipe.totalNutrients.fAT.quantity/ widget.recipe.yield,
      title: "${(widget.recipe.totalNutrients.fAT.quantity/ widget.recipe.yield).round()} %",
      radius: 50,
      titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xffffffff)),
    );


    final items = [
      section1,
      section2,
      section3,
    ];

    pieChartRawSections = items;

    showingSections = pieChartRawSections;

    pieTouchedResultStreamController = StreamController();
    pieTouchedResultStreamController.stream.distinct().listen((details) {
      print(details);
      if (details == null) {
        return;
      }

      touchedIndex = -1;
      if (details.sectionData != null) {
        touchedIndex = showingSections.indexOf(details.sectionData);
      }

      setState(() {
        if (details.touchInput is FlLongPressEnd) {
          touchedIndex = -1;
          showingSections = List.of(pieChartRawSections);
        } else {
          showingSections = List.of(pieChartRawSections);

          if (touchedIndex != -1) {
            final TextStyle style = showingSections[touchedIndex].titleStyle;
            showingSections[touchedIndex] = showingSections[touchedIndex].copyWith(
              titleStyle: style.copyWith(
                fontSize: 24,
              ),
              radius: 60,
            );
          }
        }
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 18,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: FlChart(
                  chart: PieChart(
                    PieChartData(
                        pieTouchData: PieTouchData(
                            touchResponseStreamSink: pieTouchedResultStreamController.sink
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 0,
                        centerSpaceRadius: 40,
                        sections: showingSections),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Indicator(color: Colors.orangeAccent, text: "Fat", isSquare: true,),
                SizedBox(
                  height: 4,
                ),
                Indicator(color: Colors.greenAccent, text: "Protein", isSquare: true,),
                SizedBox(
                  height: 4,
                ),
                Indicator(color: Colors.redAccent, text: "Carbs", isSquare: true,),
                SizedBox(
                  height: 4,
                ),
              ],
            ),
            SizedBox(
              width: 28,
            ),
          ],
        ),
      ),
    );
  }

}

