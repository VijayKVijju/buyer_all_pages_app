import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({super.key, required this.currentIndex});

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/buyer-main');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/buyer-all-inquiries');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/market-news');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Fix LateInitializationError by forcing textScaleFactor
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => _onTap(context, i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF1E73FF),
        unselectedItemColor: Colors.black54,
        selectedLabelStyle:
        GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600),
        unselectedLabelStyle: GoogleFonts.poppins(fontSize: 12),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: "Inquiries",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: "News",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}