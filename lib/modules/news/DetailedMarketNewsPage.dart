import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailedMarketNewsPage extends StatelessWidget {
  final String title;
  final String image;

  const DetailedMarketNewsPage({
    super.key,
    required this.title,
    required this.image, required date, required imageUrl, required description, required source,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),

      body: SafeArea(
        child: Column(
          children: [
            // ---------------- HEADER -----------------
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
                  const SizedBox(width: 36),
                ],
              ),
            ),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(image, fit: BoxFit.cover),
                  ),
                  const SizedBox(height: 14),

                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1E73FF),
                    ),
                  ),
                  const SizedBox(height: 10),

                  Text(
                    """
The global polypropylene market is witnessing unprecedented growth, supported by strong demand across packaging, automotive, household goods, textiles, and industrial applications. Rising consumption in emerging economies, expansion of refining and petrochemical capacities, and improvements in polymer processing technologies are driving the market forward.

New production facilities and export agreements—especially in Asia, the Middle East, and Africa—are reshaping global trade flows and increasing supply stability. At the same time, manufacturers are focusing on lightweight, high-strength polypropylene grades to meet the needs of modern industries.

With continuous innovation, expanding capacity, and strong end-user demand, the polypropylene market is expected to grow steadily in the coming years, reinforcing its position as one of the most versatile and fast-expanding polymers in the world.
""",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: const Color(0xFF7E8A97),
                      height: 1.55,
                    ),
                  ),

                  Text(
                    "Source: Energy Monitor",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: const Color(0xFF1E73FF),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}