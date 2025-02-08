
import '../../../common_path.dart';
import '../../../core/enums/common_enums.dart';

class HighlightPainter extends CustomPainter {
  HighlightPainter(
      {required this.color,
        this.style = HighlightPainterStyle.none,
        this.textDirection,
        required this.date});

  final Color color;
  final HighlightPainterStyle style;
  final TextDirection? textDirection;
  final DateTime date;

  @override
  void paint(Canvas canvas, Size size) {
    if (style == HighlightPainterStyle.none) {
      return;
    }

    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final bool rtl = switch (textDirection) {
      TextDirection.rtl || null => true,
      TextDirection.ltr => false,
    // TODO: Handle this case.
    };

    switch (style) {
      case HighlightPainterStyle.highlightLeading when rtl:
      case HighlightPainterStyle.highlightTrailing when !rtl:
        canvas.drawRect(
            Rect.fromLTWH(size.width / 2, 0, size.width / 2, size.height),
            paint);
      case HighlightPainterStyle.highlightLeading:
      case HighlightPainterStyle.highlightTrailing:
        canvas.drawRect(
            Rect.fromLTWH(0, 0, size.width / 2, size.height), paint);
      case HighlightPainterStyle.highlightAll:
        canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
      case HighlightPainterStyle.none:
        break;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}