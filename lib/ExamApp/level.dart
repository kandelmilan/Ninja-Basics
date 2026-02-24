import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Level extends StatelessWidget {
  Level({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF89A8E0), Color(0xFFF2F4F7)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Text(
                  "Practice by Level",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                const Text(
                  "Complete levels step-by-step and unlock higher difficulty.",
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 25),
                _subjectCard(),
                const SizedBox(height: 25),

                // _filterRow(),

                // const SizedBox(height: 20),

                // // Level Cards
                // _levelCard(
                //   level: "Level 1",
                //   difficulty: "Easy",
                //   title: "Linear Equations Basics",
                //   subtitle: "20 Questions • Estimated 15 mins",
                //   progress: 1,
                //   completed: true,
                //   score: "95%",
                // ),
                // const SizedBox(height: 16),
                // _levelCard(
                //   level: "Level 2",
                //   difficulty: "Easy",
                //   title: "Linear Equations Basics",
                //   subtitle: "20 Questions • Estimated 15 mins",
                //   progress: 1,
                //   completed: true,
                //   score: "95%",
                // ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _subjectCard() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Math-Algebra",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Chip(
              label: Text(
                "25%",
                style: TextStyle(color: const Color.fromARGB(255, 6, 114, 203)),
              ),
              backgroundColor: Colors.white,
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text("5 of 20 Levels completed", style: TextStyle(fontSize: 16)),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: 0.25,
            minHeight: 8,
            backgroundColor: Color(0xFFE5E7EB),
            color: Color(0xFF2F54EB),
          ),
        ),
      ],
    ),
  );
}

