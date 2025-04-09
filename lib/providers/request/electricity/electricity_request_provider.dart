import 'package:gdg_workshop/data/electricity/countary_type.dart';
import 'package:gdg_workshop/data/electricity/electricity_unit.dart';
import 'package:gdg_workshop/models/request/electricity_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'electricity_request_provider.g.dart';

@riverpod
class ElectricityRequestState extends _$ElectricityRequestState {
  @override
  ElectricityRequest build() {
    return ElectricityRequest(
      country: Country.my,
      electricityValue: 0,
      electricityUnit: ElectricityUnit.kWh,
    );
  }

  void updateCountry(Country country) {
    state = state.copyWith(country: country);
  }

  void updateElectricityValue(double value) {
    state = state.copyWith(electricityValue: value);
  }

  void updateElectricityUnit(ElectricityUnit unit) {
    state = state.copyWith(electricityUnit: unit);
  }
}
