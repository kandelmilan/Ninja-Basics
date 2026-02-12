import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_app/ExamApp/onBoarding.dart';
import 'package:flutter_test_app/pages/landing_page.dart';

class LogoLanding extends ConsumerStatefulWidget {
  LogoLanding({super.key});
  @override
  ConsumerState<LogoLanding> createState()=>_LogoLandingState();
}
class _LogoLandingState extends ConsumerState<LogoLanding>{
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
        ),
      );
    });
  }
 Widget build(BuildContext context){
   return Scaffold(
     body:Container(
       width: double.infinity,
       height: double.infinity,
       decoration: BoxDecoration(
         gradient: LinearGradient(
           begin: Alignment.topLeft,
           end: Alignment.bottomRight,
           colors: [
             Color(0xFF1565C0), // Dark Blue
             Color(0xFF42A5F5), // Light Blue
           ],
         ),
     ),
       child: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container(
               padding: EdgeInsets.all(20),
               decoration: BoxDecoration(
                 shape: BoxShape.circle,
                 color: Colors.black12
               ),
               child: Icon(Icons.school_outlined,size: 60,color: Colors.white10,),
             ),

         const SizedBox(height: 20),

     const Text(
       "Moew Moew College",
       style: TextStyle(
         color: Colors.white,
         fontSize: 26,
         fontWeight: FontWeight.bold,
         letterSpacing: 1,
       ),
     ),


       ],
         ),
       ),
     ),
   );
 }
}