import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:pretty_animated_buttons/widgets/pretty_wave_button.dart';
import '../main.dart';
import 'about_page.dart'; // Import AboutPage

class FrontPage extends StatelessWidget {
  final CameraDescription camera;

  const FrontPage({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    // Calculate font sizes based on screen width
    final double titleFontSize = screenWidth * 0.080;
    final double buttonFontSize = screenWidth * 0.045;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 255, 255, 255),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.06,
                right: screenWidth * 0.05), // Responsive padding
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.info_outline, color: Colors.black),
                iconSize: screenWidth * 0.08, // Responsive icon size
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutPage(),
                    ),
                  );
                },
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Transform.translate(
                  offset: Offset(0, -screenHeight * 0.05),
                  child: Image.asset(
                    'assets/images/logo1.jpg',
                    width: screenWidth * 0.60, // Responsive width
                    height: screenHeight * 0.35, // Responsive height
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: screenHeight * 0.001), // Responsive spacing
                Transform.translate(
                  offset: Offset(0, screenHeight * 0.001),
                  child: Column(
                    children: [
                      Text(
                        'DOG',
                        style: TextStyle(
                          fontSize: titleFontSize, // Responsive font size
                          fontFamily: 'Inter',
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.001), // Responsive spacing
                Transform.translate(
                  offset: Offset(0, screenHeight * 0.001),
                  child: Column(
                    children: [
                      Text(
                        'POOP SCANNER',
                        style: TextStyle(
                          fontSize: titleFontSize, // Responsive font size
                          fontFamily: 'Inter',
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.015), // Responsive spacing
                Transform.translate(
                  offset: Offset(0, screenHeight * 0.07),
                  child: PrettyWaveButton(
                    child: Text(
                      'START',
                      style: TextStyle(
                        fontSize: buttonFontSize, // Responsive font size
                        fontFamily: 'Inter',
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () async {
                      await Future.delayed(const Duration(milliseconds: 550));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(camera: camera),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
