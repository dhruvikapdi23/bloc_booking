
import '../../../../common_path.dart';

class SeatRowList extends StatelessWidget {
  const SeatRowList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      
        children: [
          Expanded(
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,
                children: List<Widget>.generate(
                    appArray.seatLabelsAB.length,
                        (int i) {
                      return Container(
                          height: 32,
                          alignment: Alignment.center,
                          width: 32,

                          child: Text(
                              appArray.seatLabelsAB[i],
                              style: AppCss.figtreeRegular14
                                  .textColor(appTheme.secondary)))
                          .marginOnly(right: 4).padding(bottom: 12);
                    })
              ).marginOnly(left: 42)
          ),
          Expanded(
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.end,

              children: List<Widget>.generate(
                  appArray.seatLabelsCD.length,
                      (int i) {
                    return Container(
                        alignment: Alignment.center,
                        height: 32,
                        width: i ==2?0: 32,

                        margin: const EdgeInsets.only(right: 4),
                        child: Text(
                          appArray.seatLabelsCD[i],
                          style: AppCss.figtreeRegular14
                              .textColor(
                              appTheme.secondary),
                        ).padding(bottom: 12));
                  }),
            ).marginOnly(right: 45)
          ),
        ]
    );
  }
}
