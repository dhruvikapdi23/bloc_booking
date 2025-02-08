import 'package:bloc_booking/common_path.dart';


class SocialLoginButton extends StatelessWidget {
  final String? title,svg;
  final GestureTapCallback? onTap;
  const SocialLoginButton({super.key,  this.title,  this.svg, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(color: appTheme.textBoxBorderGrey),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            SvgPicture.asset(svg!),
             Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title!,style: AppCss.figtreeRegular14.copyWith(color: appTheme.secondary),),
                ],
              ),
            )
          ],
        )).inkWell(onTap: onTap);
  }
}
