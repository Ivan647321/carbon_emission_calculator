import 'package:gdg_workshop/data/transportation/distance_unit.dart';
import 'package:gdg_workshop/data/transportation/fuel_type.dart';
import 'package:gdg_workshop/data/transportation/vehicle_type.dart';

class TransportationRequest {
  final VehicleType vehicleType;
  final FuelType fuelType;
  final double distanceValue;
  final DistanceUnit distanceUnit;

  TransportationRequest({
    required this.vehicleType,
    required this.fuelType,
    required this.distanceValue,
    required this.distanceUnit,
  });

  TransportationRequest copyWith({
    VehicleType? vehicleType,
    FuelType? fuelType,
    double? distanceValue,
    DistanceUnit? distanceUnit,
  }) {
    return TransportationRequest(
      vehicleType: vehicleType ?? this.vehicleType,
      fuelType: fuelType ?? this.fuelType,
      distanceValue: distanceValue ?? this.distanceValue,
      distanceUnit: distanceUnit ?? this.distanceUnit,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "vehicle_type": vehicleType.value,
      "fuel_type": fuelType.value,
      "distance_value": distanceValue,
      "distance_unit": distanceUnit.value,
    };
  }
}
