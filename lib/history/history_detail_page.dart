import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart'; // Import to format date
import '../insight_content/insight_content.dart'; // Import the InsightContent widget

class HistoryDetailPage extends StatelessWidget {
  final Map<String, dynamic> entry;

  const HistoryDetailPage({Key? key, required this.entry}) : super(key: key);

  String _formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('MMM dd, yyyy, hh:mm a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve the image path as a String and then create a File object
    final imagePath =
        entry['imagePath'] as String; // Changed 'image' to 'imagePath'
    final label = entry['label'] as String;
    final confidence = entry['confidence'] as double;
    final date = entry['date'] as String; // Extract the date from the entry

    return Scaffold(
      appBar: AppBar(
        title: const Text("History Detail"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.grey, width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.file(
                      File(imagePath), // Create File object from image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  label.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Accuracy ${confidence.toStringAsFixed(0)}%",
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(height: 10),
                // Display formatted date
                Text(
                  "Date: ${_formatDate(date)}",
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'Inter',
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                InsightContent(
                  classification: label,
                  label: '',
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size(90.0, 40.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 10.0,
                  ),
                  child: const Text(
                    "Back",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Inter',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
