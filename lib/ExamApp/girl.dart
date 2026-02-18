import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final pageProvider = StateProvider<int>((ref) => 0);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const ValentineApp(),
    );
  }
}

class ValentineApp extends ConsumerWidget {
  const ValentineApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = ref.watch(pageProvider);

    return Scaffold(
      body: Stack(
        children: [
          const FloatingHearts(),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: [
              const HomeScreen(),
              const ReasonsScreen(),
              const LetterScreen(),
              const CounterScreen(),
            ][page],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: page,
        selectedItemColor: Colors.pink,
        onTap: (i) =>
        ref.read(pageProvider.notifier).state = i,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Reasons"),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: "Letter"),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: "Us"),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.favorite, color: Colors.pink, size: 80),
          const SizedBox(height: 20),
          const Text(
            "Happy Valentine’s Day ❤️",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "To My Beautiful Girl 💕",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text("Surprise 🎁"),
                  content: const Text(
                      "You are the best thing that ever happened to me. I love you forever ❤️"),
                ),
              );
            },
            child: const Text("Tap for Surprise 💌"),
          )
        ],
      ),
    );
  }
}

class ReasonsScreen extends StatelessWidget {
  const ReasonsScreen({super.key});

  final List<String> reasons = const [
    "You make me smile every day 😊",
    "You believe in me when I doubt myself 💪",
    "Your laugh is my favorite sound 🎶",
    "You care so deeply ❤️",
    "Life feels better with you 🌸"
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: reasons.length,
      itemBuilder: (context, index) {
        return Center(
          child: Card(
            elevation: 10,
            margin: const EdgeInsets.all(30),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Text(
                reasons[index],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        );
      },
    );
  }
}

class LetterScreen extends StatelessWidget {
  const LetterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Text(
          "My Love,\n\n"
              "Before you, life was normal. After you, everything became magical.\n\n"
              "You are my peace, my happiness, my forever.\n\n"
              "No matter what happens, I promise to always stand by you.\n\n"
              "Happy Valentine’s Day ❤️\n\n"
              "Yours Always 💕",
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final startDate = DateTime(2023, 5, 1); // CHANGE THIS
    final days = DateTime.now().difference(startDate).inDays;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("We have been together for ❤️",
              style: TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          Text(
            "$days Days",
            style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.pink),
          ),
        ],
      ),
    );
  }
}

class FloatingHearts extends StatefulWidget {
  const FloatingHearts({super.key});

  @override
  State<FloatingHearts> createState() => _FloatingHeartsState();
}

class _FloatingHeartsState extends State<FloatingHearts>
    with SingleTickerProviderStateMixin {
  late Timer timer;
  final random = Random();
  List<Offset> hearts = [];

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 800), (_) {
      setState(() {
        hearts.add(Offset(random.nextDouble(), 1));
        if (hearts.length > 20) hearts.removeAt(0);
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: hearts.map((pos) {
          return Positioned(
            left: pos.dx * MediaQuery.of(context).size.width,
            top: pos.dy * MediaQuery.of(context).size.height - 50,
            child: const Icon(Icons.favorite,
                color: Colors.pinkAccent, size: 20),
          );
        }).toList(),
      ),
    );
  }
}
