import 'package:bloc_booking/common_path.dart';

import '../../bloc/notification.dart';

class NotificationPermission extends StatefulWidget {
  const NotificationPermission({super.key});

  @override
  State<NotificationPermission> createState() => _NotificationPermissionState();
}

class _NotificationPermissionState extends State<NotificationPermission> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            leading: SvgPicture.asset(
          svgAssets.cancel,
          fit: BoxFit.scaleDown,
        )),
        body: Stack(children: [
          ListView(children: [
            const VSpace(72),
            Image.asset(imageAssets.notificationPermission),
            const VSpace(16),
            Text(fonts.stayUpdated,
                    style: AppCss.figtreeBold24.copyWith(color: appTheme.black))
                .alignment(Alignment.center),
            const VSpace(16),
            Text(
                "Yorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.",
                textAlign: TextAlign.center,
                style:
                    AppCss.figtreeRegular12.copyWith(color: appTheme.greyText))
          ]).paddingSymmetric(horizontal: 24),
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            CustomButton(
              text: fonts.allowNotification,
              onTap: () =>
                  CustomNotificationController(). requestPermissions(context),
            ),
            const VSpace(16),
            Text(fonts.notNow,
                style: AppCss.figtreeRegular12
                    .copyWith(color: appTheme.secondary)
                    .textDecoration(TextDecoration.underline)),
            const VSpace(50)
          ]).paddingSymmetric(horizontal: 24)
        ]).height(MediaQuery.of(context).size.height));
  }
}
