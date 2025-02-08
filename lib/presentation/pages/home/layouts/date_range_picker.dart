import 'package:intl/intl.dart';
import '../../../../common_path.dart';
import '../../../bloc/home/home_cubit.dart';
import '../../../widgets/custom_date_range/date_range_custom_dialog.dart';


class DateRangePicker extends StatelessWidget {
  final HomeCubit? home;
  const DateRangePicker({
    super.key,this.home
  });

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HomeCubit, HomeState>(
      bloc: home,
        builder: (context, state,) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: DraggableScrollableSheet(
                initialChildSize: .93,
                maxChildSize: .98,
                minChildSize: 0.3,
                expand: false,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Stack(children: [
                    ListView(padding: const EdgeInsets.all(24), children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(fonts.selectDate,
                                style: AppCss.figtreeSB24
                                    .textColor(appTheme.secondary)),
                            SvgPicture.asset(svgAssets.cancel,
                                    height: 24)
                                .inkWell(onTap: () => context.pop(context))
                          ]),
                      const VSpace(24),
                      Row(children: [
                        Expanded(
                          child: TextFieldCommon(
                              keyboardType: TextInputType.datetime,
                              prefixIcon: SvgPicture.asset(svgAssets.search,
                                      height: 24)
                                  .paddingOnly(right: 8),
                              focusNode: home!.fromFocus,
                              controller: home!.fromCtrl,
                              hintText: fonts.depart),
                        ),
                        SvgPicture.asset(svgAssets.rightArrow)
                            .paddingSymmetric(horizontal: 16),
                        Expanded(
                            child: TextFieldCommon(
                                keyboardType: TextInputType.datetime,
                                prefixIcon: SvgPicture.asset(svgAssets.search,
                                        height: 24)
                                    .paddingOnly(right: 8),
                                focusNode: home!.toFocus,
                                controller: home!.toCtrl,
                                hintText: fonts.returnText))
                      ]),
                      const VSpace(24),
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 1,
                          child: DateRangePickerDialogCustom(
                              firstDate: DateTime.now(),
                              lastDate: DateTime(DateTime.now().year + 20,
                                  DateTime.now().month, DateTime.now().day),
                              initialDateRange: home!.dateTimeRange,
                              startDateSelect: (p0) {
                                home!.fromCtrl.text =
                                    DateFormat("MMM dd,yyyy").format(p0);
                                home!.fromDate = p0;
                                if(home!.selectedValue != "Round trip"){
                                  context.pop(context);
                                }
                               // home!.notifyListeners();
                              },
                              endDateSelect: (p0) {
                                home!.toCtrl.text =
                                    DateFormat("MMM dd,yyyy").format(p0);
                                home!.toDate = p0;
                               // home!.notifyListeners();
                              },
                              onValueChange: (dateTime) {
                                home!.dateTimeRange = dateTime;
                               // home!.notifyListeners();
                              }))
                    ]).marginOnly(bottom: 50),
                  ]);
                }));
      });
    });
  }
}
