import 'package:flutter/material.dart';
import 'dart:io';
import 'history_detail_page.dart'; // Import the HistoryDetailPage
import 'package:intl/intl.dart'; // For formatting date
import '../hive_helper.dart'; // Import your Hive helper class for data operations

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key, required List<Map<String, dynamic>> history})
      : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late List<Map<String, dynamic>> _history;

  @override
  void initState() {
    super.initState();
    _fetchHistory(); // Fetch history from Hive on init
  }

  void _fetchHistory() async {
    // Fetch history from Hive and update state
    _history = HiveHelper.fetchAllHistory();
    setState(() {}); // Trigger a rebuild
  }

  void _viewDetail(BuildContext context, Map<String, dynamic> entry) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HistoryDetailPage(entry: entry),
      ),
    );
  }

  void _deleteAllHistory(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear History'),
        content: const Text('Are you sure you want to delete all history?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Delete'),
            onPressed: () async {
              Navigator.of(context).pop();
              await HiveHelper.clearAllHistory(); // Clear history from Hive
              _fetchHistory(); // Refresh history
            },
          ),
        ],
      ),
    );
  }

  void _deleteEntry(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Entry'),
        content: const Text('Are you sure you want to delete this entry?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Delete'),
            onPressed: () async {
              Navigator.of(context).pop();

              // Get the entry to remove before updating the state
              final entryToRemove = _history[index];

              setState(() {
                // Remove the entry from history
                _history.removeAt(index);
              });

              // Remove the entry from Hive using its index
              await HiveHelper.deleteEntry(index); // Pass the index instead
              _fetchHistory(); // Refresh history to ensure UI is consistent
            },
          ),
        ],
      ),
    );
  }

  String _formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('MMM dd, yyyy, hh:mm a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _deleteAllHistory(context),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _history.length,
        itemBuilder: (context, index) {
          final entry = _history[index];
          final image = File(entry['imagePath']);
          final label = entry['label'] as String;
          final confidence = entry['confidence'] as double;
          final date = entry['date'] as String;

          return Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.grey, width: 2),
            ),
            child: InkWell(
              onTap: () => _viewDetail(context, entry),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    label.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Accuracy ${confidence.toStringAsFixed(0)}%",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _formatDate(date),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 13,
                      fontFamily: 'Inter',
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(Icons.delete),
                      color: const Color.fromARGB(255, 0, 0, 0),
                      onPressed: () => _deleteEntry(index),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
