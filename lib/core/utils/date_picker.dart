import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key, required this.dateControl});

  final TextEditingController dateControl;



  @override
  State<DatePicker> createState() => _DatePickerState();
}

final dDay = DateTime.now();
final onlyToday = DateTime(dDay.year, dDay.month, dDay.day);

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dateControl,
      readOnly: true,
      style: const TextStyle(color: Colors.black, fontSize: 16),
      decoration: InputDecoration(
        hintText: "Date",
        suffixIcon: Icon(Icons.calendar_month),
        // enabledBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(15.0),
        //     borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.1), width: 2.0)
        // ),
        // focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.black,), borderRadius: BorderRadius.circular(15.0)),
      ),
      onTap: (){

        selectDate();
      },
    );
  }

  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),

        //To make other days before today un selectable
        // firstDate: DateTime.now(),

        //To make other days before today un selectable
        // To avoid disabling day if the timezone is different
        firstDate: onlyToday,
        lastDate: DateTime(2100));
    if(picked != null){
      setState(() {
        widget.dateControl.text = picked.toString().split(" ")[0];
        // print(widget.dateControl.text);
      });
    }
  }
}

