import 'package:flutter/material.dart';

class Analysis extends StatelessWidget {
  Analysis({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F6FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopStats(),
              SizedBox(height: 12),
              _subPerformance(),
              SizedBox(height: 12),
              _smartInsights(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTopStats() {
  return GridView.count(
    crossAxisCount: 2,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    mainAxisSpacing: 12,
    crossAxisSpacing: 12,
    childAspectRatio: 1.3,
    children: [
      _statCard(title: "Overall Accuracy", value: "73%", color: Colors.blue),
      _statCard(
        title: "Average Score",
        value: "68.5",
        color: Colors.grey.shade200,
        isDarkText: true,
      ),
      _statCard(
        title: "Study Time",
        value: "18.5 hrs",
        color: Colors.grey.shade200,
        isDarkText: true,
      ),
      _statCard(
        title: "Mock Tests",
        value: "12",
        color: Colors.grey.shade200,
        isDarkText: true,
      ),
    ],
  );
}

Widget _statCard({
  required String title,
  required String value,
  required Color color,
  bool isDarkText = false,
}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: isDarkText ? Colors.black54 : Colors.white70),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: isDarkText ? Colors.black : Colors.white,
          ),
        ),
      ],
    ),
  );
}

Widget _subPerformance() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Subject Performance",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      const SizedBox(height: 12),

      _performanceCard(
        icon: Icons.calculate,
        title: "Math",
        subDes: "12 topics covered",
        percent: 0.80,
        color: Colors.blue,
      ),

      _performanceCard(
        icon: Icons.science,
        title: "Physics",
        subDes: "9 topics covered",
        percent: 0.62,
        color: Colors.purple,
      ),
      _performanceCard(
        icon: Icons.science,
        title: "Physics",
        subDes: "9 topics covered",
        percent: 0.62,
        color: Colors.purple,
      ),

      _performanceCard(
        icon: Icons.biotech,
        title: "Chemistry",
        subDes: "15 topics covered",
        percent: 0.80,
        color: Colors.green,
      ),

      _performanceCard(
        icon: Icons.psychology,
        title: "Reasoning",
        subDes: "8 topics covered",
        percent: 0.55,
        color: Colors.red,
      ),

      _performanceCard(
        icon: Icons.menu_book,
        title: "English",
        subDes: "11 topics covered",
        percent: 0.74,
        color: Colors.orange,
      ),
    ],
  );
}

Widget _performanceCard({
  required String title,
  required IconData icon,
  required String subDes,
  required double percent,
  required Color color,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 20),
            ),

            const SizedBox(width: 12),

            // Title + subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    subDes,
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            // Percentage
            Text(
              "${(percent * 100).toInt()}%",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Progress Bar
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: percent,
            minHeight: 8,
            backgroundColor: Colors.grey.shade200,
            color: color,
          ),
        ),
      ],
    ),
  );
}

Widget _smartInsights() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Smart Insights",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 12),

      _insightCard(
        title: "Strong Performance",
        description: "You perform best in Mathematics with 92% accuracy.",
        icon: Icons.emoji_events,
        bgColor: const Color(0xFFE6F4EA),
        iconColor: Colors.green,
      ),
      _insightCard(
        title: "Needs Attention",
        description: "Your accuracy drops in Time & Work problems.",
        icon: Icons.warning_amber_rounded,
        bgColor: const Color(0xFFFFF4E5),
        iconColor: Colors.orange,
      ),
      _insightCard(
        title: "Peak Productivity",
        description: "Your performance is 35% higher during evening sessions.",
        icon: Icons.trending_up,
        bgColor: const Color(0xFFE8F0FE),
        iconColor: Colors.blue,
      ),
    ],
  );
}

Widget _insightCard({
  required String title,
  required String description,
  required IconData icon,
  required Color bgColor,
  required Color iconColor,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(18),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(fontSize: 13, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
