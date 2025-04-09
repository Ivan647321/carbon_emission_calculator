import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gdg_workshop/config/theme.dart';
import 'package:gdg_workshop/data/transportation/distance_unit.dart';
import 'package:gdg_workshop/data/transportation/fuel_type.dart';
import 'package:gdg_workshop/data/transportation/vehicle_type.dart';
import 'package:gdg_workshop/providers/request/transportation/transportation_request_provider.dart';
import 'package:gdg_workshop/providers/response/transportation/transportation_response_provider.dart';
import 'package:gdg_workshop/screens/widget/calculate_button.dart';
import 'package:gdg_workshop/screens/widget/custom_dropdown.dart';
import 'package:gdg_workshop/screens/widget/emission_card.dart';
import 'package:gdg_workshop/screens/widget/emission_card_skeleton.dart';
import 'package:gdg_workshop/screens/widget/expanded_text_field.dart';

class TransportationScreen extends ConsumerStatefulWidget {
  const TransportationScreen({super.key});

  @override
  ConsumerState<TransportationScreen> createState() =>
      _TransportationScreenState();
}

class _TransportationScreenState extends ConsumerState<TransportationScreen> {
  late TextEditingController distanceValueController;

  @override
  void initState() {
    super.initState();
    distanceValueController = TextEditingController(text: "0");
  }

  @override
  void dispose() {
    distanceValueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final reqState = ref.watch(transportationRequestStateProvider);
    final resState = ref.watch(transportationResponseStateProvider);
    final reqNotifier = ref.read(transportationRequestStateProvider.notifier);
    final resNotofier = ref.read(transportationResponseStateProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text("Transportations Emissions"),
        backgroundColor: primaryBlue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: height * 0.5 - kToolbarHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  resState.when(
                    data: (response) => emissionCard(
                        height: height,
                        width: width,
                        co2eGm: response?.co2eGm ?? 0,
                        co2eLb: response?.co2eLb ?? 0,
                        co2eKg: response?.co2eKg ?? 0,
                        co2eMt: response?.co2eMt ?? 0,
                        icon: CupertinoIcons.car,
                        iconColor: secondaryBlue),
                    error: (errorText, stackTrace) => Text(
                      "Error: ${errorText.toString()}",
                      style: normal(color: error),
                    ),
                    loading: () =>
                        emissionCardSkeleton(height: height, width: width),
                  ),
                  Text(
                    "Please enter your data",
                    style: normal(bold: true),
                  ),
                  Row(
                    spacing: 16,
                    children: [
                      expandedTextField(
                        height: height,
                        labelText: "Distance Traveled",
                        textController: distanceValueController,
                        onChanged: (value) {
                          reqNotifier.updateDistanceValue(double.parse(value));
                        },
                      ),
                      customDropdown(
                        labelText: "Distance Unit",
                        items: DistanceUnit.values,
                        value: reqState.distanceUnit,
                        onChanged: (value) {
                          reqNotifier.updateDistanceUnit(value as DistanceUnit);
                        },
                        width: width,
                        height: height,
                      ),
                    ],
                  ),
                  customDropdown(
                    labelText: "Vehicle Type",
                    items: VehicleType.values,
                    value: reqState.vehicleType,
                    onChanged: (value) {
                      reqNotifier.updateVehicleType(value as VehicleType);
                    },
                    width: width,
                    height: height,
                  ),
                  customDropdown(
                    labelText: "Fuel Type",
                    items: FuelType.values,
                    value: reqState.fuelType,
                    onChanged: (value) {
                      reqNotifier.updateFuelType(value as FuelType);
                    },
                    width: width,
                    height: height,
                  ),
                  calculateButton(
                    width: width,
                    height: height,
                    btnColor: secondaryBlue,
                    onTap: () {
                      resNotofier.calculateTransportationEmission(reqState);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
