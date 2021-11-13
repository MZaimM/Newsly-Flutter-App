import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

class DateTimeField extends StatelessWidget {
  DateTimeField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DateTimeFormField(
      decoration: InputDecoration(
          hintText: "Date",
          labelText: "Date",
          prefixIcon: Icon(Icons.date_range_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
      mode: DateTimeFieldPickerMode.dateAndTime,
      autovalidateMode: AutovalidateMode.always,
      validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
      onDateSelected: (DateTime value) {
        print(value);
      },
    );
  }
}
