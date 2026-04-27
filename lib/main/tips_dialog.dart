import 'package:flutter/material.dart';

class TipsDialog {
  static void showTips(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "TIPS FOR BETTER RESULTS",
            style: TextStyle(
              fontSize: 16, // Smaller title size
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(Icons.center_focus_strong, color: Colors.black),
                  SizedBox(width: 8),
                  Expanded(child: Text("Center the feces in the frame.")),
                ],
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.zoom_in, color: Colors.black),
                  SizedBox(width: 8),
                  Expanded(child: Text("Zoom in as much as possible.")),
                ],
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.wb_sunny, color: Colors.black),
                  SizedBox(width: 8),
                  Expanded(child: Text("Ensure good lighting conditions.")),
                ],
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.blur_on, color: Colors.black),
                  SizedBox(width: 8),
                  Expanded(child: Text("Make sure the image is not blurry.")),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                "Close",
                style: TextStyle(
                  fontSize: 16, // Slightly larger button text
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
