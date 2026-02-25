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
                _filterRow(),
                const SizedBox(height: 20),
                _levelCard(
                  level: "Level 1",
                  difficulty: "Easy",
                  title: "Linear Equations Basics",
                  subtitle: "20 questions • Estimated 15 mins",
                  progress: 1,
                  completed: true,
                  score: "95%",
                ),
                const SizedBox(height: 14),
                _levelCard(
                  level: "Level 2",
                  difficulty: "Easy",
                  title: "Solving Simple Equations",
                  subtitle: "22 questions • Estimated 18 mins",
                  progress: 1,
                  completed: true,
                  score: "88%",
                ),
                const SizedBox(height: 14),
                _levelCard(
                  level: "Level 3",
                  difficulty: "Medium",
                  title: "Multi-Step Equations",
                  subtitle: "30 questions • Estimated 22 mins",
                  progress: 0.6,
                  inProgress: true,
                ),
                const SizedBox(height: 14),
                _levelCard(
                  level: "Level 4",
                  difficulty: "Medium",
                  title: "Equations with Fractions",
                  subtitle: "28 questions • Estimated 25 mins",
                  progress: 0,
                  locked: true,
                  lockMessage: "Complete Level 3 to unlock",
                ),
                const SizedBox(height: 14),
                _levelCard(
                  level: "Level 5",
                  difficulty: "Hard",
                  title: "Word Problems",
                  subtitle: "35 questions • Estimated 30 mins",
                  progress: 0,
                  locked: true,
                  lockMessage: "Locked",
                ),
                const SizedBox(height: 10),
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
    padding: const EdgeInsets.all(18),
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
              "Math – Algebra",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFE5ECFF),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                "25%",
                style: TextStyle(
                  color: Color(0xFF2F54EB),
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          "5 of 20 levels completed",
          style: TextStyle(fontSize: 13, color: Colors.black54),
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: 0.25,
            minHeight: 6,
            backgroundColor: Color(0xFFE5E7EB),
            color: Color(0xFF2F54EB),
          ),
        ),
      ],
    ),
  );
}

Widget _filterRow() {
  return Row(
    children: [
      _filterButton("All Levels", true),
      const SizedBox(width: 8),
      _filterButton("Easy", false),
      const SizedBox(width: 8),
      _filterButton("Medium", false),
      const SizedBox(width: 8),
      _filterButton("Hard", false),
    ],
  );
}

Widget _filterButton(String text, bool selected) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: selected ? const Color(0xFF2F54EB) : Colors.white,
      borderRadius: BorderRadius.circular(24),
      border: Border.all(
        color: selected ? const Color(0xFF2F54EB) : const Color(0xFFE5E7EB),
      ),
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: selected ? Colors.white : Colors.black87,
      ),
    ),
  );
}

Widget _levelCard({
  required String level,
  required String difficulty,
  required String title,
  required String subtitle,
  required double progress,
  bool completed = false,
  bool inProgress = false,
  bool locked = false,
  String? score,
  String? lockMessage,
}) {
  final bool isCompleted = completed;
  final bool isLocked = locked;
  final bool isInProgress = inProgress && !isCompleted && !isLocked;

  Color baseColor;
  if (isCompleted) {
    baseColor = const Color(0xFFE6F7EE);
  } else if (isInProgress) {
    baseColor = const Color(0xFFE8F0FF);
  } else if (isLocked) {
    baseColor = const Color(0xFFF5F5F7);
  } else {
    baseColor = Colors.white;
  }

  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: baseColor,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(
        color: isLocked ? const Color(0xFFE5E7EB) : Colors.transparent,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.04),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _badge(level),
            const SizedBox(width: 8),
            _difficultyBadge(difficulty),
            const Spacer(),
            if (isCompleted)
              const Icon(Icons.check_circle, color: Colors.green, size: 20),
            if (isInProgress)
              const Icon(Icons.play_circle_fill,
                  color: Color(0xFF2F54EB), size: 22),
            if (isLocked)
              const Icon(Icons.lock, color: Colors.grey, size: 20),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 12),
        if (!isLocked)
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress.clamp(0.0, 1.0),
              minHeight: 6,
              backgroundColor: Colors.grey.shade300,
              color: const Color(0xFF2F54EB),
            ),
          ),
        if (!isLocked) const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (isCompleted)
              Row(
                children: [
                  const Icon(Icons.check_circle,
                      color: Colors.green, size: 16),
                  const SizedBox(width: 4),
                  const Text(
                    "Completed",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
                    ),
                  ),
                ],
              )
            else if (isInProgress)
              const Text(
                "In progress",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2F54EB),
                ),
              )
            else if (isLocked)
              Expanded(
                child: Text(
                  lockMessage ?? "Locked",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              )
            else
              const SizedBox.shrink(),
            if (isInProgress)
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2F54EB),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            else if (isCompleted && score != null)
              Text(
                "Score: $score",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
          ],
        ),
      ],
    ),
  );
}

Widget _difficultyBadge(String text) {
  Color color = Colors.green;
  if (text == "Medium") {
    color = Colors.orange;
  } else if (text == "Hard") {
    color = Colors.red;
  }

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: color.withOpacity(0.14),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    ),
  );
}

Widget _badge(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    ),
  );
}

