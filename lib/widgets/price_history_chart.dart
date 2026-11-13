import 'package:flutter/material.dart';
import '../models/price_history.dart';

class PriceHistoryChart extends StatelessWidget {
  final List<PriceHistoryPoint> history;
  final double currentPrice;

  const PriceHistoryChart({
    super.key,
    required this.history,
    required this.currentPrice,
  });

  @override
  Widget build(BuildContext context) {
    if (history.isEmpty) {
      return Container(
        height: 180,
        alignment: Alignment.center,
        child: const Text('No price history available yet'),
      );
    }

    final prices = history.map((e) => e.price).toList();
    final minPrice = prices.reduce((a, b) => a < b ? a : b);
    final maxPrice = prices.reduce((a, b) => a > b ? a : b);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Lowest Recorded',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  '₹${minPrice.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Highest Recorded',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  '₹${maxPrice.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 160,
          width: double.infinity,
          child: CustomPaint(
            painter: _ChartPainter(
              history: history,
              minPrice: minPrice,
              maxPrice: maxPrice,
              lineColor: Colors.deepPurple,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _formatDate(history.first.date),
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
            Text(
              _formatDate(history.last.date),
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  String _formatDate(DateTime dt) {
    return '${dt.day}/${dt.month}/${dt.year}';
  }
}

class _ChartPainter extends CustomPainter {
  final List<PriceHistoryPoint> history;
  final double minPrice;
  final double maxPrice;
  final Color lineColor;

  _ChartPainter({
    required this.history,
    required this.minPrice,
    required this.maxPrice,
    required this.lineColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final range = maxPrice - minPrice;
    final effectiveRange = range == 0 ? 1.0 : range;

    final paintLine = Paint()
      ..color = lineColor
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final paintFill = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          lineColor.withAlpha(70),
          lineColor.withAlpha(5),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final paintPoint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.fill;

    final paintPointInner = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    final fillPath = Path();

    final stepX = history.length > 1 ? size.width / (history.length - 1) : 0.0;
    final points = <Offset>[];

    for (int i = 0; i < history.length; i++) {
      final x = stepX * i;
      final normalizedY = (history[i].price - minPrice) / effectiveRange;
      final y = size.height - (normalizedY * (size.height - 24)) - 12;
      points.add(Offset(x, y));

      if (i == 0) {
        path.moveTo(x, y);
        fillPath.moveTo(x, size.height);
        fillPath.lineTo(x, y);
      } else {
        path.lineTo(x, y);
        fillPath.lineTo(x, y);
      }
    }

    fillPath.lineTo(size.width, size.height);
    fillPath.close();

    canvas.drawPath(fillPath, paintFill);
    canvas.drawPath(path, paintLine);

    for (final pt in points) {
      canvas.drawCircle(pt, 5, paintLine);
      canvas.drawCircle(pt, 5, paintPoint);
      canvas.drawCircle(pt, 2.5, paintPointInner);
    }
  }

  @override
  bool shouldRepaint(covariant _ChartPainter oldDelegate) {
    return oldDelegate.history != history;
  }
}
