
import 'package:bloc_booking/presentation/pages/select_seats/layouts/seat_row_list.dart';

import '../../../../common_path.dart';
import 'column_row_seat_list.dart';


class SeatList extends StatelessWidget {
  final int? index;
  final dynamic data;
  final Function(int, int)? selectSeatAB, selectSeatCD;
  final List? selectedSeat;

  const SeatList(
      {super.key,
      this.index,
      this.data,
      this.selectSeatAB,
      this.selectedSeat,
      this.selectSeatCD});

  @override
  Widget build(BuildContext context) {
    List seatList = data['seats'];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(data['title'],
            style: AppCss.figtreeSB14.textColor(appTheme.greyText)),
        const VSpace(16),
        if (index == 0) const SeatRowList(),
         OverflowBar(

             children: [
          ColumnRowSeatList(
              seatList: seatList,
              seatRowAB: (i, a) => selectSeatAB!(i, a),
              seatRowCD: (i, a) => selectSeatCD!(i, a),
              mainIndex: index,
              selectedSeat: selectedSeat).marginSymmetric(horizontal: 30)
        ])
      ],
    );
  }
}
