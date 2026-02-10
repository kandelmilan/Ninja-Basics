import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _collegeHeader(),
            _greetingCard(),
            _academicsSection(),
            _todayClasses(),
            _UpcomingEvents(),
          ],
        ),
      ),
    );
  }

  Widget _collegeHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.school, color: Colors.indigo,),
          SizedBox(width: 8,),
          Text(
            'Himalaya College of Engineering ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _greetingCard() {
    return Padding(padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 32, color: Colors.blue,),
                ),
                const SizedBox(width: 12,),
                Expanded(child: Text('Good Evening , Milan Kandel',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                _infoCard('Attendance', '0%'),
                const SizedBox(width: 12,),
                _infoCard('Task Due', '2')
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(String title, String value) {
    return Expanded(child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 6,),
          Text(title),
        ],
      ),
    ),
    );
  }

  Widget _academicsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionHeader('Academics'),
          const SizedBox(height: 12,),
          Row(
              children: [
                _menuCard('Attendance\n(Subject)'),
                _menuCard('Attendance\n(class)'),
                _menuCard('Attendance\n    '),
              ]
          ),
        ],
      ),
    );
  }

  Widget _menuCard(String title) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const[
              BoxShadow(color: Colors.black12, blurRadius: 6),
            ],
          ),
          child: Column(
            children: [
              const Icon(Icons.calendar_month, color: Colors.blue,),
              const SizedBox(height: 8,),
              Text(
                title,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget _sectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('View All →'),
        ),
      ],
    );
  }

  Widget _todayClasses() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 6),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionHeader("Today's Classes"),
            const SizedBox(height: 6,),
            Text('No classes scheduled for today',
              style: TextStyle(fontSize: 15),),
          ],
        ),
      ),
    );
  }
  Widget _UpcomingEvents(){
    return Padding(padding: const EdgeInsets.only(left: 16,bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(right: 16),
        child: _sectionHeader('Upcoming Events'),
        ),
        const SizedBox(height: 12,),
        SizedBox(
          height: 320,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
                _eventCard(
                  image: 'assets/man.png',
                  date: "10 Feb 12:00 AM - 12:00 AM",
                  title: 'Building Construction III (TH) - Final Project Report Submission and Presentation 3rd Year 1st Part (BAR)',
                ),
              _eventCard(
                image: 'assets/man.png',
                date: "10 Feb 12:00 AM - 12:00 AM",
                title:'Thesis Presentation - Mid Term (BAR)', ),
            ],
            
          ),
        )
      ],
    ),
    );
  }

Widget _eventCard({required String image,required String date,required String title,}){
    return Container(
      width: 240,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color:Colors.black12,blurRadius: 6),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16),
            ),
            child: Image.asset(
              image,
              height: 140,
                width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 6,),
              Text(
                title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8,),
              Row(
                children: [
                  Icon(Icons.location_on,
                  size: 16,color: Colors.grey,),
                  SizedBox(width: 4,),
                  Text(
                    'Himalaya College',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              )
            ],
          ),)
        ],
      ),
    );
}
}