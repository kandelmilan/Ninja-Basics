import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class examLanding extends ConsumerStatefulWidget{
  examLanding({super.key});

  @override
  ConsumerState<examLanding> createState()=>_examLandingState();
}
class _examLandingState extends ConsumerState<examLanding> {
  Widget build(BuildContext context) {
    return Scaffold(
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
                _continuePracticeCard(),
                const SizedBox(height: 20),
                _statsSection(),
              ],
            ),
          ),
        ),
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
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 6),
                  Text("👋"),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                "Preparing for: Medical Entrance Exam",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
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

  //  Subject Chips

  Widget _subjectChips() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _chip("Math"),
        _chip("Physics"),
        _chip("Chemistry"),
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
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            offset: Offset(0, 4),
            color: Colors.black12,
          )
        ],
      ),
      child: Row(
        children: [
          /// LEFT SIDE
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.calendar_today,
                        size: 18, color: Colors.blue),
                    SizedBox(width: 6),
                    Text(
                      "Next Exam",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  "May 23, 2003",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade500,
                  ),
                ), Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF0D47A1),
                        Color(0xFF42A5F5),
                      ],
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
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          /// RIGHT SIDE (Days Left Card)
         Container(
           width: 100,
           child: Text(
             "this is the right sidde "
           ),
         )
        ],
      ),
    );
  }


  Widget _continuePracticeCard() {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: const Text("Continue Practice"),
      ),
    );
  }

  Widget _statsSection() {
    return const Text(
      "Your Stats: 85% Accuracy",
      style: TextStyle(fontSize: 16),
    );
  }
}