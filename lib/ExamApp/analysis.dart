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
    // Slightly taller cards to avoid vertical overflow
    childAspectRatio: 0.95,
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
  final bool isPrimaryCard = !isDarkText;

  return Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 10),
      decoration: BoxDecoration(
        gradient: isPrimaryCard
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color.withOpacity(0.95),
                  color.withOpacity(0.75),
                ],
              )
            : null,
        color: isPrimaryCard ? null : Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: isPrimaryCard
            ? null
            : Border.all(
                color: Colors.grey.shade200,
                width: 1,
              ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color:
                            isPrimaryCard ? Colors.white70 : Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: isPrimaryCard
                            ? Colors.white.withOpacity(0.14)
                            : color.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        "Last 7 days",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: isPrimaryCard ? Colors.white : color,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isPrimaryCard
                      ? Colors.white.withOpacity(0.18)
                      : color.withOpacity(0.08),
                ),
                alignment: Alignment.center,
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isPrimaryCard ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: isPrimaryCard
                    ? [
                        Colors.white.withOpacity(0.85),
                        Colors.white.withOpacity(0.4),
                      ]
                    : [
                        color.withOpacity(0.8),
                        color.withOpacity(0.25),
                      ],
              ),
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
      const SizedBox(height: 12),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Next recommended action",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Focus 20 mins on weak areas today.",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2F54EB),
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "View detailed report",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
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



// Widget _filterRow() {
//   return Row(
//     children: [
//       _filterButton("All Levels", true),
//       const SizedBox(width: 3),
//       _filterButton("Easy", false),
//       const SizedBox(width: 3),
//       _filterButton("Medium", false),
//       const SizedBox(width: 3),
//       _filterButton("Hard", false),
//     ],
//   );
// }

// Widget _filterButton(String text, bool selected) {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
//     decoration: BoxDecoration(
//       color: selected ? const Color(0xFF2F54EB) : Colors.white,
//       borderRadius: BorderRadius.circular(30),
//     ),
//     child: Text(
//       text,
//       style: TextStyle(
//         color: selected ? Colors.white : Colors.black54,
//         fontWeight: FontWeight.w500,
//       ),
//     ),
//   );
// }

// Widget _levelCard({
//   required String level,
//   required String difficulty,
//   required String title,
//   required String subtitle,
//   required double progress,
//   bool completed = false,
//   bool inProgress = false,
//   String? score,
// }) {
//   return Container(
//     padding: const EdgeInsets.all(18),
//     decoration: BoxDecoration(
//       color: completed ? const Color(0xFFE8F7EE) : const Color(0xFFF2F4FF),
//       borderRadius: BorderRadius.circular(20),
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             _badge(level),
//             const SizedBox(width: 8),
//             _difficultyBadge(difficulty),
//             const Spacer(),
//             if (completed) const Icon(Icons.check_circle, color: Colors.green),
//             if (inProgress)
//               const Icon(Icons.play_circle_fill, color: Color(0xFF2F54EB)),
//           ],
//         ),
//         const SizedBox(height: 10),
//         Text(
//           title,
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 4),
//         Text(subtitle, style: const TextStyle(color: Colors.black54)),
//         const SizedBox(height: 12),
//         ClipRRect(
//           borderRadius: BorderRadius.circular(10),
//           child: LinearProgressIndicator(
//             value: progress,
//             minHeight: 6,
//             backgroundColor: Colors.grey.shade300,
//             color: completed ? Colors.green : const Color(0xFF2F54EB),
//           ),
//         ),
//         const SizedBox(height: 10),
//         if (completed)
//           Text(
//             "✓ Completed   Score: $score",
//             style: const TextStyle(color: Colors.green),
//           ),
//         if (inProgress)
//           const Text(
//             "▶ In Progress",
//             style: TextStyle(color: Color(0xFF2F54EB)),
//           ),
//       ],
//     ),
//   );
// }

// Widget _difficultyBadge(String text) {
//   Color color = Colors.green;

//   if (text == "Medium") {
//     color = Colors.orange;
//   } else if (text == "Hard") {
//     color = Colors.red;
//   }

//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//     decoration: BoxDecoration(
//       color: color.withOpacity(0.2),
//       borderRadius: BorderRadius.circular(20),
//     ),
//     child: Text(
//       text,
//       style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: color),
//     ),
//   );
// }

// Widget _badge(String text) {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//     decoration: BoxDecoration(
//       color: Colors.grey.shade300,
//       borderRadius: BorderRadius.circular(20),
//     ),
//     child: Text(
//       text,
//       style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
//     ),
//   );
// }
