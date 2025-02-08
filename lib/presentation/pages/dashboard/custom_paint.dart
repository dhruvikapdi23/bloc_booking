
import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffF8FAFC).withValues(alpha:1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.001461988, size.height * 0.002840909,
                size.width * 0.9970760, size.height * 0.9943182),
            bottomRight: Radius.circular(size.width * 0.02192982),
            bottomLeft: Radius.circular(size.width * 0.02192982),
            topLeft: Radius.circular(size.width * 0.02192982),
            topRight: Radius.circular(size.width * 0.02192982)),
        paint0Fill);

    Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint1Stroke.color = const Color(0xffF1F5F9).withValues(alpha:1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.001461988, size.height * 0.002840909,
                size.width * 0.9970760, size.height * 0.9943182),
            bottomRight: Radius.circular(size.width * 0.02192982),
            bottomLeft: Radius.circular(size.width * 0.02192982),
            topLeft: Radius.circular(size.width * 0.02192982),
            topRight: Radius.circular(size.width * 0.02192982)),
        paint1Stroke);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xff000000).withValues(alpha:1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.001461988, size.height * 0.002840909,
                size.width * 0.9970760, size.height * 0.9943182),
            bottomRight: Radius.circular(size.width * 0.02192982),
            bottomLeft: Radius.circular(size.width * 0.02192982),
            topLeft: Radius.circular(size.width * 0.02192982),
            topRight: Radius.circular(size.width * 0.02192982)),
        paint1Fill);

    Paint paint2Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint2Stroke.color = const Color(0xffF1F5F9).withValues(alpha:1.0);
    canvas.drawCircle(Offset(size.width * 0.8625731, size.height),
        size.width * 0.02192982, paint2Stroke);

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = Colors.white.withValues(alpha:1.0);
    canvas.drawCircle(Offset(size.width * 0.8625731, size.height),
        size.width * 0.02192982, paint2Fill);

    Paint paint3Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint3Stroke.color = const Color(0xffCBD5E1).withValues(alpha:1.0);
    canvas.drawLine(
        Offset(size.width * 0.8611111, size.height * 0.9090909),
        Offset(size.width * 0.8611111, size.height * 0.09090909),
        paint3Stroke);

    Paint paint4Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint4Stroke.color = const Color(0xffF1F5F9).withValues(alpha:1.0);
    canvas.drawCircle(Offset(size.width * 0.8625731, size.height * 0),
        size.width * 0.02192982, paint4Stroke);

    Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = Colors.white.withValues(alpha:1.0);
    canvas.drawCircle(Offset(size.width * 0.8625731, size.height * 0),
        size.width * 0.02192982, paint4Fill);

    Path path_5 = Path();
    path_5.moveTo(326, 153.313);
    path_5.lineTo(314.8, 153.313);
    path_5.lineTo(314.8, 146.353);
    path_5.lineTo(316.496, 146.353);
    path_5.lineTo(316.496, 151.457);
    path_5.lineTo(319.632, 151.457);
    path_5.lineTo(319.632, 147.089);
    path_5.lineTo(321.328, 147.089);
    path_5.lineTo(321.328, 151.457);
    path_5.lineTo(326, 151.457);
    path_5.lineTo(326, 153.313);
    path_5.close();
    path_5.moveTo(326, 144.516);
    path_5.lineTo(314.8, 144.516);
    path_5.lineTo(314.8, 140.564);
    path_5.cubicTo(314.8, 139.796, 314.949, 139.118, 315.248, 138.532);
    path_5.cubicTo(315.547, 137.945, 315.963, 137.486, 316.496, 137.156);
    path_5.cubicTo(317.019, 136.825, 317.627, 136.66, 318.32, 136.66);
    path_5.cubicTo(319.013, 136.66, 319.627, 136.836, 320.16, 137.188);
    path_5.cubicTo(320.693, 137.529, 321.115, 138.004, 321.424, 138.612);
    path_5.cubicTo(321.723, 139.22, 321.872, 139.908, 321.872, 140.676);
    path_5.lineTo(321.872, 142.66);
    path_5.lineTo(326, 142.66);
    path_5.lineTo(326, 144.516);
    path_5.close();
    path_5.moveTo(326, 138.308);
    path_5.lineTo(321.456, 140.932);
    path_5.lineTo(320.464, 139.492);
    path_5.lineTo(326, 136.212);
    path_5.lineTo(326, 138.308);
    path_5.close();
    path_5.moveTo(320.16, 142.66);
    path_5.lineTo(320.16, 140.484);
    path_5.cubicTo(320.16, 140.121, 320.08, 139.801, 319.92, 139.524);
    path_5.cubicTo(319.76, 139.236, 319.541, 139.006, 319.264, 138.836);
    path_5.cubicTo(318.987, 138.654, 318.672, 138.564, 318.32, 138.564);
    path_5.cubicTo(317.787, 138.564, 317.349, 138.756, 317.008, 139.14);
    path_5.cubicTo(316.667, 139.524, 316.496, 140.02, 316.496, 140.628);
    path_5.lineTo(316.496, 142.66);
    path_5.lineTo(320.16, 142.66);
    path_5.close();
    path_5.moveTo(326, 134.328);
    path_5.lineTo(314.8, 134.328);
    path_5.lineTo(314.8, 127.432);
    path_5.lineTo(316.496, 127.432);
    path_5.lineTo(316.496, 132.472);
    path_5.lineTo(319.472, 132.472);
    path_5.lineTo(319.472, 128.024);
    path_5.lineTo(321.136, 128.024);
    path_5.lineTo(321.136, 132.472);
    path_5.lineTo(324.304, 132.472);
    path_5.lineTo(324.304, 127.384);
    path_5.lineTo(326, 127.384);
    path_5.lineTo(326, 134.328);
    path_5.close();
    path_5.moveTo(326, 124.891);
    path_5.lineTo(314.8, 124.891);
    path_5.lineTo(314.8, 117.995);
    path_5.lineTo(316.496, 117.995);
    path_5.lineTo(316.496, 123.035);
    path_5.lineTo(319.472, 123.035);
    path_5.lineTo(319.472, 118.587);
    path_5.lineTo(321.136, 118.587);
    path_5.lineTo(321.136, 123.035);
    path_5.lineTo(324.304, 123.035);
    path_5.lineTo(324.304, 117.947);
    path_5.lineTo(326, 117.947);
    path_5.lineTo(326, 124.891);
    path_5.close();
    path_5.moveTo(326.192, 106.618);
    path_5.cubicTo(326.192, 107.727, 325.947, 108.709, 325.456, 109.562);
    path_5.cubicTo(324.965, 110.415, 324.283, 111.087, 323.408, 111.578);
    path_5.cubicTo(322.533, 112.058, 321.531, 112.298, 320.4, 112.298);
    path_5.cubicTo(319.269, 112.298, 318.272, 112.058, 317.408, 111.578);
    path_5.cubicTo(316.533, 111.087, 315.851, 110.421, 315.36, 109.578);
    path_5.cubicTo(314.859, 108.735, 314.608, 107.765, 314.608, 106.666);
    path_5.cubicTo(314.608, 105.557, 314.859, 104.581, 315.36, 103.738);
    path_5.cubicTo(315.851, 102.885, 316.533, 102.223, 317.408, 101.754);
    path_5.cubicTo(318.272, 101.274, 319.269, 101.034, 320.4, 101.034);
    path_5.cubicTo(321.531, 101.034, 322.533, 101.274, 323.408, 101.754);
    path_5.cubicTo(324.283, 102.223, 324.965, 102.879, 325.456, 103.722);
    path_5.cubicTo(325.947, 104.554, 326.192, 105.519, 326.192, 106.618);
    path_5.close();
    path_5.moveTo(324.496, 106.618);
    path_5.cubicTo(324.496, 105.893, 324.32, 105.253, 323.968, 104.698);
    path_5.cubicTo(323.616, 104.143, 323.136, 103.711, 322.528, 103.402);
    path_5.cubicTo(321.909, 103.082, 321.2, 102.922, 320.4, 102.922);
    path_5.cubicTo(319.611, 102.922, 318.907, 103.082, 318.288, 103.402);
    path_5.cubicTo(317.669, 103.722, 317.189, 104.165, 316.848, 104.73);
    path_5.cubicTo(316.496, 105.285, 316.32, 105.93, 316.32, 106.666);
    path_5.cubicTo(316.32, 107.391, 316.496, 108.037, 316.848, 108.602);
    path_5.cubicTo(317.189, 109.157, 317.669, 109.599, 318.288, 109.93);
    path_5.cubicTo(318.896, 110.25, 319.6, 110.41, 320.4, 110.41);
    path_5.cubicTo(321.2, 110.41, 321.909, 110.25, 322.528, 109.93);
    path_5.cubicTo(323.136, 109.599, 323.616, 109.151, 323.968, 108.586);
    path_5.cubicTo(324.32, 108.01, 324.496, 107.354, 324.496, 106.618);
    path_5.close();
    path_5.moveTo(326, 99.0626);
    path_5.lineTo(314.8, 99.0626);
    path_5.lineTo(314.8, 92.1026);
    path_5.lineTo(316.496, 92.1026);
    path_5.lineTo(316.496, 97.2066);
    path_5.lineTo(319.632, 97.2066);
    path_5.lineTo(319.632, 92.8386);
    path_5.lineTo(321.328, 92.8386);
    path_5.lineTo(321.328, 97.2066);
    path_5.lineTo(326, 97.2066);
    path_5.lineTo(326, 99.0626);
    path_5.close();
    path_5.moveTo(326.192, 81.5584);
    path_5.cubicTo(326.192, 82.6357, 325.947, 83.5957, 325.456, 84.4384);
    path_5.cubicTo(324.955, 85.2704, 324.272, 85.9264, 323.408, 86.4064);
    path_5.cubicTo(322.533, 86.8757, 321.531, 87.1104, 320.4, 87.1104);
    path_5.cubicTo(319.269, 87.1104, 318.272, 86.8757, 317.408, 86.4064);
    path_5.cubicTo(316.533, 85.9264, 315.851, 85.2704, 315.36, 84.4384);
    path_5.cubicTo(314.859, 83.6064, 314.608, 82.6517, 314.608, 81.5744);
    path_5.cubicTo(314.608, 80.849, 314.741, 80.1664, 315.008, 79.5264);
    path_5.cubicTo(315.264, 78.8864, 315.621, 78.321, 316.08, 77.8304);
    path_5.cubicTo(316.539, 77.329, 317.072, 76.945, 317.68, 76.6784);
    path_5.lineTo(318.368, 78.3744);
    path_5.cubicTo(317.963, 78.5664, 317.605, 78.8277, 317.296, 79.1584);
    path_5.cubicTo(316.976, 79.4784, 316.731, 79.8464, 316.56, 80.2624);
    path_5.cubicTo(316.389, 80.6784, 316.304, 81.1157, 316.304, 81.5744);
    path_5.cubicTo(316.304, 82.2784, 316.48, 82.9077, 316.832, 83.4624);
    path_5.cubicTo(317.184, 84.0064, 317.669, 84.4384, 318.288, 84.7584);
    path_5.cubicTo(318.896, 85.0677, 319.6, 85.2224, 320.4, 85.2224);
    path_5.cubicTo(321.2, 85.2224, 321.909, 85.0677, 322.528, 84.7584);
    path_5.cubicTo(323.147, 84.4384, 323.632, 84.001, 323.984, 83.4464);
    path_5.cubicTo(324.336, 82.881, 324.512, 82.241, 324.512, 81.5264);
    path_5.cubicTo(324.512, 81.057, 324.421, 80.6197, 324.24, 80.2144);
    path_5.cubicTo(324.048, 79.7984, 323.787, 79.4304, 323.456, 79.1104);
    path_5.cubicTo(323.125, 78.7797, 322.741, 78.5184, 322.304, 78.3264);
    path_5.lineTo(322.992, 76.6304);
    path_5.cubicTo(323.621, 76.897, 324.181, 77.2757, 324.672, 77.7664);
    path_5.cubicTo(325.152, 78.257, 325.525, 78.8277, 325.792, 79.4784);
    path_5.cubicTo(326.059, 80.129, 326.192, 80.8224, 326.192, 81.5584);
    path_5.close();
    path_5.moveTo(326, 67.3559);
    path_5.lineTo(314.8, 67.3559);
    path_5.lineTo(314.8, 65.4999);
    path_5.lineTo(326, 65.4999);
    path_5.lineTo(326, 67.3559);
    path_5.close();
    path_5.moveTo(326, 74.8439);
    path_5.lineTo(314.8, 74.8439);
    path_5.lineTo(314.8, 72.9879);
    path_5.lineTo(326, 72.9879);
    path_5.lineTo(326, 74.8439);
    path_5.close();
    path_5.moveTo(321.104, 73.3879);
    path_5.lineTo(319.408, 73.3879);
    path_5.lineTo(319.408, 66.6039);
    path_5.lineTo(321.104, 66.6039);
    path_5.lineTo(321.104, 73.3879);
    path_5.close();
    path_5.moveTo(326, 55.0839);
    path_5.lineTo(314.8, 59.4519);
    path_5.lineTo(314.8, 57.5959);
    path_5.lineTo(326, 53.1159);
    path_5.lineTo(326, 55.0839);
    path_5.close();
    path_5.moveTo(326, 64.0279);
    path_5.lineTo(314.8, 59.5639);
    path_5.lineTo(314.8, 57.6919);
    path_5.lineTo(326, 62.0599);
    path_5.lineTo(326, 64.0279);
    path_5.close();
    path_5.moveTo(323.248, 61.9319);
    path_5.lineTo(321.6, 61.9319);
    path_5.lineTo(321.6, 55.2279);
    path_5.lineTo(323.248, 55.2279);
    path_5.lineTo(323.248, 61.9319);
    path_5.close();
    path_5.moveTo(326, 51.6564);
    path_5.lineTo(314.8, 51.6564);
    path_5.lineTo(314.8, 47.7044);
    path_5.cubicTo(314.8, 46.9364, 314.949, 46.259, 315.248, 45.6724);
    path_5.cubicTo(315.547, 45.0857, 315.963, 44.627, 316.496, 44.2964);
    path_5.cubicTo(317.019, 43.9657, 317.627, 43.8004, 318.32, 43.8004);
    path_5.cubicTo(319.013, 43.8004, 319.627, 43.9764, 320.16, 44.3284);
    path_5.cubicTo(320.693, 44.6697, 321.115, 45.1444, 321.424, 45.7524);
    path_5.cubicTo(321.723, 46.3604, 321.872, 47.0484, 321.872, 47.8164);
    path_5.lineTo(321.872, 49.8004);
    path_5.lineTo(326, 49.8004);
    path_5.lineTo(326, 51.6564);
    path_5.close();
    path_5.moveTo(326, 45.4484);
    path_5.lineTo(321.456, 48.0724);
    path_5.lineTo(320.464, 46.6324);
    path_5.lineTo(326, 43.3524);
    path_5.lineTo(326, 45.4484);
    path_5.close();
    path_5.moveTo(320.16, 49.8004);
    path_5.lineTo(320.16, 47.6244);
    path_5.cubicTo(320.16, 47.2617, 320.08, 46.9417, 319.92, 46.6644);
    path_5.cubicTo(319.76, 46.3764, 319.541, 46.147, 319.264, 45.9764);
    path_5.cubicTo(318.987, 45.795, 318.672, 45.7044, 318.32, 45.7044);
    path_5.cubicTo(317.787, 45.7044, 317.349, 45.8964, 317.008, 46.2804);
    path_5.cubicTo(316.667, 46.6644, 316.496, 47.1604, 316.496, 47.7684);
    path_5.lineTo(316.496, 49.8004);
    path_5.lineTo(320.16, 49.8004);
    path_5.close();
    path_5.moveTo(326.192, 36.3329);
    path_5.cubicTo(326.192, 37.4635, 325.947, 38.4715, 325.456, 39.3569);
    path_5.cubicTo(324.955, 40.2315, 324.272, 40.9195, 323.408, 41.4209);
    path_5.cubicTo(322.533, 41.9222, 321.536, 42.1729, 320.416, 42.1729);
    path_5.cubicTo(319.275, 42.1729, 318.272, 41.9222, 317.408, 41.4209);
    path_5.cubicTo(316.533, 40.9195, 315.851, 40.2315, 315.36, 39.3569);
    path_5.cubicTo(314.859, 38.4715, 314.608, 37.4635, 314.608, 36.3329);
    path_5.cubicTo(314.608, 35.6822, 314.709, 35.0742, 314.912, 34.5089);
    path_5.cubicTo(315.115, 33.9329, 315.392, 33.4155, 315.744, 32.9569);
    path_5.cubicTo(316.085, 32.4982, 316.485, 32.1249, 316.944, 31.8369);
    path_5.lineTo(317.904, 33.3409);
    path_5.cubicTo(317.595, 33.5435, 317.317, 33.8049, 317.072, 34.1249);
    path_5.cubicTo(316.827, 34.4449, 316.64, 34.7969, 316.512, 35.1809);
    path_5.cubicTo(316.373, 35.5542, 316.304, 35.9382, 316.304, 36.3329);
    path_5.cubicTo(316.304, 37.1009, 316.48, 37.7835, 316.832, 38.3809);
    path_5.cubicTo(317.184, 38.9675, 317.669, 39.4315, 318.288, 39.7729);
    path_5.cubicTo(318.896, 40.1142, 319.605, 40.2849, 320.416, 40.2849);
    path_5.cubicTo(321.205, 40.2849, 321.909, 40.1195, 322.528, 39.7889);
    path_5.cubicTo(323.147, 39.4475, 323.632, 38.9782, 323.984, 38.3809);
    path_5.cubicTo(324.336, 37.7729, 324.512, 37.0742, 324.512, 36.2849);
    path_5.cubicTo(324.512, 35.6662, 324.384, 35.1115, 324.128, 34.6209);
    path_5.cubicTo(323.872, 34.1302, 323.515, 33.7462, 323.056, 33.4689);
    path_5.cubicTo(322.597, 33.1809, 322.069, 33.0369, 321.472, 33.0369);
    path_5.lineTo(321.248, 31.2609);
    path_5.cubicTo(322.261, 31.2609, 323.141, 31.4795, 323.888, 31.9169);
    path_5.cubicTo(324.624, 32.3435, 325.195, 32.9409, 325.6, 33.7089);
    path_5.cubicTo(325.995, 34.4662, 326.192, 35.3409, 326.192, 36.3329);
    path_5.close();
    path_5.moveTo(321.616, 35.7249);
    path_5.lineTo(320.112, 35.7249);
    path_5.lineTo(320.112, 31.2609);
    path_5.lineTo(321.36, 31.2609);
    path_5.lineTo(321.616, 32.2529);
    path_5.lineTo(321.616, 35.7249);
    path_5.close();
    path_5.moveTo(326, 29.4689);
    path_5.lineTo(314.8, 29.4689);
    path_5.lineTo(314.8, 22.5729);
    path_5.lineTo(316.496, 22.5729);
    path_5.lineTo(316.496, 27.6129);
    path_5.lineTo(319.472, 27.6129);
    path_5.lineTo(319.472, 23.1649);
    path_5.lineTo(321.136, 23.1649);
    path_5.lineTo(321.136, 27.6129);
    path_5.lineTo(324.304, 27.6129);
    path_5.lineTo(324.304, 22.5249);
    path_5.lineTo(326, 22.5249);
    path_5.lineTo(326, 29.4689);
    path_5.close();

    Paint paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.color = const Color(0xff64758B).withValues(alpha:1.0);
    canvas.drawPath(path_5, paint5Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
