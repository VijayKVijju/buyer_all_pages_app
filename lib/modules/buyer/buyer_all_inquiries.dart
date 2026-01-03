// buyer_all_inquiries.dart

/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuyerAllInquiries extends StatefulWidget {
  const BuyerAllInquiries({super.key, required String selectedGrade, required String selectedType});

  @override
  State<BuyerAllInquiries> createState() => _BuyerAllInquiriesState();
}

class _BuyerAllInquiriesState extends State<BuyerAllInquiries> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  static const double _horizontalPadding = 16.0;
  static const double _bottomNavHeight = 70.0;

  final List<Map<String, dynamic>> inquiries = [
    {
      "name": "HDPE 7000F",
      "grade": "Polyethylene / Film Grade",
      "qty": "18 MT",
      "price": "₹ 437654",
      "date": "June 15, 2025",
      "status": "Completed",
      "reason": null,
    },
    {
      "name": "LDPE 24FS",
      "grade": "Polyethylene / Coating Grade",
      "qty": "30 MT",
      "price": "₹ 528000",
      "date": "June 18, 2025",
      "status": "Pending",
      "reason": null,
    },
    {
      "name": "PP 110MA",
      "grade": "Polypropylene / Injection Grade",
      "qty": "20 MT",
      "price": "₹ 312000",
      "date": "June 20, 2025",
      "status": "Rejected",
      "reason": "Insufficient stock at supplier end.",
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  Color _statusColor(String s) {
    switch (s.toLowerCase()) {
      case 'completed':
        return const Color(0xFF2E7D32);
      case 'pending':
        return const Color(0xFFF5C76F);
      case 'rejected':
        return const Color(0xFFE57373);
      default:
        return Colors.grey;
    }
  }

  List<Map<String, dynamic>> _filterByTab(int index) {
    switch (index) {
      case 1:
        return inquiries.where((i) => i['status'].toString().toLowerCase() == 'pending').toList();
      case 2:
        return inquiries.where((i) => i['status'].toString().toLowerCase() == 'completed').toList();
      case 3:
        return inquiries.where((i) => i['status'].toString().toLowerCase() == 'rejected').toList();
      case 0:
      default:
        return inquiries;
    }
  }

  Widget _bottomNavigationBar() {
    return SafeArea(
      top: false,
      child: Container(
        height: _bottomNavHeight,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Color(0x14000000), blurRadius: 8, offset: Offset(0, -2))],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem("assets/icons/nav_dashboard.png", "Dashboard", false, () => Navigator.pop(context)),
            _navItem("assets/icons/nav_listings.png", "Inquiries", true, () {}),
            _navItem("assets/icons/nav_news.png", "News", false, () {}),
            _navItem("assets/icons/nav_profile.png", "Profile", false, () {}),
          ],
        ),
      ),
    );
  }

  Widget _navItem(String asset, String label, bool active, VoidCallback onTap) {
    final color = active ? const Color(0xFF1E73FF) : Colors.black54;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(asset, width: 22, height: 22, color: color, errorBuilder: (_, __, ___) => Icon(Icons.circle, size: 20, color: color)),
          const SizedBox(height: 6),
          Text(label, style: GoogleFonts.poppins(fontSize: 12, color: color)),
        ],
      ),
    );
  }

  Widget _statusBadge(String status) {
    final c = _statusColor(status);
    final bg = c.withOpacity(0.12);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)),
      child: Text(status, style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: c)),
    );
  }

  Widget _inquiryCard(Map<String, dynamic> q) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE8EEF2)),
        boxShadow: const [BoxShadow(color: Color(0x0A000000), blurRadius: 6, offset: Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text(q['name'], style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700))),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(q['date'], style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 8),
                  _statusBadge(q['status']),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(q['grade'], style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(q['qty'], style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600)),
              Text(q['price'], style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600)),
            ],
          ),
          if ((q['status'] as String).toLowerCase() == 'rejected') ...[
            const SizedBox(height: 12),
            Text("Reason", style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            Text(q['reason'] ?? '', style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey)),
          ],
        ],
      ),
    );
  }

  Widget _tabBar() {
    return TabBar(
      controller: _tabController,
      indicatorColor: const Color(0xFF1E73FF),
      labelColor: const Color(0xFF1E73FF),
      unselectedLabelColor: Colors.black54,
      labelStyle: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),
      unselectedLabelStyle: GoogleFonts.poppins(fontSize: 14),
      tabs: const [
        Tab(text: "All"),
        Tab(text: "Pending"),
        Tab(text: "Completed"),
        Tab(text: "Rejected"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      bottomNavigationBar: _bottomNavigationBar(),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
              child: Row(
                children: [
                  Expanded(child: Text("My Inquiries", style: GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w700))),
                  // optional action icons if needed in future
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding), child: _tabBar()),
            const SizedBox(height: 12),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: List.generate(4, (index) {
                  final list = _filterByTab(index);
                  if (list.isEmpty) {
                    return Center(child: Text("No inquiries", style: GoogleFonts.poppins(color: Colors.grey)));
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
                    itemCount: list.length,
                    itemBuilder: (context, i) => _inquiryCard(list[i]),
                  );
                }),
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

// ✅ COMMON BOTTOM NAV
import 'BottomNavBar.dart';

class BuyerAllInquiries extends StatefulWidget {
  const BuyerAllInquiries({
    super.key,
    required String selectedGrade,
    required String selectedType,
  });

  @override
  State<BuyerAllInquiries> createState() => _BuyerAllInquiriesState();
}

class _BuyerAllInquiriesState extends State<BuyerAllInquiries>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  static const double _horizontalPadding = 16.0;

  final List<Map<String, dynamic>> inquiries = [
    {
      "name": "HDPE 7000F",
      "grade": "Polyethylene / Film Grade",
      "qty": "18 MT",
      "price": "₹ 437654",
      "date": "June 15, 2025",
      "status": "Completed",
      "reason": null,
    },
    {
      "name": "LDPE 24FS",
      "grade": "Polyethylene / Coating Grade",
      "qty": "30 MT",
      "price": "₹ 528000",
      "date": "June 18, 2025",
      "status": "Pending",
      "reason": null,
    },
    {
      "name": "PP 110MA",
      "grade": "Polypropylene / Injection Grade",
      "qty": "20 MT",
      "price": "₹ 312000",
      "date": "June 20, 2025",
      "status": "Rejected",
      "reason": "Insufficient stock at supplier end.",
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  Color _statusColor(String s) {
    switch (s.toLowerCase()) {
      case 'completed':
        return const Color(0xFF2E7D32);
      case 'pending':
        return const Color(0xFFF5C76F);
      case 'rejected':
        return const Color(0xFFE57373);
      default:
        return Colors.grey;
    }
  }

  List<Map<String, dynamic>> _filterByTab(int index) {
    switch (index) {
      case 1:
        return inquiries
            .where((i) =>
        i['status'].toString().toLowerCase() == 'pending')
            .toList();
      case 2:
        return inquiries
            .where((i) =>
        i['status'].toString().toLowerCase() == 'completed')
            .toList();
      case 3:
        return inquiries
            .where((i) =>
        i['status'].toString().toLowerCase() == 'rejected')
            .toList();
      case 0:
      default:
        return inquiries;
    }
  }

  Widget _statusBadge(String status) {
    final c = _statusColor(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: c.withOpacity(0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        status,
        style: GoogleFonts.poppins(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: c,
        ),
      ),
    );
  }

  Widget _inquiryCard(Map<String, dynamic> q) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE8EEF2)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 6,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  q['name'],
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    q['date'],
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _statusBadge(q['status']),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            q['grade'],
            style:
            GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                q['qty'],
                style: GoogleFonts.poppins(
                    fontSize: 15, fontWeight: FontWeight.w600),
              ),
              Text(
                q['price'],
                style: GoogleFonts.poppins(
                    fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          if ((q['status'] as String).toLowerCase() == 'rejected') ...[
            const SizedBox(height: 12),
            Text(
              "Reason",
              style: GoogleFonts.poppins(
                  fontSize: 13, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            Text(
              q['reason'] ?? '',
              style: GoogleFonts.poppins(
                  fontSize: 13, color: Colors.grey),
            ),
          ],
        ],
      ),
    );
  }

  Widget _tabBar() {
    return TabBar(
      controller: _tabController,
      indicatorColor: const Color(0xFF1E73FF),
      labelColor: const Color(0xFF1E73FF),
      unselectedLabelColor: Colors.black54,
      labelStyle: GoogleFonts.poppins(
          fontSize: 14, fontWeight: FontWeight.w600),
      unselectedLabelStyle:
      GoogleFonts.poppins(fontSize: 14),
      tabs: const [
        Tab(text: "All"),
        Tab(text: "Pending"),
        Tab(text: "Completed"),
        Tab(text: "Rejected"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),

      // ✅ SHARED BOTTOM NAV (Inquiries active)
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),

      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: _horizontalPadding),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "My Inquiries",
                      style: GoogleFonts.poppins(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: _horizontalPadding),
              child: _tabBar(),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: List.generate(4, (index) {
                  final list = _filterByTab(index);
                  if (list.isEmpty) {
                    return Center(
                      child: Text(
                        "No inquiries",
                        style:
                        GoogleFonts.poppins(color: Colors.grey),
                      ),
                    );
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: _horizontalPadding),
                    itemCount: list.length,
                    itemBuilder: (context, i) =>
                        _inquiryCard(list[i]),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}