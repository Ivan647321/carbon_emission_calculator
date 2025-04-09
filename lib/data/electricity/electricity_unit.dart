import 'package:gdg_workshop/data/has_value.dart';

class ElectricityUnit implements HasValue {
  @override
  final String value;

  const ElectricityUnit._(this.value);

  static const ElectricityUnit kWh = ElectricityUnit._("kWh");
  static const ElectricityUnit MWh = ElectricityUnit._("MWh");

  static const List<ElectricityUnit> values = [kWh, MWh];
}
