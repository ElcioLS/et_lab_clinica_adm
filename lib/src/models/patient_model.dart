import 'package:et_lab_clinica_adm/src/models/patient_address_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'patient_model.g.dart';

@JsonSerializable()
class PatientModel {
  PatientModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.doccument,
    required this.address,
    required this.guardian,
    required this.guardianIdentificationNumber,
  });

  String id;
  String name;
  String email;
  @JsonKey(name: 'phone_number')
  String phoneNumber;
  String doccument;
  PatientAddressModel address;
  @JsonKey(name: 'guardian', defaultValue: '')
  String guardian;
  @JsonKey(name: 'guardian_identification_number', defaultValue: '')
  String guardianIdentificationNumber;

  factory PatientModel.fromJson(Map<String, dynamic> json) =>
      _$PatientModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientModelToJson(this);
}
