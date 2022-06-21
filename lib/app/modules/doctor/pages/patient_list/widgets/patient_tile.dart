import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/typography.dart';
import '../../../core/models/patient.dart';

class PatientTile extends StatelessWidget {
  PatientTile({required this.patient});

  late Patient patient;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed(
            '/doctor/patient-list/patient-details',
            arguments: patient),
        child: Container(
          padding: EdgeInsets.all(width * .015),
          height: 110.0,
          decoration: _patientCardStyle(),
          child: Row(
            children: <Widget>[
              _patientPhoto(patient),
              Spacer(),
              _patientNameAndInitDate(patient, width),
            ],
          ),
        ),
      ),
    );
  }

  _patientCardStyle() => BoxDecoration(
          color: AppColors.card_background,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.black_16,
              blurRadius: 4.0,
            ),
          ]);

  _patientNameAndInitDate(Patient patient, double width) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: width * .5,
          child: Text(
            patient.nome ?? 'Não identificado',
            style: AppTypography.h1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
            width: width * .6,
            child: Text(
              'Início do tratamento: ${patient.dataDeInicio}',
              textAlign: TextAlign.center,
            )),
      ],
    );
  }

  _patientPhoto(Patient patient) => Container(
      height: 60.0,
      width: 60.0,
      child: CircleAvatar(
        radius: 30.0,
        backgroundImage: NetworkImage(
            patient.fotoPerfil ?? 'https://via.placeholder.com/150'),
        backgroundColor: Colors.white,
      ));
}
