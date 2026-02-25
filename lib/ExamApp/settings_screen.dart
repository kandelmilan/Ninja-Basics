import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_app/providers/user_state.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(loggedInNameProvider);
    final email = ref.watch(loggedInEmailProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F7),
      body: Column(
        children: [
          _topHeader(
            name: name.isEmpty ? 'Sabin Adhikari' : name,
            email: email.isEmpty ? 'sabin.adhikari@gmail.com' : email,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: [
                  _examPreferencesCard(),
                  const SizedBox(height: 16),
                  _notificationCard(),
                  const SizedBox(height: 16),
                  _aboutAppCard(),
                  const SizedBox(height: 20),
                  _bottomActions(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _topHeader({required String name, required String email}) {
  return Container(
    padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF89A8E0),
          Color(0xFFE5ECF7),
        ],
      ),
    ),
    child: SafeArea(
      bottom: false,
      child: Row(
        children: [
          const CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage('assets/man.png'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _settingsTile({
  required IconData icon,
  required String title,
  String? subtitle,
  Color iconColor = const Color(0xFF2F54EB),
}) {
  return ListTile(
    leading: Container(
      height: 34,
      width: 34,
      decoration: BoxDecoration(
        color: iconColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, size: 18, color: iconColor),
    ),
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    ),
    subtitle: subtitle != null
        ? Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          )
        : null,
    trailing: const Icon(Icons.chevron_right, color: Colors.grey),
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
    visualDensity: VisualDensity.compact,
  );
}

Widget _examPreferencesCard() {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.04),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      children: [
        _settingsTile(
          icon: Icons.school_outlined,
          title: "Current Exam Type",
          subtitle: "JEE Advanced 2025",
        ),
        const Divider(height: 1),
        _settingsTile(
          icon: Icons.menu_book_outlined,
          title: "Subjects Selected",
          subtitle: "Physics, Chemistry, Math",
        ),
        const Divider(height: 1),
        _settingsTile(
          icon: Icons.event_outlined,
          title: "Target Exam Date",
          subtitle: "May 30, 2025",
        ),
        const Divider(height: 1),
        _settingsTile(
          icon: Icons.flag_outlined,
          title: "Daily Study Goal",
          subtitle: "4 hours per day",
        ),
      ],
    ),
  );
}

Widget _notificationCard() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 6),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.04),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      children: const [
        _ToggleTile(
          title: "Daily Study Reminder",
          subtitle: "Stay on track with your schedule",
        ),
        Divider(height: 1),
        _ToggleTile(
          title: "New Mock Test Alerts",
          subtitle: "Get notified when new tests are available",
        ),
        Divider(height: 1),
        _ToggleTile(
          title: "Performance Updates",
          subtitle: "Weekly summary of your progress",
        ),
        Divider(height: 1),
        _ToggleTile(
          title: "Weekly Analytics Summary",
          subtitle: "Insights on your study patterns",
        ),
      ],
    ),
  );
}

class _ToggleTile extends StatefulWidget {
  final String title;
  final String? subtitle;

  const _ToggleTile({required this.title, this.subtitle});

  @override
  State<_ToggleTile> createState() => _ToggleTileState();
}

class _ToggleTileState extends State<_ToggleTile> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: (v) => setState(() => value = v),
      title: Text(
        widget.title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: widget.subtitle != null
          ? Text(
              widget.subtitle!,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            )
          : null,
      activeColor: const Color(0xFF2F54EB),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      dense: true,
    );
  }
}

Widget _aboutAppCard() {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.04),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      children: const [
        _SimpleNavTile(
          title: "Help & Support",
          icon: Icons.help_outline,
        ),
        Divider(height: 1),
        _SimpleNavTile(
          title: "Terms & Conditions",
          icon: Icons.description_outlined,
        ),
        Divider(height: 1),
        _SimpleNavTile(
          title: "Privacy Policy",
          icon: Icons.privacy_tip_outlined,
        ),
        Divider(height: 1),
        _SimpleNavTile(
          title: "App Version",
          icon: Icons.info_outline,
          trailingText: "v2.4.1",
        ),
      ],
    ),
  );
}

class _SimpleNavTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String? trailingText;

  const _SimpleNavTile({
    required this.title,
    required this.icon,
    this.trailingText,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: trailingText != null
          ? Text(
              trailingText!,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            )
          : const Icon(Icons.chevron_right, color: Colors.grey),
      dense: true,
    );
  }
}

Widget _bottomActions() {
  return Column(
    children: [
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Rate this app",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(Icons.star_border, color: Color(0xFFFFA940)),
          ],
        ),
      ),
      const SizedBox(height: 10),
      SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xFFFF4D4F)),
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: const Text(
            "Delete your account",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFFFF4D4F),
            ),
          ),
        ),
      ),
      const SizedBox(height: 10),
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF4D4F),
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: const Text(
            "Logout",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ],
  );
}

