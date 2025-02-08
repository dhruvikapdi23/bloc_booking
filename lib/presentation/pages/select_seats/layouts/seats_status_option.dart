
import '../../../../common_path.dart';

class SeatsStatusOption extends StatelessWidget {
  const SeatsStatusOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List<Widget>.generate(
        appArray.seatStatusOption.length,
            (int index) {
          dynamic data = appArray.seatStatusOption[index];
          return Row(
            children: [
              Container(
                  height: 16,
                  width: 16,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: data['color'],
                      border: Border.all(
                          color: data['borderColor'] ?? data['color']))),
              const HSpace(8),
              Text(data['title'],
                  style: AppCss.figtreeRegular14
                      .textColor(appTheme.black))
            ],
          );
        },
      ),
    )
        .width(MediaQuery.of(context).size.width)
        .padding(horizontal: 24);
  }
}
