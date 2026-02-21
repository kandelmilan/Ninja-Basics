import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_app/pages/generalUI.dart';

class examLanding extends ConsumerStatefulWidget {
  examLanding({super.key});

  @override
  ConsumerState<examLanding> createState() => _examLandingState();
}

class _examLandingState extends ConsumerState<examLanding> {
  final selectedIndexProvider = StateProvider<int>((ref) => 0);
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF2F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                _greetingSection(),
                const SizedBox(height: 20),
                _subjectChips(),
                const SizedBox(height: 20),
                _examCard(),
                const SizedBox(height: 20),
                _descPractice(),
                const SizedBox(height: 20),
                _statsSection(),
                const SizedBox(height: 20),
                _quickActionSection(),
                const SizedBox(height: 20),
                _SuggestedSection(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Consumer(
        builder: (context, ref, child) {
          final selectedIndex = ref.watch(selectedIndexProvider);

          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey.shade600,
            currentIndex: selectedIndex,
            onTap: (index) {
              ref.read(selectedIndexProvider.notifier).state = index;
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.my_library_books_sharp),
                label: 'Practice',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Mocktest',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.analytics_outlined),
                label: 'Analytics',
          
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _greetingSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 26,
          backgroundImage: const AssetImage('assets/man.png'),
          backgroundColor: Colors.grey.shade300,
        ),
        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text(
                    "Hi, Rajan",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 6),
                  Text("👋"),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                "Preparing for: Medical Entrance Exam",
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),

        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(22),
          ),
          child: const Icon(
            Icons.notifications_none,
            size: 22,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _subjectChips() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _chip("Math"),
        _chip("Physics"),
        _chip("Chemistry"),
        _chip("Social"),
      ],
    );
  }

  Widget _chip(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _examCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            offset: Offset(0, 4),
            color: Colors.black12,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // LEFT SIDE - Next Exam
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: const [
                    Icon(Icons.calendar_today, size: 18, color: Colors.blue),
                    SizedBox(width: 6),
                    Text(
                      "Next Exam",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  "May 23, 2003",
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 12),
                Container(
                  width: 100,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF0D47A1), Color(0xFF42A5F5)],
                    ),
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "23",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "days left",
                        style: TextStyle(fontSize: 12, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Medical Entrance Exam",
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          // RIGHT SIDE - Last Exam
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: const [
                    Icon(Icons.history, size: 18, color: Colors.green),
                    SizedBox(width: 6),
                    Text(
                      "Last Exam",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  "Apr 15, 2025",
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 12),
                Container(
                  width: 100,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        "87",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Score",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "View Report →",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _statsSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _statCard(
                icon: Icons.check,
                iconColor: Colors.green,
                value: "84",
                label: "Accuracy",
              ),
            ),
            SizedBox(width: 14),
            Expanded(
              child: _statCard(
                icon: Icons.local_fire_department,
                iconColor: Colors.orange,
                value: "12",
                label: "Day Streak",
              ),
            ),
            SizedBox(width: 14),
            Expanded(
              child: _statCard(
                icon: Icons.emoji_events,
                iconColor: Colors.purple,
                value: "48",
                label: "Accuracy",
              ),
            ),
            SizedBox(width: 14),
            Expanded(
              child: _statCard(
                icon: Icons.schedule,
                iconColor: Colors.blue,
                value: "18h",
                label: "Weekly",
              ),
            ),
            SizedBox(width: 14),
          ],
        ),
      ],
    );
  }

  Widget _descPractice() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Continue where you left off",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          const SizedBox(height: 6),
          Text(
            "Level 6-ALgebra Practice",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              "Resume Practice",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _statCard({
  required IconData icon,
  required Color iconColor,
  required String value,
  required String label,
}) {
  return Container(
    width: 74.75,
    height: 132,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade300, width: 1),
      boxShadow: const [
        BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4)),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Icon circle (slightly smaller)
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: iconColor.withOpacity(0.1),
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),

        const SizedBox(height: 8),

        // Value
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),

        const SizedBox(height: 4),

        // Label (prevent overflow)
        Text(
          label,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    ),
  );
}

Widget _quickAction({
  required IconData icon,
  required Color iconColor,
  required String label,
}) {
  return Container(
    width: 74.75,
    height: 132,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4)),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.lightBlue.shade50,
          ),
          child: Icon(icon, color: iconColor, size: 28),
        ),
        SizedBox(height: 6),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    ),
  );
}

Widget _quickActionSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 18, bottom: 18),
        child: const Text(
          "Quick Action",
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: _quickAction(
              icon: Icons.layers_sharp,
              iconColor: Colors.green,
              label: "Practice by level",
            ),
          ),
          SizedBox(width: 14),
          Expanded(
            child: _quickAction(
              icon: Icons.school,
              iconColor: Colors.orange,
              label: "Mock Tests",
            ),
          ),
          SizedBox(width: 14),
          Expanded(
            child: _quickAction(
              icon: Icons.bookmark,
              iconColor: Colors.purple,
              label: "Bookmarks",
            ),
          ),
          SizedBox(width: 14),
        ],
      ),
    ],
  );
}

Widget _SuggestedSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 18, bottom: 12),
        child: const Text(
          "Suggested for You",
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(height: 16),
      SizedBox(
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _suggestedCard(
              icon: Icons.show_chart,
              iconBgColor: Colors.red.shade50,
              iconColor: Colors.red,
              title: "Quadratic Equations",
              subtitle: "Practice Level 4 • 15 questions",
              badgeText: "Weak Area",
              badgeColor: Colors.red,
              ButtonText: "Start Practice",
            ),
            const SizedBox(width: 16),
            _suggestedCard(
              icon: Icons.assignment_turned_in,
              iconBgColor: Colors.green.shade50,
              iconColor: Colors.green,
              title: "Full Length Mock",
              subtitle: "Advanced Practice Test",
              badgeText: "Normal",
              badgeColor: Colors.green,
              ButtonText: "Take Test",
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _suggestedCard({
  required IconData icon,
  required Color iconBgColor,
  required Color iconColor,
  required String title,
  required String subtitle,
  String? badgeText,
  Color? badgeColor,
  required String ButtonText,
}) {
  return Container(
    width: 280,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4)),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: iconColor, size: 26),
            ),
            if (badgeText != null)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: badgeColor!.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  badgeText,
                  style: TextStyle(
                    color: badgeColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
          ],
        ),

        const SizedBox(height: 16),

        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 6),

        Text(
          subtitle,
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            "$ButtonText →",
            style: const TextStyle(
              fontSize: 15,
              color: Colors.blue,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}
