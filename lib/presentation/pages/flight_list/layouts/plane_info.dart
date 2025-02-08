

import '../../../../common_path.dart';

class PlaneInfo extends StatelessWidget {
  final String? icon, text;

  const PlaneInfo({super.key, this.icon, this.text,});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(icon!, height: 16),
        const HSpace(4),
        Text(text!, style: AppCss.figtreeRegular12.textColor(appTheme.greyText))
      ],
    );
  }
}
