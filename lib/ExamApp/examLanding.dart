import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class examLanding extends ConsumerStatefulWidget{
  examLanding({super.key});

  @override
  ConsumerState<examLanding> createState()=>_examLandingState();
}
class _examLandingState extends ConsumerState<examLanding>{
  Widget build(BuildContext context){
    return Scaffold(
      body:SafeArea(
          child: SingleChildScrollView(
            child:Padding(
              padding:const EdgeInsets.symmetric(horizontal: 16),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _greetingSection(),
            ],
            ),
            ),
          ),
      ),
    );
  }

  Widget _greetingSection(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius:26,
          backgroundImage: AssetImage('assets/man.png'),
          backgroundColor: Colors.lightGreen,
        ),
        SizedBox(width: 12),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
               children: [
                 Text("Hi,Rajan",
                 style: TextStyle(
                   fontWeight: FontWeight.bold,
                 ),),
               ],
            )
          ],
        ),
        ),
        SizedBox(height: 6,),
        Text(
          'Preparing for:Medical Entrance Exam',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: Colors.lightGreen,
          ),
          child: Icon(Icons.notifications_none,size: 22,color: Colors.black45,),
        )
    ],
    );
  }

}