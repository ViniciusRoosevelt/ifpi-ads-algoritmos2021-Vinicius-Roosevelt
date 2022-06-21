import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphic/graphic.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../../../../core/models/activity_attempts.dart';
import '../../../../../../../core/models/user_activity.dart';
import '../../../../../../../core/styles/colors.dart';
import '../../../../../../../core/styles/typography.dart';
import '../../../../../../../core/widgets/buttons/app_text_button.dart';
import '../../../../../../../core/widgets/custom_scaffold.dart';
import '../activity_report_controller.dart';

class ActivityReportPage extends StatefulWidget {
  ActivityReportPage({Key? key}) : super(key: key);

  @override
  State<ActivityReportPage> createState() => _ActivityReportPageState();
}

class _ActivityReportPageState
    extends ModularState<ActivityReportPage, ActivityReportController> {
  @override
  Widget build(BuildContext context) {
    final activityAttempts = ModalRoute.of(context)?.settings.arguments
        as List<Map<String, dynamic>>;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // var data = [];
    // activity.tentativas.forEach((element) {
    //   data.add(element.toJson());
    // });

    return CustomScaffold(
      title: 'Desempenho: ${activityAttempts[0]['tituloAtividade']}',
      body: _body(activityAttempts, height, width),
    );
  }

  _body(List<dynamic> data, double width, double height) =>
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _drawTriesAndGradesChart(data, width, height),
            SizedBox(height: height * .1),
            _drawTriesAndRecordingsChart(data, width, height),
          ],
        ),
      );

  _drawTriesAndGradesChart(List<dynamic> data, double width, double height) =>
      Column(
        children: [
          Text(
            'Tentativas x Notas',
            style: AppTypography.h1,
          ),
          SizedBox(height: height * .03),
          Container(
              height: height * .4,
              width: width,
              child: Chart(
                data: data,
                variables: {
                  'Tentativa': Variable(
                    accessor: (dynamic map) =>
                        'Tentativa ${int.parse(map['id']) + 1}',
                  ),
                  'Nota': Variable(
                    accessor: (dynamic map) => double.parse(map['nota']),
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

  _drawTriesAndRecordingsChart(
          List<dynamic> data, double width, double height) =>
      Column(
        children: [
          Text(
            'Tentativas x Quantidade de Gravações',
            style: AppTypography.h1,
            textAlign: TextAlign.center,
          ),
          Container(
              height: height * .4,
              width: width,
              child: Chart(
                data: data,
                variables: {
                  'Tentativa': Variable(
                    accessor: (dynamic map) =>
                        'Tentativa ${int.parse(map['id']) + 1}',
                  ),
                  'Quantidade de Gravações': Variable(
                    accessor: (dynamic map) =>
                        int.parse(map['quantidadeGravacoes']) as int,
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
