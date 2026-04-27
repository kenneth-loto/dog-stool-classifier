import 'package:flutter/material.dart';
import 'styles.dart';

class RemedyStepWidget extends StatelessWidget {
  final String stepTitle;
  final String stepDescription;
  final IconData icon;

  const RemedyStepWidget({
    Key? key,
    required this.stepTitle,
    required this.stepDescription,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: AppStyles.mediumSpacing),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                stepTitle,
                style: AppStyles.subtitleStyle,
              ),
              // Added Padding to the Icon
              Padding(
                padding: const EdgeInsets.only(left: 8.0), // Adjust as needed
                child: Icon(icon, size: 20),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppStyles.smallSpacing),
        RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            style: AppStyles.bodyStyle,
            children: [
              const TextSpan(
                text: '• ',
                style: AppStyles.bulletStyle,
              ),
              TextSpan(
                text: stepDescription,
                style: const TextStyle(fontFamily: 'Inter2'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
