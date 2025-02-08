


import '../../../../common_path.dart';

class ColumnRowSeatList extends StatelessWidget {
  final List? seatList;
  final bool isCountRight;
  final Function(int, int)? seatRowAB, seatRowCD;
  final int? mainIndex;
  final List? selectedSeat;

  const ColumnRowSeatList(
      {super.key,
      this.seatList,
      this.isCountRight = false,
      this.seatRowAB,
      this.seatRowCD,
      this.mainIndex,
      this.selectedSeat});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Widget>.generate(seatList!.length, (int i) {
        List seatDataAB = seatList![i]['seatAB'];
        List seatDataCD = seatList![i]['seatCD'];

        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(seatList![i]['seatNo'].toString(),
                        style: AppCss.figtreeRegular14
                            .textColor(appTheme.secondary)),
                    const HSpace(7.5),
                    ...List<Widget>.generate(seatDataAB.length, (int a) {

                      bool isContain = selectedSeat!.contains(
                          appArray.flightSeatList[mainIndex!]['seats'][i]
                              ["seatAB"][a]);
                      return Row(children: [
                        Container(
                                height: 32,
                                alignment: Alignment.center,
                                width: 32,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: isContain
                                        ? appTheme.secondary
                                        : seatDataAB[a]['isOccupied']
                                            ? appTheme.textBoxBorderGrey
                                            : appTheme.white,
                                    border: Border.all(
                                        color: isContain
                                            ? appTheme.secondary
                                            : seatDataAB[a]['isOccupied']
                                                ? appTheme.textBoxBorderGrey
                                                : appTheme.lightGrey)),
                                child: seatDataAB[a]['isOccupied']
                                    ? null
                                    : Text(
                                        "\$${seatDataAB[a]['price'].toString()}",
                                        style: AppCss.figtreeSB12
                                            .textColor(appTheme.black)))
                            .marginOnly(right: 4)
                            .inkWell(onTap: () => seatRowAB!(i, a))
                      ]);
                    })
                  ]),
              Row(
                children: [
                  ...List<Widget>.generate(seatDataCD.length, (int a) {

                    bool isContain = selectedSeat!.contains(appArray
                        .flightSeatList[mainIndex!]['seats'][i]["seatCD"][a]);
                    return Row(
                      children: [
                        Container(
                                height: 32,
                                alignment: Alignment.center,
                                width: 32,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: isContain
                                        ? appTheme.secondary
                                        : seatDataCD[a]['isOccupied']
                                            ? appTheme.textBoxBorderGrey
                                            : appTheme.white,
                                    border: Border.all(
                                        color: isContain
                                            ? appTheme.secondary
                                            : seatDataCD[a]['isOccupied']
                                                ? appTheme.textBoxBorderGrey
                                                : appTheme.lightGrey)),
                                child: seatDataCD[a]['isOccupied']
                                    ? null
                                    : Text(
                                        "\$${seatDataCD[a]['price'].toString()}",
                                        style: AppCss.figtreeSB12
                                            .textColor(appTheme.black)))
                            .marginOnly(right: 4)
                            .inkWell(onTap: () => seatRowCD!(i, a))
                      ],
                    );
                  }),
                  const HSpace(7.5),
                  Text(seatList![i]['seatNo'].toString(),
                      style: AppCss.figtreeRegular14
                          .textColor(appTheme.secondary))
                ],
              )
            ]).marginOnly(bottom: 12);
        return Container();
      }),
    );
  }
}
