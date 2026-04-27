import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AboutPage(),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth * 0.9;

    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(15),
            width: containerWidth,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.grey, width: 3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "DOG POOP SCANNER",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Inter',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),
                RichText(
                  textAlign: TextAlign.justify,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: '• ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            "Dog Poop Scanner is a mobile app that assists fur parents in monitoring their dogs' health through fecal sample analysis.",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Inter2',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                RichText(
                  textAlign: TextAlign.justify,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: '• ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            "The app lets users upload or capture images of their dog's feces, leading to a results page that classifies the sample as Not a Feces, Normal, Lack of Water, Diarrhea, or Soft Poop. It provides remedies categorized as herbal or over-the-counter, along with step-by-step usage instructions. Additionally, a history feature allows fur parents to track their dog's health over time, aiding in treatment monitoring and general wellness.",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Inter2',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                const Center(
                  child: Text(
                    'HOW TO USE THE APP',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                stepWithIcon(
                    "Start the App: ",
                    "Click the Start button to open the app.",
                    Icons.play_arrow),
                const SizedBox(height: 10),
                stepWithIcon(
                    "Camera Preview: ",
                    "A new page will open featuring a container with a camera preview.",
                    Icons.camera),
                const SizedBox(height: 10),
                stepWithIcon(
                    "Camera Upload: ",
                    "Click the Capture button to take a photo. Alternatively, click the Upload button to select an image from your device.",
                    Icons.upload),
                const SizedBox(height: 10),
                stepWithIcon(
                    "Flashlight Icon: ",
                    "Use the flashlight icon to enhance visibility if needed.",
                    Icons.flashlight_on),
                const SizedBox(height: 10),
                stepWithIcon(
                    "Results Page: ",
                    "After capturing or uploading an image, a results page will open displaying: The classified image, Accuracy score, Classified result, Description, Remedies (herbal and over-the-counter), and a step-by-step instructions for using each remedy.",
                    Icons.check_circle),
                const SizedBox(height: 10),
                stepWithIcon(
                    "Back Navigation: ",
                    "Click the Back button to return to the camera preview page.",
                    Icons.arrow_back),
                const SizedBox(height: 10),
                stepWithIcon(
                    "View History: ",
                    "All classified results will be stored in the history page, where you can view previous classifications.",
                    Icons.history),
                const SizedBox(height: 30),
                const Center(
                  child: Text(
                    'TIPS FOR BETTER RESULTS',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                stepWithIcon(
                  "Ensure Clarity: ",
                  "Make sure the image is not blurred.",
                  Icons.visibility,
                ),
                const SizedBox(height: 10),
                stepWithIcon(
                  "Center the Feces: ",
                  "Ensure the feces is centered in the frame for better classification.",
                  Icons.center_focus_strong,
                ),
                const SizedBox(height: 10),
                stepWithIcon(
                  "Zoom In: ",
                  "Zoom in as much as you can for accurate results.",
                  Icons.zoom_in,
                ),
                const SizedBox(height: 10),
                stepWithIcon(
                  "Good Lighting: ",
                  "Having good lighting conditions can lead to great results.",
                  Icons.wb_sunny,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to create a step with an icon
  Widget stepWithIcon(String title, String description, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 24), // Customize the icon size if needed
        const SizedBox(width: 8), // Spacing between icon and text
        Expanded(
          child: RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: description,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Inter2',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
