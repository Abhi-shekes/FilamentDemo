import 'package:flutter/material.dart';
import 'detection_type_page.dart';
import 'alerts_page.dart';

class ConfigPanel extends StatefulWidget {
  const ConfigPanel({super.key});

  @override
  _ConfigPanelState createState() => _ConfigPanelState();
}

class _ConfigPanelState extends State<ConfigPanel> {
  String selectedSource = 'webcam'; // 'webcam' or 'url'
  String selectedDetection = 'intrusion'; // 'intrusion' or 'PPE'
  bool alertSMS = false;
  bool alertEmail = false;
  TextEditingController urlController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController smsController = TextEditingController();
  bool isPlaying = false; // To track if the analysis is started

  // Function to handle Start button
  void startAnalysis() {
    setState(() {
      isPlaying = true;
    });
    // Add your logic to start video analysis
    print("Analysis started");
  }

  // Function to handle Stop button
  void stopAnalysis() {
    setState(() {
      isPlaying = false;
    });
    // Add your logic to stop video analysis
    print("Analysis stopped");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Source', style: Theme.of(context).textTheme.titleLarge),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('URL'),
              Switch(
                value: selectedSource == 'webcam',
                onChanged: (value) {
                  setState(() {
                    selectedSource = value ? 'webcam' : 'url';
                  });
                },
                activeColor: Colors.teal,
                inactiveTrackColor: Colors.grey,
              ),
              const Text('WebCam'),
            ],
          ),
          if (selectedSource == 'url') ...[
            const SizedBox(height: 20),
            TextField(
              controller: urlController,
              decoration: const InputDecoration(
                labelText: 'URL',
              ),
            ),
          ],
          const SizedBox(height: 20),
          DetectionTypePage(selectedDetection: selectedDetection, onSelect: (value) {
            setState(() {
              selectedDetection = value;
            });
          }),
          const SizedBox(height: 20),
          AlertsPage(
            alertSMS: alertSMS,
            alertEmail: alertEmail,
            onSMSChanged: (value) {
              setState(() {
                alertSMS = value;
              });
            },
            onEmailChanged: (value) {
              setState(() {
                alertEmail = value;
              });
            },
            smsController: smsController,
            emailController: emailController,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              // Start Button
              Expanded(
                child: GestureDetector(
                  onTap: !isPlaying ? startAnalysis : null,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: !isPlaying ? Colors.teal : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Start',
                        style: TextStyle(
                          color: !isPlaying ? Colors.white : Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Stop Button
              Expanded(
                child: GestureDetector(
                  onTap: isPlaying ? stopAnalysis : null,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: isPlaying ? Colors.red : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Stop',
                        style: TextStyle(
                          color: isPlaying ? Colors.white : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
