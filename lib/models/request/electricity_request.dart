import 'package:gdg_workshop/data/electricity/countary_type.dart';
import 'package:gdg_workshop/data/electricity/electricity_unit.dart';

class ElectricityRequest {
  final Country country;
  final ElectricityUnit electricityUnit;
  final double electricityValue;

  ElectricityRequest({
    required this.country,
    required this.electricityUnit,
    required this.electricityValue,
  });
  ElectricityRequest copyWith({
    Country? country,
    ElectricityUnit? electricityUnit,
    double? electricityValue,
  }) {
    return ElectricityRequest(
      country: country ?? this.country,
      electricityUnit: electricityUnit ?? this.electricityUnit,
      electricityValue: electricityValue ?? this.electricityValue,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "country_name": country.value,
      "electricity_value": electricityValue,
      "electricity_unit": electricityUnit.value,
    };
  }
}
