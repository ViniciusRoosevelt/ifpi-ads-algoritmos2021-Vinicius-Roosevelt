import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../../../../core/models/new_activity.dart';
import '../../../../../../../core/models/new_lesson.dart';
import '../../../../../../../core/models/patient.dart';
import '../../../../../../../core/widgets/custom_scaffold.dart';
import '../../../../../../../core/models/lesson.dart';
import '../../../../../../../core/models/user_activity.dart';
import '../../../../../../../core/styles/colors.dart';
import '../../../../../../../core/styles/typography.dart';
import '../../../../../../../core/widgets/simple_loader_widget.dart';
import '../../../widgets/user_activity_widget.dart';
import '../user_activity_controller.dart';

class ActivitiesListPage extends StatefulWidget {
  const ActivitiesListPage({Key? key}) : super(key: key);

  @override
  State<ActivitiesListPage> createState() => _ActivitiesListPageState();
}

class _ActivitiesListPageState
    extends ModularState<ActivitiesListPage, UserActivityController> {
  late NewLesson lessons = NewLesson.fromJson(Modular.args.data[0][1]);
  Patient patient = Modular.args.data[1];
  String? lessonId = Modular.args.data[0][0];
  @override
  void initState() {
    print(Modular.args.data);
    super.initState();
    Permission.microphone.request();
    Permission.accessMediaLocation.request();
    print('List Act : ${Modular.args.data[0]}');
    controller.getActivities(Modular.args.data[0][0]);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return FutureBuilder<QuerySnapshot>(
        future: controller.activitys,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SimpleLoaderWidget(
              key: Key('lessonLoader'),
            );
          } else {
            final activityID = [];
            snapshot.data!.docs.forEach((element) {
              print('Id da Atividade: ${element.id}');
              activityID.add(element.id);
            });
            final activities = snapshot.data!.docs
                as List<QueryDocumentSnapshot<Map<String, dynamic>>>;
            return CustomScaffold(
              title: 'Atividades',
              body: _body(activities, height, activityID),
              // body: _body(activities, height),
              // height: (activities.length / 2) * height * .26,
            );
          }
        });

    /* return Scaffold(
      appBar: _appBar(),
      body: _body(activities, height),
    ); */
  }

  _body(List<QueryDocumentSnapshot<Map<String, dynamic>>> activities,
          double height, List activityId) =>
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Text(
              lessons.corpo!,
              textAlign: TextAlign.center,
              style: AppTypography.body,
            ),
            SizedBox(
              height: height,
              child: Center(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(20),
                  itemCount: activities.length,
                  itemBuilder: (BuildContext context, int index) {
                    var activity =
                        NewActivity.fromJson(activities[index].data());
                    return UserActivityWidget(
                      score: controller.getAttemptsOfActivity(patient,
                          lessonId!, activityId[index], activity.titulo!),
                      // controller.getAttemptsOfActivity(patient, lessons.id!, activity.id!),
                      activity: activity,
                      routeName:
                          '/patient/lessons/activities/selected-activity',
                      arguments: [
                        activity,
                        Modular.args.data[0][0],
                        activityId[index]
                      ],
                    );
                  },
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                      maxCrossAxisExtent: height * 0.35,
                      mainAxisExtent: height * .22),
                ),
              ),
            ),
          ],
        ),
      );
}
