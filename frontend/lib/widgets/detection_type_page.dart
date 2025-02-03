import 'package:flutter/material.dart';

class DetectionTypePage extends StatelessWidget {
  final String selectedDetection;
  final Function(String) onSelect;

  const DetectionTypePage({super.key, required this.selectedDetection, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Detection Type', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => onSelect('intrusion'),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: selectedDetection == 'intrusion' ? Colors.teal : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Intrusion',
                      style: TextStyle(
                        color: selectedDetection == 'intrusion' ? Colors.white : Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: GestureDetector(
                onTap: () => onSelect('PPE'),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: selectedDetection == 'PPE' ? Colors.teal : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'PPE',
                      style: TextStyle(
                        color: selectedDetection == 'PPE' ? Colors.white : Colors.teal,
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
    );
  }
}
