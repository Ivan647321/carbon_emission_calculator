import 'package:flutter/material.dart';
import 'package:gdg_workshop/config/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.energy_savings_leaf_outlined,
              size: 64,
              color: primaryGreen,
            ),
            Text(
              "Green Genie",
              style: displayLarge(),
            ),
            Text(
              "Your personal carbon emission calculator",
              style: displayMedium(),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
