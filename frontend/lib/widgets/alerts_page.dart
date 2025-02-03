import 'package:flutter/material.dart';

class AlertsPage extends StatelessWidget {
  final bool alertSMS;
  final bool alertEmail;
  final Function(bool) onSMSChanged;
  final Function(bool) onEmailChanged;
  final TextEditingController smsController;
  final TextEditingController emailController;

  const AlertsPage({super.key, 
    required this.alertSMS,
    required this.alertEmail,
    required this.onSMSChanged,
    required this.onEmailChanged,
    required this.smsController,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Alerts', style: Theme.of(context).textTheme.titleLarge),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Alert via SMS'),
            Switch(
              value: alertSMS,
              onChanged: onSMSChanged,
              activeColor: Colors.teal,
              inactiveTrackColor: Colors.grey,
            ),
          ],
        ),
        if (alertSMS) ...[
          const SizedBox(height: 10),
          TextField(
            controller: smsController,
            decoration: const InputDecoration(
              labelText: 'SMS Number',
            ),
            keyboardType: TextInputType.phone,
          ),
        ],
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Alert via Email'),
            Switch(
              value: alertEmail,
              onChanged: onEmailChanged,
              activeColor: Colors.teal,
              inactiveTrackColor: Colors.grey,
            ),
          ],
        ),
        if (alertEmail) ...[
          const SizedBox(height: 10),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email Address',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ],
    );
  }
}
