import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gdg_workshop/config/theme.dart';
import 'package:gdg_workshop/data/electricity/countary_type.dart';
import 'package:gdg_workshop/data/electricity/electricity_unit.dart';
import 'package:gdg_workshop/providers/request/electricity/electricity_request_provider.dart';
import 'package:gdg_workshop/providers/response/electricity/electricity_response_provider.dart';
import 'package:gdg_workshop/screens/widget/calculate_button.dart';
import 'package:gdg_workshop/screens/widget/custom_dropdown.dart';
import 'package:gdg_workshop/screens/widget/emission_card.dart';
import 'package:gdg_workshop/screens/widget/emission_card_skeleton.dart';
import 'package:gdg_workshop/screens/widget/expanded_text_field.dart';

class ElectricityScreen extends ConsumerStatefulWidget {
  const ElectricityScreen({super.key});

  @override
  ConsumerState<ElectricityScreen> createState() => _ElectricityScreenState();
}

class _ElectricityScreenState extends ConsumerState<ElectricityScreen> {
  late TextEditingController electricityValueController;

  @override
  void initState() {
    super.initState();
    electricityValueController = TextEditingController(text: "0");
  }

  @override
  void dispose() {
    electricityValueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final reqState = ref.watch(electricityRequestStateProvider);
    final resState = ref.watch(electricityResponseStateProvider);
    final reqNotifier = ref.read(electricityRequestStateProvider.notifier);
    final resNotofier = ref.read(electricityResponseStateProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text("Electricity Emission"),
        backgroundColor: primaryYellow,
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
                      icon: Icons.bolt,
                      iconColor: secondaryYellow,
                    ),
                    error: (error, stackTrace) =>
                        Text("Error: ${error.toString()}"),
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
                        labelText: "Electricity Value",
                        textController: electricityValueController,
                        onChanged: (value) {
                          reqNotifier
                              .updateElectricityValue(double.parse(value));
                        },
                      ),
                      customDropdown(
                          labelText: "Electricity Unit",
                          items: ElectricityUnit.values,
                          value: reqState.electricityUnit,
                          onChanged: (value) {
                            reqNotifier.updateElectricityUnit(
                                value as ElectricityUnit);
                          },
                          width: width,
                          height: height)
                    ],
                  ),
                  customDropdown(
                    labelText: "Country Name",
                    items: Country.values,
                    value: reqState.country,
                    onChanged: (value) {
                      reqNotifier.updateCountry(value as Country);
                    },
                    width: width,
                    height: height,
                  ),
                  calculateButton(
                    width: width,
                    height: height,
                    btnColor: primaryYellow,
                    onTap: () {
                      resNotofier.calculateElectricityEmission(reqState);
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
