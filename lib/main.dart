import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart'; // Import for local storage path
import 'frontpage/frontpage.dart'; // Import your FrontPage widget
import 'insight_content/insight_content.dart'; // Import your InsightContent widget
import 'history/history_page.dart'; // Import the HistoryPage widget
import 'main/tips_dialog.dart';
import 'dart:developer' as devtools;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive and set local storage directory
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  // Open the 'history' box and clear any existing data for testing
  await Hive.openBox<Map<String, dynamic>>('history');
  await Hive.box<Map<String, dynamic>>('history')
      .clear(); // Clear old data if needed

  // Initialize camera
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;

  const MyApp({Key? key, required this.camera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Canine Digestive Health Classifier',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FrontPage(camera: camera), // Pass the camera parameter here
    );
  }
}

class MyHomePage extends StatefulWidget {
  final CameraDescription camera;

  const MyHomePage({Key? key, required this.camera}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  File? filePath;
  String label = '';
  double confidence = 0.0;
  bool _flashlightOn = false; // Flashlight state

  late Box<Map<String, dynamic>> historyBox; // Hive box

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.camera, ResolutionPreset.medium);
    _initializeControllerFuture = _controller!.initialize();
    _tfLteInit();
    _openHiveBox(); // Open the Hive box in a separate async method
  }

  Future<void> _openHiveBox() async {
    // Check if the box is already opened
    if (!Hive.isBoxOpen('history')) {
      historyBox = await Hive.openBox<Map<String, dynamic>>(
          'history'); // Open the box if not already opened
    } else {
      historyBox = Hive.box<Map<String, dynamic>>(
          'history'); // Access the already opened box
    }
  }

  Future<void> _tfLteInit() async {
    String? res = await Tflite.loadModel(
      model: "assets/x.tflite",
      labels: "assets/1.txt",
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    );
    if (res == null) {
      devtools.log("Failed to load model");
    }
  }

  Future<void> _captureImage() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller!.takePicture();
      setState(() {
        filePath = File(image.path);
      });
      _predictImage(image.path);
    } catch (e) {
      devtools.log(e.toString());
    }
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        filePath = File(pickedFile.path);
      });
      _predictImage(pickedFile.path);
    }
  }

  Future<void> _predictImage(String path) async {
    var recognitions = await Tflite.runModelOnImage(
      path: path,
      imageMean: 0.0,
      numResults: 2,
      threshold: 0.2,
      asynch: true,
    );

    if (recognitions == null) {
      devtools.log("Recognitions is null");
      return;
    }

    devtools.log(recognitions.toString());
    setState(() {
      confidence = (recognitions[0]['confidence'] * 100);
      label = recognitions[0]['label'].toString();

      // Save to Hive
      _saveToHistory(filePath!, label, confidence);
    });
  }

  void _saveToHistory(File imageFile, String label, double confidence) {
    final historyEntry = {
      'imagePath': imageFile.path, // Save the image path
      'label': label,
      'confidence': confidence,
      'date': DateTime.now().toString(),
    };

    historyBox.add(historyEntry); // Save entry to Hive
  }

  void _toggleFlashlight() async {
    if (_controller != null) {
      try {
        if (_flashlightOn) {
          await _controller!.setFlashMode(FlashMode.off);
        } else {
          await _controller!.setFlashMode(FlashMode.torch);
        }
        setState(() {
          _flashlightOn = !_flashlightOn;
        });
      } catch (e) {
        devtools.log('Failed to toggle flashlight: $e');
      }
    }
  }

  void _navigateToHistoryPage() async {
    // Retrieve all history entries from Hive
    List<Map<String, dynamic>> history = [];
    for (var entry in historyBox.values) {
      history.add(Map<String, dynamic>.from(entry));
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HistoryPage(history: history),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double containerWidth = screenWidth * 0.9;
    double containerHeight = screenHeight * 0.85; // Increased height

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Poop Scanner",
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.history, size: 30),
            onPressed: _navigateToHistoryPage,
          ),
          IconButton(
            icon:
                const Icon(Icons.lightbulb_outline, size: 30), // Icon for Tips
            onPressed: () {
              TipsDialog.showTips(
                  context); // Call the static method to show tips
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 0),
              if (filePath == null) ...[
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(15),
                  height: containerHeight,
                  width: containerWidth,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.grey, width: 3),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: FutureBuilder<void>(
                            future: _initializeControllerFuture,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return CameraPreview(_controller!);
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Stack(
                        children: [
                          Positioned(
                            top: 0,
                            bottom: 0,
                            left: 20.0,
                            child: Center(
                              child: ElevatedButton(
                                onPressed: _toggleFlashlight,
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(15),
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                ),
                                child: Icon(
                                  _flashlightOn
                                      ? Icons.flash_on
                                      : Icons.flash_off,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: _captureImage,
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(15),
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                size: 35,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            bottom: 0,
                            right: 20.0,
                            child: Center(
                              child: ElevatedButton(
                                onPressed: _pickImageFromGallery,
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(15),
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                ),
                                child: const Icon(
                                  Icons.upload,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ] else ...[
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(15),
                  width: containerWidth,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.grey, width: 2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: containerWidth *
                            0.8, // Adjusted for smaller screens
                        width: containerWidth *
                            0.8, // Adjusted for smaller screens
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.file(
                            filePath!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        label.toUpperCase(), // Convert text to uppercase
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(fontSize: 18, fontFamily: 'Inter'),
                      ),
                      const SizedBox(height: 8),
                      if (label !=
                          'Not a Feces') // Check if label is not "Not a Feces"
                        Text(
                          'Accuracy: ${confidence.toStringAsFixed(2)}%',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 15, fontFamily: 'Inter2'),
                        ),
                      const SizedBox(height: 1),
                      InsightContent(
                        classification: label,
                        label: '',
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            filePath = null;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.black, // Set background color to black
                          minimumSize: const Size(
                              80.0, 40.0), // Minimum size for the button
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10.0), // Rounded corners
                          ),
                          elevation: 10.0, // Shadow elevation
                        ),
                        child: const Text(
                          "BACK",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Inter',
                            color: Colors.white, // Text color
                            fontWeight: FontWeight.bold, // Bold text
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
