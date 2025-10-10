import 'package:flutter/material.dart';

class DatePickerDemo extends StatefulWidget {
  const DatePickerDemo({super.key});

  @override
  State<DatePickerDemo> createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  DateTime? fromDate;
  DateTime? toDate;

  // Formats date as dd/MM/yyyy
  String formatDate(DateTime? date) =>
      date == null ? '' : '${date.day}/${date.month}/${date.year}';

  // Select starting date
  void selectFromDate() async {
    DateTime initialFrom = fromDate ?? DateTime.now();
    DateTime firstDate = DateTime(2025, 1, 1);
    DateTime lastDate = DateTime(2025, 12, 31);

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialFrom,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null) {
      setState(() {
        fromDate = pickedDate;
        // If toDate is null or before fromDate, set it equal to fromDate
        if (toDate == null || toDate!.isBefore(fromDate!)) {
          toDate = fromDate;
        }
      });
    }
  }

  // Select ending date
  void selectToDate() async {
    if (fromDate == null) return; // Can't select toDate before fromDate

    DateTime initialTo = toDate ?? fromDate!;
    DateTime firstDate = fromDate!;
    DateTime lastDate = DateTime(2025, 12, 31);

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialTo,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null) {
      setState(() {
        toDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DatePicker Demo'), centerTitle: false),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FilledButton.icon(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: selectFromDate,
                  label: const Text('From'),
                ),
                const SizedBox(width: 10),
                Text(formatDate(fromDate)),
              ],
            ),
            Row(
              children: [
                FilledButton.icon(
                  icon: const Icon(Icons.calendar_today),
                  onPressed:  selectToDate,
                  label: const Text('To'),
                ),
                const SizedBox(width: 10),
                Text(formatDate(toDate)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}