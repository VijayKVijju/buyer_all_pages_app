
//==============working fime
/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Buyermainpage.dart';
import 'DetailedMarketNewsPage.dart';


class MarketNewsPage extends StatefulWidget {
  const MarketNewsPage({super.key});

  @override
  State<MarketNewsPage> createState() => _MarketNewsPageState();
}

class _MarketNewsPageState extends State<MarketNewsPage> {
  int bottomIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),

      // ---------------- TOP HEADER -----------------
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xFF1E73FF),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Market News",
                        style: GoogleFonts.poppins(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1E73FF),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 36), // ghost to center the title
                ],
              ),
            ),

            const SizedBox(height: 12),

            // ---------------- NEWS LIST -----------------
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                children: [
                  _newsCard(
                    context,
                    image: "assets/images/sample3.png",
                    title: "Global Polypropylene Market Sees  Unprecedented Growth",
                    shortText:
                    "A new report indicates a significant surge  in demand for PP, driven by the packaging and automotive sectors.",
                    source: "Energy Monitor",
                    fullImage: "assets/images/sample1.png",
                  ),

                  const SizedBox(height: 20),

                  _newsCard(
                    context,
                    image: "assets/images/sample2.png",
                    title: "New Environmental Regulations for Polymer Production",
                    shortText:
                    "Governments worldwide are introducing stricter standards for emissions and waste in the plastics industry.",
                    source: "Energy Monitor",
                    fullImage: "assets/images/sample1.png",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // ---------------- BOTTOM NAVIGATION -----------------
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomIndex,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (_) => const Buyermainpage()));
          }
          setState(() => bottomIndex = index);
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF1E73FF),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/nav_dashboard.png", width: 24),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/nav_listings.png", width: 24),
            label: "Listings",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/nav_news.png", width: 24),
            label: "News",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/nav_profile.png", width: 24),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  // ---------------- NEWS CARD WIDGET -----------------
  Widget _newsCard(
      BuildContext context, {
        required String image,
        required String title,
        required String shortText,
        required String source,
        required String fullImage,
      }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailedMarketNewsPage(
              title: title,
              image: fullImage,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
              child: Image.asset(image, fit: BoxFit.cover),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1E73FF),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    shortText,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: const Color(0xFF7E8A97),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Source: $source",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: const Color(0xFF7E8A97),
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
}

 */

//working fine
/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../buyer/BottomNavBar.dart';
import '../buyer/BuyerMainInquiryPage.dart';
import 'Buyermainpage.dart';
import 'DetailedMarketNewsPage.dart';

class MarketNewsPage extends StatefulWidget {
  const MarketNewsPage({super.key});

  @override
  State<MarketNewsPage> createState() => _MarketNewsPageState();
}

class _MarketNewsPageState extends State<MarketNewsPage> {
  int bottomIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),

      // ---------------- TOP HEADER -----------------
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xFF1E73FF),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Market News",
                        style: GoogleFonts.poppins(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1E73FF),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 36),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // ---------------- NEWS LIST -----------------
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                children: [
                  _newsCard(
                    context,
                    image: "assets/images/sample3.png",
                    title: "Global Polypropylene Market Sees Unprecedented Growth",
                    shortText:
                    "A new report indicates a significant surge in demand for PP, driven by the packaging and automotive sectors.",
                    source: "Energy Monitor",
                    fullImage: "assets/images/sample1.png",
                  ),
                  const SizedBox(height: 20),
                  _newsCard(
                    context,
                    image: "assets/images/sample2.png",
                    title: "New Environmental Regulations for Polymer Production",
                    shortText:
                    "Governments worldwide are introducing stricter standards for emissions and waste in the plastics industry.",
                    source: "Energy Monitor",
                    fullImage: "assets/images/sample1.png",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // ---------------- BOTTOM NAVIGATION -----------------
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomIndex,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const BuyerMainInquiryPage(selectedGrade: '', selectedType: '',),
              ),
            );
          }
          setState(() => bottomIndex = index);
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF1E73FF),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: "Listings",
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

  // ---------------- NEWS CARD -----------------
  Widget _newsCard(
      BuildContext context, {
        required String image,
        required String title,
        required String shortText,
        required String source,
        required String fullImage,
      }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailedMarketNewsPage(
              title: title,
              image: fullImage,
              date: "June 2025",
              description: shortText,
              source: source,
              imageUrl: fullImage,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(14)),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1E73FF),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    shortText,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: const Color(0xFF7E8A97),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Source: $source",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: const Color(0xFF7E8A97),
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
}

 */

//sample
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../buyer/BottomNavBar.dart';
import 'DetailedMarketNewsPage.dart';

class MarketNewsPage extends StatefulWidget {
  const MarketNewsPage({super.key});

  @override
  State<MarketNewsPage> createState() => _MarketNewsPageState();
}

class _MarketNewsPageState extends State<MarketNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),

      // ---------------- BODY -----------------
      body: SafeArea(
        child: Column(
          children: [
            // ---------------- HEADER -----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xFF1E73FF),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Market News",
                        style: GoogleFonts.poppins(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1E73FF),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 36),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // ---------------- NEWS LIST -----------------
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                children: [
                  _newsCard(
                    context,
                    image: "assets/images/sample3.png",
                    title:
                    "Global Polypropylene Market Sees Unprecedented Growth",
                    shortText:
                    "A new report indicates a significant surge in demand for PP, driven by the packaging and automotive sectors.",
                    source: "Energy Monitor",
                    fullImage: "assets/images/sample1.png",
                  ),
                  const SizedBox(height: 20),
                  _newsCard(
                    context,
                    image: "assets/images/sample2.png",
                    title:
                    "New Environmental Regulations for Polymer Production",
                    shortText:
                    "Governments worldwide are introducing stricter standards for emissions and waste in the plastics industry.",
                    source: "Energy Monitor",
                    fullImage: "assets/images/sample1.png",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // ---------------- BOTTOM NAV (NAMED ROUTES) -----------------
      bottomNavigationBar: BottomNavBar(currentIndex: 2), // removed const
    );
  }

  // ---------------- NEWS CARD -----------------
  Widget _newsCard(
      BuildContext context, {
        required String image,
        required String title,
        required String shortText,
        required String source,
        required String fullImage,
      }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailedMarketNewsPage(
              title: title,
              image: fullImage,
              date: "June 2025",
              description: shortText,
              source: source,
              imageUrl: fullImage,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(14)),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1E73FF),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    shortText,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: const Color(0xFF7E8A97),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Source: $source",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: const Color(0xFF7E8A97),
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
}