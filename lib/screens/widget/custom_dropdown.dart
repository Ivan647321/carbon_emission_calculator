import 'package:flutter/material.dart';
import 'package:gdg_workshop/config/theme.dart';
import 'package:gdg_workshop/data/has_value.dart';

Widget customDropdown<T extends HasValue>({
  required String labelText,
  required List<T> items,
  required T? value,
  required void Function(T?) onChanged,
  required double width,
  required double height,
}) =>
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text(
            labelText,
            style: label(),
          ),
          SizedBox(
            width: width,
            height: height * 0.06,
            child: DropdownButtonFormField<T>(
              value: value,
              items: items
                  .map(
                    (item) => DropdownMenuItem<T>(
                      value: item,
                      child: Text(item.value),
                    ),
                  )
                  .toList(),
              onChanged: onChanged,
            ),
          )
        ],
      ),
    );
