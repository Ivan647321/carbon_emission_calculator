import 'package:flutter/material.dart';
import 'package:gdg_workshop/config/theme.dart';

Widget calculateButton(
        {required double width,
        required double height,
        required Color btnColor,
        required void Function() onTap}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 8),
        alignment: Alignment.center,
        width: width,
        height: height * 0.06,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Text(
          "Calculate",
          style: normal(bold: true, color: white),
        ),
      ),
    );
