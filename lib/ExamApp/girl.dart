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
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFE4EC),
              Color(0xFFFFC1D9),
              Color(0xFFFF9ECF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            const FloatingHearts(),
            SafeArea(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 600),
                transitionBuilder: (child, animation) =>
                    FadeTransition(opacity: animation, child: child),
                child: [
                  const HomeScreen(),
                  const ReasonsScreen(),
                  const LetterScreen(),
                  const CounterScreen(),
                ][page],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius:
            const BorderRadius.vertical(top: Radius.circular(25)),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 10,
          currentIndex: page,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          onTap: (i) =>
              ref.read(pageProvider.notifier).state = i,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.list), label: "Reasons"),
            BottomNavigationBarItem(
                icon: Icon(Icons.mail), label: "Letter"),
            BottomNavigationBarItem(
                icon: Icon(Icons.timer), label: "Us"),
          ],
        ),
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
          TweenAnimationBuilder(
            tween: Tween(begin: 0.9, end: 1.2),
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            builder: (context, value, child) {
              return Transform.scale(
                scale: value as double,
                child: const Icon(Icons.favorite,
                    color: Colors.white, size: 100),
              );
            },
          ),
          const SizedBox(height: 30),
          const Text(
            "Happy Valentine’s Day ❤️",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "To My Beautiful Girl 💕",
            style: TextStyle(
                fontSize: 20, color: Colors.white70),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.pink,
              padding: const EdgeInsets.symmetric(
                  horizontal: 35, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(30),
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20)),
                  title: const Text("Surprise 🎁"),
                  content: const Text(
                      "I love you forever ❤️"),
                ),
              );
            },
            child: const Text(
              "Tap for Surprise 💌",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
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
    "Life feels better with you 🌸",
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: reasons.length,
      itemBuilder: (context, index) {
        return Center(
          child: Container(
            margin: const EdgeInsets.all(30),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(25),
              color: Colors.white.withOpacity(0.3),
              border: Border.all(
                  color: Colors.white.withOpacity(0.4)),
            ),
            child: Text(
              reasons[index],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.white,
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
      padding: const EdgeInsets.all(25),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius:
                BorderRadius.circular(25),
          ),
          child: const SingleChildScrollView(
            child: Text(
              "My Love,\n\n"
              "Before you, life was normal. After you, everything became magical.\n\n"
              "You are my peace, my happiness, my forever.\n\n"
              "No matter what happens, I promise to always stand by you.\n\n"
              "Happy Valentine’s Day ❤️\n\n"
              "Yours Always 💕",
              style: TextStyle(
                fontSize: 18,
                height: 1.6,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final startDate =
        DateTime(2023, 5, 1); // Change your date
    final days =
        DateTime.now().difference(startDate).inDays;

    return Center(
      child: Container(
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Together For ❤️",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 15),
            Text(
              "$days Days",
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FloatingHearts extends StatefulWidget {
  const FloatingHearts({super.key});

  @override
  State<FloatingHearts> createState() =>
      _FloatingHeartsState();
}

class _FloatingHeartsState
    extends State<FloatingHearts> {
  late Timer timer;
  final random = Random();
  List<Offset> hearts = [];

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        const Duration(milliseconds: 800), (_) {
      setState(() {
        hearts = hearts
            .map((e) =>
                Offset(e.dx, e.dy - 0.05))
            .where((e) => e.dy > 0)
            .toList();

        hearts.add(
            Offset(random.nextDouble(), 1));
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
            left: pos.dx *
                MediaQuery.of(context)
                    .size
                    .width,
            top: pos.dy *
                    MediaQuery.of(context)
                        .size
                        .height -
                50,
            child: const Icon(
              Icons.favorite,
              color: Colors.white70,
              size: 20,
            ),
          );
        }).toList(),
      ),
    );
  }
}


