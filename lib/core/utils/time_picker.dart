import 'package:credify/viewModel/app_model.dart';
import 'package:flutter/material.dart';

class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker({
    super.key,
    required this.timePicker,
    required this.onTimeSelect,
  });

  final TextEditingController timePicker;

  final Function onTimeSelect;


  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  final AppModel model = AppModel();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.timePicker,
      readOnly: true,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: model.formatTime(DateTime.now()),
        // filled: true,
        suffixIcon: Icon(Icons.timelapse),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15.0),
        //   borderSide: BorderSide(
        //     color: Colors.grey.withValues(alpha: 0.1),
        //     width: 2.0,
        //   ),
        // ),
        //   focusedBorder: OutlineInputBorder(
        //     borderSide: const BorderSide(color: Colors.black),
        //     borderRadius: BorderRadius.circular(15.0),
        //   ),
      ),
      onTap: () {
        Future<void> selectDate() async {
          TimeOfDay? picked = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );

          if (picked != null) {
            setState(() {
              widget.timePicker.text = picked.format(context);
              widget.onTimeSelect(picked);
            });
          }
        }

        selectDate();
      },
    );
  }
}
