import 'package:flutter/material.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

// ignore: use_key_in_widget_constructors
class TimeSlotPicker extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _TimeSlotPickerState createState() => _TimeSlotPickerState();
}

class _TimeSlotPickerState extends State<TimeSlotPicker> {
  final List<String> weekdays = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday"
  ];
  final List<String> weekend = ["Saturday", "Sunday"];
  List<TimeOfDay> weekdayTimeSlots = [];
  List<TimeOfDay> weekendTimeSlots = [];
  String? selectedDay;
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;

  final _multiSelectKey = GlobalKey<FormFieldState>();

  List<MultiSelectItem<TimeSlot>> _weekdayTimeSlotItems = [];
  List<MultiSelectItem<TimeSlot>> _weekendTimeSlotItems = [];
  List<TimeSlot> _selectedTimeSlots = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _generateTimeSlots();
  }

  void _generateTimeSlots() {
    // Weekday time slots (Monday to Friday)
    List<TimeOfDay> generatedWeekdaySlots = [];
    for (int hour = 9; hour <= 17; hour++) {
      generatedWeekdaySlots.add(TimeOfDay(hour: hour, minute: 0));
      generatedWeekdaySlots.add(TimeOfDay(hour: hour, minute: 30));
    }

    // Weekend time slots (Saturday and Sunday)
    List<TimeOfDay> generatedWeekendSlots = [];
    for (int hour = 10; hour <= 14; hour++) {
      generatedWeekendSlots.add(TimeOfDay(hour: hour, minute: 0));
      generatedWeekendSlots.add(TimeOfDay(hour: hour, minute: 30));
    }

    setState(() {
      weekdayTimeSlots = generatedWeekdaySlots;
      weekendTimeSlots = generatedWeekendSlots;

      _weekdayTimeSlotItems = weekdayTimeSlots
          .map((time) => MultiSelectItem<TimeSlot>(
              TimeSlot(day: selectedDay ?? "", time: time),
              "${time.format(context)} - ${_addMinutesToTimeOfDay(time, 30).format(context)}"))
          .toList();

      _weekendTimeSlotItems = weekendTimeSlots
          .map((time) => MultiSelectItem<TimeSlot>(
              TimeSlot(day: selectedDay ?? "", time: time),
              "${time.format(context)} - ${_addMinutesToTimeOfDay(time, 30).format(context)}"))
          .toList();
    });
  }

  TimeOfDay _addMinutesToTimeOfDay(TimeOfDay time, int minutesToAdd) {
    int newMinute = time.minute + minutesToAdd;
    int newHour = time.hour;

    if (newMinute >= 60) {
      newMinute -= 60;
      newHour++;
    }

    if (newHour >= 24) {
      newHour = 0; // Handle wrapping around midnight if necessary
    }

    return TimeOfDay(hour: newHour, minute: newMinute);
  }

  Future<void> _pickTime(BuildContext context, bool isStartTime) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          selectedStartTime = picked;
        } else {
          selectedEndTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: "Select Day"),
            items: [...weekdays, ...weekend].map((String day) {
              return DropdownMenuItem<String>(
                value: day,
                child: Text(day),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedDay = value;
              });
            },
            value: selectedDay,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _pickTime(context, true),
            child: Text(
              selectedStartTime == null
                  ? "Select Start Time"
                  : "Start Time: ${selectedStartTime!.format(context)}",
            ),
          ),
          ElevatedButton(
            onPressed: () => _pickTime(context, false),
            child: Text(
              selectedEndTime == null
                  ? "Select End Time"
                  : "End Time: ${selectedEndTime!.format(context)}",
            ),
          ),
          const SizedBox(height: 20),
          const Text("Select Time Slots:"),
          if (weekdays.contains(selectedDay))
            MultiSelectDialogField(
              key: _multiSelectKey,
              items: _weekdayTimeSlotItems,
              title: const Text("Weekday Time Slots"),
              selectedColor: Colors.blue,
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha:0.1),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
              onConfirm: (results) {
                _selectedTimeSlots = results.cast<TimeSlot>();
              },
              chipDisplay: MultiSelectChipDisplay(
                onTap: (value) {
                  setState(() {
                    _selectedTimeSlots.remove(value);
                  });
                },
              ),
            ),
          if (weekend.contains(selectedDay))
            MultiSelectDialogField(
              key: _multiSelectKey,
              items: _weekendTimeSlotItems,
              title: const Text("Weekend Time Slots"),
              selectedColor: Colors.blue,
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha:0.1),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
              onConfirm: (results) {
                _selectedTimeSlots = results.cast<TimeSlot>();
              },
              chipDisplay: MultiSelectChipDisplay(
                onTap: (value) {
                  setState(() {
                    _selectedTimeSlots.remove(value);
                  });
                },
              ),
            ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (selectedDay != null &&
                  selectedStartTime != null &&
                  selectedEndTime != null) {
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("Please select a day and time slots")),
                );
              }
            },
            child: const Text("Submit and Open New Screen"),
          ),
        ],
      ),
    );
  }
}

class TimeSlot {
  final String day;
  final TimeOfDay time;

  TimeSlot({required this.day, required this.time});
}
