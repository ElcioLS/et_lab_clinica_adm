// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_information_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientInformationFormModel _$PatientInformationFormModelFromJson(
        Map<String, dynamic> json) =>
    PatientInformationFormModel(
      id: json['id'] as String,
      patient: PatientModel.fromJson(json['patient'] as Map<String, dynamic>),
      healthInsuranceCard: json['health_insurance_card'] as String,
      medicalOrders: (json['medical_order'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      password: json['password'] as String,
      dateCreated: DateTime.parse(json['date_created'] as String),
      status:
          $enumDecode(_$PatientInformationFormStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$PatientInformationFormModelToJson(
        PatientInformationFormModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patient': instance.patient,
      'health_insurance_card': instance.healthInsuranceCard,
      'medical_order': instance.medicalOrders,
      'password': instance.password,
      'date_created': instance.dateCreated.toIso8601String(),
      'status': _$PatientInformationFormStatusEnumMap[instance.status]!,
    };

const _$PatientInformationFormStatusEnumMap = {
  PatientInformationFormStatus.waiting: 'Waiting',
  PatientInformationFormStatus.checkedIn: 'Checked In',
  PatientInformationFormStatus.beingAttended: 'Being Attended',
};
