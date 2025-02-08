
import '../../../common_path.dart';

class BagsSelection extends StatefulWidget {
  const BagsSelection({super.key});

  @override
  State<BagsSelection> createState() => _BagsSelectionState();
}

class _BagsSelectionState extends State<BagsSelection> {
  @override
  Widget build(BuildContext context) {
   /* return Scaffold(
        backgroundColor: appTheme.bgLight,
        appBar: CommonAppBar(title: fonts.bags),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                HorizontalTravelerCount(
                    selectedIndex: bags.selectedUserIndex,
                    onTap: (index) => bags.selectUser(index),
                    totalTravelers: flight.totalTravelers),
                const VSpace(12),
                Column(
                  children: [
                    FarePriceDetailCard(data: appArray.selectedFare),
                    const VSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          SvgPicture.asset(svgAssets.bag),
                          const HSpace(5),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(fonts.additionalCarryBags,
                                    style: AppCss.figtreeSemiBold14
                                        .textColor(appTheme.black)),
                                Text("\$100/bag",
                                    style: AppCss.figtreeRegular12
                                        .textColor(appTheme.greyText))
                              ])
                        ]),
                        MinusPlusTotalLayout(
                          minusTap: () => bags.totalBagsLuggageMinus(context),
                          plusTap: () => bags.totalBagsLuggagePlus(context),
                          total: flight.userListData[bags.selectedUserIndex]
                          ['totalBags'],
                          isColor: flight.userListData[bags.selectedUserIndex]
                          ['totalBags'] >
                              0,
                        ).paddingOnly(
                            right: flight.userListData[bags.selectedUserIndex]
                            ['totalBags'] >
                                0
                                ? 18
                                : 0)
                      ],
                    ).commonBoxDecoration(),
                    const VSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          SvgPicture.asset(svgAssets.suitcase),
                          const HSpace(5),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(fonts.additionalCheckedBags,
                                    style: AppCss.figtreeSB14
                                        .textColor(appTheme.black)),
                                Text("\$125/bag",
                                    style: AppCss.figtreeRegular12
                                        .textColor(appTheme.greyText))
                              ])
                        ]),
                        MinusPlusTotalLayout(
                            minusTap: () => bags.totalBagsLuggageMinus(
                                context,
                                isBags: false),
                            plusTap: () => bags.totalBagsLuggagePlus(
                                context,
                                isBags: false),
                            total: flight
                                .userListData[bags.selectedUserIndex]
                            ['totalLuggage'],
                            isColor:
                            flight.userListData[bags.selectedUserIndex]
                            ['totalLuggage'] >
                                0)
                            .paddingOnly(
                            right:
                            flight.userListData[bags.selectedUserIndex]
                            ['totalLuggage'] >
                                0
                                ? 18
                                : 0)
                      ],
                    ).commonBoxDecoration()
                  ],
                ).paddingSymmetric(horizontal: 12)
              ],
            ),
            CommonBottomPriceLayout(
              onTap: () => context.pushNamed(routeName.travelerInfo),
              text: fonts.skipAddBags,
              buttonText: fonts.next,
            )
          ],
        ).height(double.infinity));*/
    return Container();
  }
}
