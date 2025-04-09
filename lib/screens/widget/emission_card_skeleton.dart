import 'package:flutter/material.dart';
import 'package:gdg_workshop/config/theme.dart';

Widget emissionCardSkeleton({
  required double height,
  required width,
}) =>
    Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      height: height * 0.32,
      width: width,
      child: CircularProgressIndicator(),
    );
