import 'package:flutter/material.dart';
import '../services/price_alert_service.dart';
import '../widgets/empty_state_view.dart';

class PriceAlertsPage extends StatelessWidget {
  const PriceAlertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final alertService = PriceAlertService();

    return AnimatedBuilder(
      animation: alertService,
      builder: (context, _) {
        final alerts = alertService.alerts;

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Price Drop Alerts',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: alerts.isEmpty
              ? EmptyStateView(
                  icon: Icons.notifications_none_rounded,
                  title: 'No Active Alerts',
                  message:
                      'Set target prices on any product to receive instant alerts when a store drops their price.',
                  buttonText: 'Find Products',
                  onButtonPressed: () => Navigator.pop(context),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: alerts.length,
                  itemBuilder: (context, index) {
                    final alert = alerts[index];

                    return Card(
                      margin: const EdgeInsets.only(bottom: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    color: Colors.grey.shade100,
                                    child: Image.network(
                                      alert.productImageUrl,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) => const Icon(
                                        Icons.image_outlined,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        alert.productName,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Current: ₹${alert.currentLowestPrice.toStringAsFixed(0)}',
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Switch(
                                  value: alert.isEnabled,
                                  onChanged: (_) =>
                                      alertService.toggleAlert(alert.id),
                                  activeColor: Colors.deepPurple,
                                ),
                              ],
                            ),
                            const Divider(height: 24),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.track_changes_rounded,
                                      size: 18,
                                      color: Colors.deepPurple,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      'Target: ₹${alert.targetPrice.toStringAsFixed(0)}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                  ],
                                ),
                                if (alert.isTriggered)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.green.shade50,
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                        color: Colors.green.shade300,
                                      ),
                                    ),
                                    child: const Text(
                                      'TRIGGERED',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                                  )
                                else
                                  Text(
                                    'Needs ₹${alert.dropRequired.toStringAsFixed(0)} drop',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () =>
                                      alertService.removeAlert(alert.id),
                                  tooltip: 'Delete Alert',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
