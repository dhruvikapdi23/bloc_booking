
import '../../../../common_path.dart';


class MyFlightTabButton extends StatelessWidget {
  final String text;
  final bool selected;
  final GestureTapCallback onTap;

  const MyFlightTabButton(
      {super.key,
      required this.text,
      required this.selected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 9),
            margin: const EdgeInsets.only(right: 8, bottom: 8),
            decoration: BoxDecoration(
                color: selected ? appTheme.primary.withValues(alpha:0.1) : null,
                borderRadius:
                    const BorderRadius.all(Radius.circular(8)),
                border: Border.all(
                    color: selected
                        ? appTheme.primary
                        : appTheme.textBoxBorderGrey)),
            child: Text(text,
                style: AppCss.figtreeRegular12.textColor(
                    selected ? appTheme.primary : appTheme.secondary)))
        .inkWell(onTap: onTap);
  }
}
