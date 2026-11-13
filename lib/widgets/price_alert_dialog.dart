import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/price_alert_service.dart';

class PriceAlertDialog extends StatefulWidget {
  final Product product;

  const PriceAlertDialog({super.key, required this.product});

  static Future<void> show(BuildContext context, Product product) {
    return showDialog(
      context: context,
      builder: (_) => PriceAlertDialog(product: product),
    );
  }

  @override
  State<PriceAlertDialog> createState() => _PriceAlertDialogState();
}

class _PriceAlertDialogState extends State<PriceAlertDialog> {
  late double _targetPrice;

  @override
  void initState() {
    super.initState();
    // Default to 10% lower than current lowest
    _targetPrice = (widget.product.lowestPrice * 0.90).roundToDouble();
  }

  void _setPercentOff(double percent) {
    setState(() {
      _targetPrice =
          (widget.product.lowestPrice * (1.0 - (percent / 100))).roundToDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentLowest = widget.product.lowestPrice;
    final minSlider = (currentLowest * 0.5).roundToDouble();
    final maxSlider = currentLowest;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Row(
        children: [
          const Icon(Icons.notifications_active_outlined, color: Colors.deepPurple),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              'Set Price Alert',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.product.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              'Current best: ₹${currentLowest.toStringAsFixed(0)}',
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 16),
            const Text(
              'Notify me when price drops to:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '₹${_targetPrice.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Quick preset chips
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPresetChip('5% Drop', 5),
                _buildPresetChip('10% Drop', 10),
                _buildPresetChip('15% Drop', 15),
              ],
            ),
            const SizedBox(height: 12),
            Slider(
              value: _targetPrice.clamp(minSlider, maxSlider),
              min: minSlider,
              max: maxSlider,
              divisions: 20,
              label: '₹${_targetPrice.toStringAsFixed(0)}',
              onChanged: (val) {
                setState(() {
                  _targetPrice = val.roundToDouble();
                });
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            PriceAlertService().addAlert(
              product: widget.product,
              targetPrice: _targetPrice,
            );
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Price drop alert set for ₹${_targetPrice.toStringAsFixed(0)}!',
                ),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
          child: const Text('Create Alert'),
        ),
      ],
    );
  }

  Widget _buildPresetChip(String label, double percent) {
    final target =
        (widget.product.lowestPrice * (1.0 - (percent / 100))).roundToDouble();
    final isSelected = (_targetPrice - target).abs() < 2;

    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => _setPercentOff(percent),
      selectedColor: Colors.deepPurple.shade100,
      labelStyle: TextStyle(
        fontSize: 11,
        color: isSelected ? Colors.deepPurple : Colors.black87,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
