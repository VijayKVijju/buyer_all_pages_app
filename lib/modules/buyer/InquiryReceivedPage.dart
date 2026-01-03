

//=====================old properly working code===============================
/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InquiryReceivedPage extends StatelessWidget {
  final String productName;
  final String grade;
  final String qty;
  final String pricePerKg;
  final int subtotal;
  final int delivery;
  final int total;

  const InquiryReceivedPage({
    super.key,
    required this.productName,
    required this.grade,
    required this.qty,
    required this.pricePerKg,
    required this.subtotal,
    required this.delivery,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),

            /// Green Checkmark
            Icon(Icons.check_circle, size: 80, color: Colors.green.shade500),

            const SizedBox(height: 20),

            Text(
              "Inquiry sent Successfully",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1E73FF),
              ),
            ),

            const SizedBox(height: 12),

            Text(
              "Your inquiry has been sent to the admin, and you\nwill be notified soon.",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: const Color(0xFF8B97A9),
              ),
            ),

            const SizedBox(height: 30),

            /// Summary Card
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productName,
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w700)),
                  Text(
                    grade,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: const Color(0xFF8B97A9),
                    ),
                  ),

                  const SizedBox(height: 20),

                  _row("Quantity", "$qty kg"),
                  _row("Price per kg", pricePerKg),
                  _row("Subtotal", "₹ $subtotal"),
                  _row("Delivery Charges", "₹ $delivery"),

                  const SizedBox(height: 10),

                  Text(
                    "Total charges",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: const Color(0xFF1E73FF),
                    ),
                  ),
                  Text(
                    "₹ $total",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: const Color(0xFF1E73FF),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            /// Browse More Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E73FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),

                  /// FIXED NAVIGATION → GO TO BuyerOfferPage
                  onPressed: () {
                    Navigator.pushNamed(context, '/buyer-offer');
                  },

                  child: Text(
                    "Browse More",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: GoogleFonts.poppins(
                  fontSize: 14, color: const Color(0xFF8B97A9))),
          Text(value,
              style:
              GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

 */

//==================new updated  code ==========================

/*
// modules/buyer/InquiryReceivedPage.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InquiryReceivedPage extends StatelessWidget {
  final String productName;
  final String grade;
  final String qty;
  final String pricePerKg;
  final int subtotal;
  final int delivery;
  final int total;

  const InquiryReceivedPage({
    super.key,
    required this.productName,
    required this.grade,
    required this.qty,
    required this.pricePerKg,
    required this.subtotal,
    required this.delivery,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF1E73FF)),
        title: Center(child: Text("Inquiry Sent", style: GoogleFonts.poppins(color: const Color(0xFF1E73FF)))),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Icon(Icons.check_circle, size: 88, color: Colors.green.shade500),
            const SizedBox(height: 18),
            Text("Inquiry sent Successfully", style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600, color: const Color(0xFF1E73FF))),
            const SizedBox(height: 10),
            Text("Your inquiry has been sent to the admin, and you will be notified soon.", textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 13, color: const Color(0xFF8B97A9))),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(productName, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700)),
                const SizedBox(height: 6),
                Text(grade, style: GoogleFonts.poppins(fontSize: 13, color: const Color(0xFF8B97A9))),
                const SizedBox(height: 18),
                _row("Quantity", "$qty kg"),
                _row("Price per kg", pricePerKg),
                _row("Subtotal", "₹ $subtotal"),
                _row("Delivery Charges", "₹ $delivery"),
                const SizedBox(height: 8),
                Text("Total charges", style: GoogleFonts.poppins(fontSize: 14, color: const Color(0xFF1E73FF))),
                Text("₹ $total", style: GoogleFonts.poppins(fontSize: 20, color: const Color(0xFF1E73FF), fontWeight: FontWeight.w700)),
              ]),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1E73FF), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                  onPressed: () {
                    // go back to main first route (BuyerMainInquiryPage)
                    Navigator.pushNamedAndRemoveUntil(context, '/buyer-main-inquiry', (route) => false);
                  },
                  child: Text("Browse More", style: GoogleFonts.poppins(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(label, style: GoogleFonts.poppins(fontSize: 14, color: const Color(0xFF8B97A9))),
        Text(value, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
      ]),
    );
  }
}

 */
//---------------------------DELIVEY CHARGE REMOVED
// modules/buyer/InquiryReceivedPage.dart
/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InquiryReceivedPage extends StatelessWidget {
  final String productName;
  final String grade;
  final String qty;
  final String pricePerKg;
  final int subtotal;
  final int delivery;
  final int total;

  const InquiryReceivedPage({
    super.key,
    required this.productName,
    required this.grade,
    required this.qty,
    required this.pricePerKg,
    required this.subtotal,
    required this.delivery,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF1E73FF)),
        title: Center(child: Text("Inquiry Sent", style: GoogleFonts.poppins(color: const Color(0xFF1E73FF)))),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Icon(Icons.check_circle, size: 88, color: Colors.green.shade500),
            const SizedBox(height: 18),
            Text("Inquiry sent Successfully", style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600, color: const Color(0xFF1E73FF))),
            const SizedBox(height: 10),
            Text("Your inquiry has been sent to the admin, and you will be notified soon.", textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 13, color: const Color(0xFF8B97A9))),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(productName, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700)),
                const SizedBox(height: 6),
                Text(grade, style: GoogleFonts.poppins(fontSize: 13, color: const Color(0xFF8B97A9))),
                const SizedBox(height: 18),
                _row("Quantity", "$qty kg"),
                _row("Price per kg", pricePerKg),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F8FA),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subtotal",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: const Color(0xFF1E73FF),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "₹ $subtotal",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: const Color(0xFF1E73FF),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1E73FF), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                  onPressed: () {
                    // go back to main first route (BuyerMainInquiryPage)
                    Navigator.pushNamedAndRemoveUntil(context, '/buyer-main-inquiry', (route) => false);
                  },
                  child: Text("Browse More", style: GoogleFonts.poppins(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(label, style: GoogleFonts.poppins(fontSize: 14, color: const Color(0xFF8B97A9))),
        Text(value, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
      ]),
    );
  }
}


 */

//----------------------------------------------------------accessing   DATA FROM DB--------------------
// modules/buyer/InquiryReceivedPage.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InquiryReceivedPage extends StatelessWidget {
  const InquiryReceivedPage({super.key, required productName, required grade, required pricePerKg, required qty, required subtotal, required delivery, required total});

  @override
  Widget build(BuildContext context) {
    // 🔥 Extract arguments from route
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String productName = args['productName'] ?? '';
    final String grade = args['grade'] ?? '';
    final String qty = args['qty'] ?? '';
    final String pricePerKg = args['pricePerKg'] ?? '';
    final dynamic subtotalValue = args['subtotal'] ?? 0;

    // 🔥 Convert to int safely (handles both int and double)
    final int subtotal = subtotalValue is int ? subtotalValue : (subtotalValue as num).toInt();

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF1E73FF)),
        title: Center(
          child: Text(
            "Inquiry Sent",
            style: GoogleFonts.poppins(color: const Color(0xFF1E73FF)),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Icon(Icons.check_circle, size: 88, color: Colors.green.shade500),
            const SizedBox(height: 18),
            Text(
              "Inquiry sent Successfully",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1E73FF),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Your inquiry has been sent to the admin, and you will be notified soon.",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: const Color(0xFF8B97A9),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    grade,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: const Color(0xFF8B97A9),
                    ),
                  ),
                  const SizedBox(height: 18),
                  _row("Quantity", "$qty MT"),
                  _row("Price per kg", pricePerKg),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F8FA),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subtotal",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: const Color(0xFF1E73FF),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "₹ $subtotal",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: const Color(0xFF1E73FF),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E73FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // go back to main first route (BuyerMainInquiryPage)
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/buyer-main-inquiry',
                          (route) => false,
                    );
                  },
                  child: Text(
                    "Browse More",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: const Color(0xFF8B97A9),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}