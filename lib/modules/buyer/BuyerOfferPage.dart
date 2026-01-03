
//woring UI
/*

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuyerOfferPage extends StatelessWidget {
  final String selectedGrade;
  final String selectedType;

  const BuyerOfferPage({
    super.key,
    required this.selectedGrade,
    required this.selectedType,
  });

  // ---------------------- FIX: NULL SAFE TEXT ----------------------
  String safeText(String? text, String fallback) {
    if (text == null || text == "null" || text.trim().isEmpty) {
      return fallback;
    }
    return text;
  }
  // ---------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    // making sure grade and type NEVER cause null crash
    final String gradeSafe = safeText(selectedGrade, "Unknown Grade");
    final String typeSafe = safeText(selectedType, "Unknown Type");

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      body: Column(
        children: [
          const SizedBox(height: 50),

          // ----------------------------- HEADER -----------------------------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushReplacementNamed(
                    context,
                    "/buyer-main-inquiry",
                  ),
                  child: const Icon(Icons.arrow_back_ios,
                      size: 20, color: Color(0xFF1E73FF)),
                ),
                const SizedBox(width: 10),
                Text(
                  "Polymer Offers",
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1E73FF),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ----------------------------- SEARCH -----------------------------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 46,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.05),
                  )
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Search by Polymer type, grade ...",
                      style: GoogleFonts.poppins(
                          color: Colors.grey.shade500, fontSize: 14),
                    ),
                  ),
                  Image.asset("assets/icons/search.png", height: 20),
                ],
              ),
            ),
          ),

          const SizedBox(height: 18),

          // ----------------------------- FILTER ROW -----------------------------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _filterItem("Price"),
                const SizedBox(width: 18),
                _filterItem("Location"),
                const SizedBox(width: 18),
                _filterItem("Qty"),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // ----------------------------- OFFER LIST -----------------------------
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _offerCard(
                  context,
                  name: "HDPE 7000F",
                  grade: gradeSafe,  // <-- NO crash
                  price: "₹ 30 / Kg",
                  order: "25 MT",
                  mfi: "7.0",
                ),
                const SizedBox(height: 14),

                _offerCard(
                  context,
                  name: "HDPE 5000S",
                  grade: typeSafe, // <-- NO crash
                  price: "₹ 78 / Kg",
                  order: "25 MT",
                  mfi: "7.0",
                ),
                const SizedBox(height: 14),

                _offerCard(
                  context,
                  name: "LLDPE 2420H",
                  grade: "Polyethylene / Film Grade",
                  price: "₹ 92 / Kg",
                  order: "25 MT",
                  mfi: "7.0",
                ),

                const SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),

      // ----------------------------- BOTTOM NAV -----------------------------
      bottomNavigationBar: Container(
        height: 72,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              color: Colors.black.withOpacity(0.08),
              offset: const Offset(0, -1),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _bottomNavItem(
              context,
              label: "Dashboard",
              icon: "nav_dashboard.png",
              isActive: false,
              route: "/buyer-main-inquiry",
            ),
            _bottomNavItem(
              context,
              label: "Listings",
              icon: "nav_listings.png",
              isActive: true,
              route: "/buyer-offer",
            ),
            _bottomNavItem(
              context,
              label: "News",
              icon: "nav_news.png",
              isActive: false,
              route: "/news",
            ),
            _bottomNavItem(
              context,
              label: "Profile",
              icon: "nav_profile.png",
              isActive: false,
              route: "/profile",
            ),
          ],
        ),
      ),
    );
  }

  // =====================================================================
  // FILTER CHIP
  // =====================================================================
  Widget _filterItem(String t) {
    return Row(
      children: [
        Text(
          t,
          style: GoogleFonts.poppins(fontSize: 14, color: const Color(0xFF5D6B7A)),
        ),
        const SizedBox(width: 4),
        Image.asset("assets/icons/keyboard_arrow_down.png", height: 18),
      ],
    );
  }

  // =====================================================================
  // OFFER CARD
  // =====================================================================
  Widget _offerCard(
      BuildContext context, {
        required String name,
        required String grade,
        required String price,
        required String order,
        required String mfi,
      }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/send-inquiry",
          arguments: {
            "name": name,
            "grade": grade,
            "price": price,
            "order": order,
            "mfi": mfi,
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                blurRadius: 6,
                color: Colors.black.withOpacity(0.06),
                offset: const Offset(1, 2))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w700)),
            const SizedBox(height: 4),
            Text(grade,
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.black54)),
            const SizedBox(height: 12),

            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _label("Price"),
                    Text(price,
                        style: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 10),
                    _label("Supplier"),
                    Text("Global Polymers Inc",
                        style: GoogleFonts.poppins(
                            fontSize: 13, fontWeight: FontWeight.w600)),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _label("Min . Order"),
                    Text(order,
                        style: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 10),
                    _label("MFI"),
                    Text(mfi,
                        style: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios,
                    size: 18, color: Color(0xFF1E73FF)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _label(String label) {
    return Text(label,
        style: GoogleFonts.poppins(fontSize: 11, color: Colors.black54));
  }

  // =====================================================================
  // BOTTOM NAVIGATION
  // =====================================================================
  Widget _bottomNavItem(
      BuildContext context, {
        required String label,
        required String icon,
        required bool isActive,
        required String route,
      }) {
    return InkWell(
      onTap: () {
        if (!isActive) {
          Navigator.pushReplacementNamed(context, route);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/icons/$icon",
            height: 22,
            color: isActive ? const Color(0xFF1E73FF) : Colors.black87,
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: isActive ? const Color(0xFF1E73FF) : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
*/

//======================working code with all features====================

 /*
// lib/buyer_offer_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'SendInquiryPage.dart';


class BuyerOfferPage extends StatefulWidget {
  const BuyerOfferPage({super.key, required String selectedGrade, required String selectedType});

  @override
  State<BuyerOfferPage> createState() => _BuyerOfferPageState();
}

class _BuyerOfferPageState extends State<BuyerOfferPage> {
  final TextEditingController searchController = TextEditingController();
  String searchText = "";

  String selectedPrice = "Low → High";
  String selectedQty = "10 MT+";
  String selectedNearby = "Nearby";

  final List<Map<String, dynamic>> allProducts = [
    {
      "name": "HDPE 7000F",
      "grade": "Polyethylene / Film Grade",
      "price": "₹ 30 / Kg",
      "order": "25 MT",
      "mfi": "7.0",
      "location": "Ahmadabad"
    },
    {
      "name": "PP Random 340R",
      "grade": "Polypropylene / Random Copo",
      "price": "₹ 95 / Kg",
      "order": "15 MT",
      "mfi": "12.5",
      "location": "Mumbai"
    },
    {
      "name": "LDPE 2420H",
      "grade": "Polyethylene / Injection",
      "price": "₹ 76 / Kg",
      "order": "10 MT",
      "mfi": "5.3",
      "location": "Delhi"
    },
    // add more sample items if needed
  ];

  List<Map<String, dynamic>> get filteredProducts {
    List<Map<String, dynamic>> list = allProducts.where((p) {
      return p["name"].toString().toLowerCase().contains(searchText.toLowerCase()) ||
          p["grade"].toString().toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    // Example qty filter: only items with order >= 10 MT for "10 MT+" selection
    if (selectedQty == "10 MT+") {
      list = list.where((p) {
        final n = int.tryParse(p["order"].toString().split(" ").first) ?? 0;
        return n >= 10;
      }).toList();
    } else if (selectedQty == "20 MT+") {
      list = list.where((p) {
        final n = int.tryParse(p["order"].toString().split(" ").first) ?? 0;
        return n >= 20;
      }).toList();
    }

    // Nearby filter is just for demo; if "Within 50km" you could sort or filter by location.
    return list;
  }

  Widget filterButton(String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: const Color(0xFFE6EAF0)),
        ),
        child: Row(
          children: [
            Text(label,
                style: GoogleFonts.poppins(fontSize: 13, color: const Color(0xFF344054))),
            const SizedBox(width: 6),
            const Icon(Icons.arrow_drop_down, size: 18, color: Color(0xFF1E73FF))
          ],
        ),
      ),
    );
  }

  void showSortSheet() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("Low → High", style: GoogleFonts.poppins()),
                onTap: () {
                  setState(() => selectedPrice = "Low → High");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("High → Low", style: GoogleFonts.poppins()),
                onTap: () {
                  setState(() => selectedPrice = "High → Low");
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void showQtySheet() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("10 MT+", style: GoogleFonts.poppins()),
                onTap: () {
                  setState(() => selectedQty = "10 MT+");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("20 MT+", style: GoogleFonts.poppins()),
                onTap: () {
                  setState(() => selectedQty = "20 MT+");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("All", style: GoogleFonts.poppins()),
                onTap: () {
                  setState(() => selectedQty = "All");
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void showNearbySheet() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("Nearby", style: GoogleFonts.poppins()),
                onTap: () {
                  setState(() => selectedNearby = "Nearby");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Within 50km", style: GoogleFonts.poppins()),
                onTap: () {
                  setState(() => selectedNearby = "Within 50km");
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _cell(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: GoogleFonts.poppins(fontSize: 11, color: const Color(0xFF8B97A9))),
        const SizedBox(height: 6),
        Text(value,
            style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Polymer Market",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF1E73FF),
                        fontSize: 26,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Search
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Color(0xFF9AA6B2)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        onChanged: (v) => setState(() => searchText = v),
                        decoration: InputDecoration(
                          hintText: "Search by Polymer type, grade ...",
                          border: InputBorder.none,
                          hintStyle: GoogleFonts.poppins(color: const Color(0xFFBFC6D0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Filters row
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  filterButton("Price", showSortSheet),
                  const SizedBox(width: 10),
                  filterButton("Qty", showQtySheet),
                  const SizedBox(width: 10),
                  filterButton("Nearby", showNearbySheet),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Product list
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final p = filteredProducts[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SendInquiryPage(product: p),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(p["name"],
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w700)),
                          const SizedBox(height: 6),
                          Text(p["grade"],
                              style: GoogleFonts.poppins(
                                  fontSize: 12, color: const Color(0xFF8B97A9))),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _cell("Price", p["price"]),
                              _cell("Min . Order", p["order"]),
                              _cell("MFI", p["mfi"]),
                              const Icon(Icons.arrow_forward_ios,
                                  size: 18, color: Color(0xFF1E73FF)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

  */

//-----------------with debouncing--------------------

/*
// lib/buyer_offer_page.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'SendInquiryPage.dart';

class BuyerOfferPage extends StatefulWidget {
  const BuyerOfferPage({super.key, required String selectedGrade, required String selectedType});

  @override
  State<BuyerOfferPage> createState() => _BuyerOfferPageState();
}

class _BuyerOfferPageState extends State<BuyerOfferPage> {
  final TextEditingController searchController = TextEditingController();
  String searchText = "";

  /// 🔵 Debouncer timer
  Timer? _debounce;

  String selectedPrice = "Low → High";
  String selectedQty = "10 MT+";
  String selectedNearby = "Nearby";

  final List<Map<String, dynamic>> allProducts = [
    {
      "name": "HDPE 7000F",
      "grade": "Polyethylene / Film Grade",
      "price": "₹ 30 / Kg",
      "order": "25 MT",
      "mfi": "7.0",
      "location": "Ahmedabad"
    },
    {
      "name": "PP Random 340R",
      "grade": "Polypropylene / Random Copo",
      "price": "₹ 95 / Kg",
      "order": "15 MT",
      "mfi": "12.5",
      "location": "Mumbai"
    },
    {
      "name": "LDPE 2420H",
      "grade": "Polyethylene / Injection",
      "price": "₹ 76 / Kg",
      "order": "10 MT",
      "mfi": "5.3",
      "location": "Delhi"
    },
  ];

  /// 🔍 FILTER LOGIC
  List<Map<String, dynamic>> get filteredProducts {
    List<Map<String, dynamic>> list = allProducts.where((p) {
      return p["name"].toString().toLowerCase().contains(searchText.toLowerCase()) ||
          p["grade"].toString().toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    if (selectedQty == "10 MT+") {
      list = list.where((p) {
        final n = int.tryParse(p["order"].toString().split(" ").first) ?? 0;
        return n >= 10;
      }).toList();
    } else if (selectedQty == "20 MT+") {
      list = list.where((p) {
        final n = int.tryParse(p["order"].toString().split(" ").first) ?? 0;
        return n >= 20;
      }).toList();
    }

    return list;
  }

  /// 🕒 Debounced Search Method
  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 300), () {
      setState(() {
        searchText = value;
      });
    });
  }

  /// Clean Resource on Exit
  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  /// FILTER BUTTON WIDGET
  Widget filterButton(String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: const Color(0xFFE6EAF0)),
        ),
        child: Row(
          children: [
            Text(label,
                style: GoogleFonts.poppins(fontSize: 13, color: const Color(0xFF344054))),
            const SizedBox(width: 6),
            const Icon(Icons.arrow_drop_down, size: 18, color: Color(0xFF1E73FF))
          ],
        ),
      ),
    );
  }

  /// SORT BOTTOM SHEET
  void showSortSheet() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("Low → High", style: GoogleFonts.poppins()),
                onTap: () {
                  setState(() => selectedPrice = "Low → High");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("High → Low", style: GoogleFonts.poppins()),
                onTap: () {
                  setState(() => selectedPrice = "High → Low");
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /// QTY SHEET
  void showQtySheet() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("10 MT+", style: GoogleFonts.poppins()),
                onTap: () {
                  setState(() => selectedQty = "10 MT+");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("20 MT+", style: GoogleFonts.poppins()),
                onTap: () {
                  setState(() => selectedQty = "20 MT+");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("All", style: GoogleFonts.poppins()),
                onTap: () {
                  setState(() => selectedQty = "All");
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /// NEARBY SHEET
  void showNearbySheet() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("Nearby", style: GoogleFonts.poppins()),
                onTap: () {
                  setState(() => selectedNearby = "Nearby");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Within 50km", style: GoogleFonts.poppins()),
                onTap: () {
                  setState(() => selectedNearby = "Within 50km");
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _cell(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: GoogleFonts.poppins(fontSize: 11, color: const Color(0xFF8B97A9))),
        const SizedBox(height: 6),
        Text(value,
            style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),

            /// TITLE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Polymer Market",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF1E73FF),
                        fontSize: 26,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            /// SEARCH BOX WITH DEBOUNCE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Color(0xFF9AA6B2)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        onChanged: _onSearchChanged,
                        decoration: InputDecoration(
                          hintText: "Search by Polymer type, grade ...",
                          border: InputBorder.none,
                          hintStyle: GoogleFonts.poppins(color: const Color(0xFFBFC6D0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            /// FILTERS ROW
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  filterButton("Price", showSortSheet),
                  const SizedBox(width: 10),
                  filterButton("Qty", showQtySheet),
                  const SizedBox(width: 10),
                  filterButton("Nearby", showNearbySheet),
                ],
              ),
            ),

            const SizedBox(height: 12),

            /// LIST
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final p = filteredProducts[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SendInquiryPage(product: p),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(p["name"],
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w700)),
                          const SizedBox(height: 6),
                          Text(p["grade"],
                              style: GoogleFonts.poppins(
                                  fontSize: 12, color: const Color(0xFF8B97A9))),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _cell("Price", p["price"]),
                              _cell("Min . Order", p["order"]),
                              _cell("MFI", p["mfi"]),
                              const Icon(Icons.arrow_forward_ios,
                                  size: 18, color: Color(0xFF1E73FF)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

 */

