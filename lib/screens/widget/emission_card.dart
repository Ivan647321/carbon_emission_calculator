import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdg_workshop/config/theme.dart';

Container emissionCard({
  required double height,
  required double width,
  required double co2eGm,
  required double co2eLb,
  required double co2eKg,
  required double co2eMt,
  required IconData icon,
  required Color iconColor,
}) =>
    Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      height: height * 0.32,
      width: width,
      child: Column(
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 82,
          ),
          Text(
            co2eGm.toString(),
            style: displayLarge(),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "C02e/gm",
            style: normal(),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.20,
                child: Column(
                  children: [
                    Text(
                      co2eLb.toString(),
                      style: displayMedium(bold: true),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "C02e/lb",
                      style: label(),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.20,
                child: Column(
                  children: [
                    Text(
                      co2eKg.toString(),
                      style: displayMedium(bold: true),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "C02e/kg",
                      style: label(),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.20,
                child: Column(
                  children: [
                    Text(
                      co2eMt.toString(),
                      style: displayMedium(bold: true),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "C02e/mt",
                      style: label(),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
