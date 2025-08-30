import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/pages/doctor/doctor_home_Page.dart';
import 'package:flutter_healthcare_app/src/pages/doctor/my_account_page.dart';
import 'package:flutter_healthcare_app/src/pages/medication_page.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';

class DoctorDashboardScreen extends StatefulWidget {
  @override
  _DoctorDashboardScreenState createState() => _DoctorDashboardScreenState();
}

class _DoctorDashboardScreenState extends State<DoctorDashboardScreen> {
  int currentPage = 0;
  
  // Create your different pages here
  final List<Widget> _children = [
    DoctorHomePage(),
    MedicationPage(), // Replace with your actual alarm/reminder page
    MessagePage(), // You'll need to create this page
    MyAccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 24),
            activeIcon: Icon(Icons.home, size: 24, color: Colors.blue),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm_outlined, size: 24),
            activeIcon: Icon(Icons.access_alarm, size: 24, color: Colors.blue),
            label: 'Alarm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined, size: 24),
            activeIcon: Icon(Icons.message, size: 24, color: Colors.blue),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined, size: 24),
            activeIcon: Icon(Icons.account_circle, size: 24, color: Colors.blue),
            label: 'Profile',
          ),
        ],
        currentIndex: currentPage,
        selectedItemColor: ColorResources.themeRed,
        unselectedItemColor: ColorResources.lightBlack.withOpacity(0.5),
        type: BottomNavigationBarType.fixed,
        onTap: (position) {
          if (position >= 0 && position < _children.length) {
            setState(() {
              currentPage = position;
            });
          }
        },
      ),
    );
  }
}

// You'll need to create this page for messages
class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: Center(
        child: Text('Messages Page'),
      ),
    );
  }
}