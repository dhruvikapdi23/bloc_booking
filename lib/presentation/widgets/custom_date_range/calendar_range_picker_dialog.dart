
import '../../../common_path.dart';
import 'calendar_date_range_picker.dart';

class CalendarRangePickerDialog extends StatelessWidget {
  const CalendarRangePickerDialog({
    super.key,
    required this.selectedStartDate,
    required this.selectedEndDate,
    required this.firstDate,
    required this.lastDate,
    required this.currentDate,
    required this.onStartDateChanged,
    required this.onEndDateChanged,
    required this.onConfirm,
    required this.onCancel,
    required this.confirmText,
    required this.helpText,
    this.entryModeButton,
  });

  final DateTime? selectedStartDate;
  final DateTime? selectedEndDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime? currentDate;
  final ValueChanged<DateTime> onStartDateChanged;
  final ValueChanged<DateTime?> onEndDateChanged;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final String confirmText;
  final String helpText;
  final Widget? entryModeButton;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        left: false,
        right: false,
        child: CalendarDateRangePicker(
          initialStartDate: selectedStartDate,
          initialEndDate: selectedEndDate,
          firstDate: firstDate,
          lastDate: lastDate,
          currentDate: currentDate,
          onStartDateChanged: onStartDateChanged,
          onEndDateChanged: onEndDateChanged,
        ));
  }
}