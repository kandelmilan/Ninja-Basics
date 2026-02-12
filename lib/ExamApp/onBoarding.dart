import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_app/ExamApp/examLanding.dart';
import 'package:flutter_test_app/pages/generalUI.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Personalized preparation",
      "desc": "Choose your exam & subject."
    },
    {
      "title": "Level Based Questions",
      "desc": "Start from level 1 & unlock higher levels."
    },
    {
      "title": "Mock tests & analytics",
      "desc": "Track progress & beat your score."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.school, size: 120, color: Colors.blue),
                      const SizedBox(height: 30),
                      Text(
                        onboardingData[index]["title"]!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        onboardingData[index]["desc"]!,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          ElevatedButton(
            onPressed: () {
              if (_currentPage == 2) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ExamLanding(),
                  ),
                );
              } else {
                _controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size(200, 45),
            ),
            child: Text(_currentPage == 2 ? "Get Started" : "Next"),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}


