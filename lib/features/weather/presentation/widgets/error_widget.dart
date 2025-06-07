import 'package:flutter/material.dart';
import '../../../../core/errors/failures.dart';

class WeatherErrorWidget extends StatelessWidget {
  final Failure error;
  final VoidCallback? onRetry;

  const WeatherErrorWidget({super.key, required this.error, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Card(
        color: Colors.red[50],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(_getErrorIcon(), color: Colors.red[700], size: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Error',
                          style: Theme.of(
                            context,
                          ).textTheme.titleSmall?.copyWith(
                            color: Colors.red[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          error.userMessage,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: Colors.red[600]),
                        ),
                      ],
                    ),
                  ),
                  if (onRetry != null)
                    TextButton(
                      onPressed: onRetry,
                      child: const Text('Reintentar'),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getErrorIcon() {
    return error.when(
      server: (message, code) => Icons.cloud_off,
      network: (message) => Icons.wifi_off,
      location: (message) => Icons.location_off,
      permission: (message) => Icons.security,
      cache: (message) => Icons.storage,
      unknown: (message) => Icons.error,
    );
  }
}
