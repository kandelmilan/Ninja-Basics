import 'package:flutter/material.dart';

class MockTestScreen extends StatefulWidget {
  const MockTestScreen({super.key});

  @override
  State<MockTestScreen> createState() => _MockTestScreenState();
}

class _MockTestScreenState extends State<MockTestScreen> {
  int selectedTab = 0;

  final tabs = ["Full Tests", "Sectional", "Custom"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F6FB),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff8FADE8), Color(0xffD6E2F7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),
            _header(),
            const SizedBox(height: 15),
            _tabBar(),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  TestCard(
                    title: "Full Mock Test 01",
                    difficulty: "Easy",
                    difficultyColor: Colors.green,
                    time: "60 mins",
                    questions: "50 Questions",
                    rating: "4.8",
                  ),
                  SizedBox(height: 20),
                  TestCard(
                    title: "Full Mock Test 02",
                    difficulty: "Medium",
                    difficultyColor: Colors.orange,
                    time: "90 mins",
                    questions: "75 Questions",
                    rating: "4.6",
                  ),
                  SizedBox(height: 20),
                  TestCard(
                    title: "Full Mock Test 03",
                    difficulty: "Hard",
                    difficultyColor: Colors.red,
                    time: "120 mins",
                    questions: "100 Questions",
                    rating: "4.9",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      padding: const EdgeInsets.all(16),

      child: Row(
        children: [
          const Expanded(
            child: Text(
              "Mock Tests",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: List.generate(
          tabs.length,
          (index) => Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedTab = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: selectedTab == index
                      ? const Color(0xff2F63D6)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    tabs[index],
                    style: TextStyle(
                      color: selectedTab == index
                          ? Colors.white
                          : Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TestCard extends StatelessWidget {
  final String title;
  final String difficulty;
  final Color difficultyColor;
  final String time;
  final String questions;
  final String rating;

  const TestCard({
    super.key,
    required this.title,
    required this.difficulty,
    required this.difficultyColor,
    required this.time,
    required this.questions,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Icon(Icons.bookmark_border, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: difficultyColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              difficulty,
              style: TextStyle(
                color: difficultyColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.access_time, size: 18, color: Colors.blue),
              const SizedBox(width: 6),
              Text(time),
              const SizedBox(width: 20),
              const Icon(Icons.description, size: 18, color: Colors.blue),
              const SizedBox(width: 6),
              Text(questions),
              const SizedBox(width: 20),
              const Icon(Icons.star, size: 18, color: Colors.amber),
              const SizedBox(width: 6),
              Text(rating),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff2F63D6),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () {},
              child: const Text("Start Test", style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
