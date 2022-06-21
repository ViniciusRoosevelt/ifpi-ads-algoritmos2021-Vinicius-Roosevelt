import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

import 'chart_title.dart';

class ChartContainer extends StatelessWidget {
  List<dynamic> data = [];
  String title = '';
  String dataType = 'double';
  String variableX = '';
  String variableY = '';

  ChartContainer({
    Key? key,
    required List<dynamic> data,
    required String title,
    required String dataType,
    required String variableX,
    required String variableY,
  }) : super(key: key) {
    this.data = data;
    this.title = title;
    this.dataType = dataType;
    this.variableX = variableX;
    this.variableY = variableY;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        ChartTitle(title: title),
        SizedBox(height: height * .03),
        Container(
            height: height * .4,
            width: width,
            child: Chart(
              data: data,
              variables: {
                variableX: Variable(
                  accessor: (dynamic map) => 'Tentativa ${map['id']}',
                ),
                variableY: Variable(
                  accessor: (dynamic map) => dataType.toLowerCase() == 'integer'
                      ? int.parse(map[variableY]) as int
                      : double.parse(map[variableY]) as double,
                ),
              },
              elements: [IntervalElement()],
              axes: [
                Defaults.horizontalAxis,
                Defaults.verticalAxis,
              ],
            )),
      ],
    );
  }
}
