
import '../../../../common_path.dart';



class CustomFlutterSliderHandler{

  FlutterSliderHandler flutterSliderHandler =FlutterSliderHandler(

      decoration: BoxDecoration(color: appTheme.trans),
      child: Container(
        height: 12,
        width: 12,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: appTheme.white),
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: appTheme.primary,
              boxShadow: [
                BoxShadow(
                    color: appTheme.secondary
                        .withValues(alpha:.10),
                    offset: const Offset(0, 0),
                    blurStyle: BlurStyle.outer,
                    spreadRadius: 6,
                    blurRadius: 6)
              ]),
        ),
      ).paddingOnly(bottom: 1));
}

/*

class CustomFlutterSliderHandler extends StatelessWidget {
  const CustomFlutterSliderHandler({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSliderHandler(
        decoration: BoxDecoration(color: appTheme.trans),
        child: Container(
          height: 12,
          width: 12,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: appTheme.white),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: appTheme.primary,
                boxShadow: [
                  BoxShadow(
                      color: appTheme.secondary
                          .withValues(alpha:.10),
                      offset: Offset(0, 0),
                      blurStyle: BlurStyle.outer,
                      spreadRadius: 6,
                      blurRadius: 6)
                ]),
          ),
        ).paddingOnly(bottom: 1));
  }
}
*/
