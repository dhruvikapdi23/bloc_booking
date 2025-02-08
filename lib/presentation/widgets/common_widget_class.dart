import 'package:flutter/cupertino.dart';

class CommonWidgetClass{

  Widget commonBg(context,color) => Container(
      color: color,
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height);
}