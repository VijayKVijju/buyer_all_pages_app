
//===================old UI with proper woeking main page
/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'BuyerOfferPage.dart';


class BuyerMainInquiryPage extends StatefulWidget {
  const BuyerMainInquiryPage({super.key});

  @override
  State<BuyerMainInquiryPage> createState() => _BuyerMainInquiryPageState();
}

class _BuyerMainInquiryPageState extends State<BuyerMainInquiryPage> {
  String? selectedGrade;
  String? selectedType;
  TextEditingController qtyController = TextEditingController();

  final grades = ["HDPE", "LDPE", "PP"];
  final types = ["Film Grade", "Injection Grade", "Blow Moulding"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      bottomNavigationBar: _bottomNavigationBar(),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              // ---------------- TITLE ----------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Polymer Offers",
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1E73FF),
                    ),
                  ),
                  Image.asset("assets/icons/bell.png", width: 26),
                ],
              ),

              const SizedBox(height: 18),

              // ---------------- SEARCH BAR ----------------
              _searchBar(),

              const SizedBox(height: 20),

              // ---------------- FILTER CARD ----------------
              _filterCard(),

              const SizedBox(height: 30),

              // ---------------- ORDER SUMMARY ----------------
              _header("Order Summary", "View All"),
              const SizedBox(height: 12),

              _orderCard("LDPE Film Grade", "20 MT", "Completed"),
              const SizedBox(height: 10),
              _orderCard("HMEL P33D5", "29 MT", "Processing"),
              const SizedBox(height: 10),
              _orderCard("LDPE Film Grade", "20 MT", "Completed"),

              const SizedBox(height: 30),

              // ---------------- NEW OFFERS ----------------
              _header("New Offers", "View All"),
              const SizedBox(height: 14),

              _newOfferCard("HDPE 7000F", "Polyethylene / Film Grade", "₹ 30 / Kg"),
              const SizedBox(height: 12),
              _newOfferCard("HDPE 5000S", "Polyethylene / Film Grade", "₹ 78 / Kg"),
              const SizedBox(height: 12),
              _newOfferCard("LLDPE 2420H", "Polyethylene / Film Grade", "₹ 92 / Kg"),

              const SizedBox(height: 90),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- SEARCH BAR ----------------
  Widget _searchBar() {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Search by Polymer type, grade ...",
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
            ),
          ),
          Image.asset("assets/icons/search.png", width: 22),
        ],
      ),
    );
  }

  // ---------------- FILTER CARD ----------------
  Widget _filterCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _filterLabel("Polymer Grade"),
          const SizedBox(height: 6),
          _dropdownContainer(
            hint: "Select Your Grade",
            value: selectedGrade,
            items: grades,
            onChanged: (v) => setState(() => selectedGrade = v),
          ),

          const SizedBox(height: 18),

          _filterLabel("Polymer Type"),
          const SizedBox(height: 6),
          _dropdownContainer(
            hint: "Select Polymer Type",
            value: selectedType,
            items: types,
            onChanged: (v) => setState(() => selectedType = v),
          ),

          const SizedBox(height: 20),

          _filterLabel("Quantity"),
          const SizedBox(height: 6),

          Container(
            width: 120,
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: qtyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "MT",
                hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
              ),
            ),
          ),

          const SizedBox(height: 22),

          // ---------------- BUTTON ----------------
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BuyerOfferPage(
                      selectedGrade: selectedGrade ?? "",
                      selectedType: selectedType ?? "",
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E73FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Raise Inquiry",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text _filterLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(fontSize: 13, color: Colors.black87),
    );
  }

  // ---------------- DROPDOWN ----------------
  Widget _dropdownContainer({
    required String hint,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        underline: const SizedBox(),
        icon: Image.asset("assets/icons/keyboard_arrow_down.png", width: 20),
        hint: Text(hint, style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey)),
        value: value,
        items: items
            .map((e) => DropdownMenuItem<String>(
          value: e,
          child: Text(e, style: const TextStyle(fontSize: 14)),
        ))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }

  // ---------------- HEADERS ----------------
  Widget _header(String title, String action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600)),
        Text(action,
            style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color: const Color(0xFF1E73FF))),
      ],
    );
  }

  // ---------------- ORDER CARD ----------------
  Widget _orderCard(String title, String qty, String status) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Image.asset("assets/icons/truck-delivery.png", width: 32),
          const SizedBox(width: 14),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600)),
              Text(qty, style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
            ],
          ),
          const Spacer(),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: status == "Completed" ? const Color(0xFFDCF7E6) : const Color(0xFFFFE9C7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontSize: 12,
                color: status == "Completed" ? const Color(0xFF2EA64B) : const Color(0xFFB88600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- NEW OFFER CARD ----------------
  Widget _newOfferCard(String title, String subtitle, String price) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          Text(subtitle, style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 12),

          Row(
            children: [
              const Text("Price", style: TextStyle(fontSize: 13, color: Colors.grey)),
              const Spacer(),
              Text(price,
                  style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------- BOTTOM NAV BAR ----------------
  Widget _bottomNavigationBar() {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem("Dashboard", "nav_dashboard.png", true),
          _navItem("Listings", "nav_listings.png", false),
          _navItem("News", "nav_news.png", false),
          _navItem("Profile", "nav_profile.png", false),
        ],
      ),
    );
  }

  Widget _navItem(String text, String icon, bool selected) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/icons/$icon",
            width: 24, color: selected ? const Color(0xFF1E73FF) : Colors.black54),
        const SizedBox(height: 4),
        Text(text,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: selected ? const Color(0xFF1E73FF) : Colors.black54,
            )),
      ],
    );
  }
}

 */
//================================new UI with properly working  buyer main page======================
/*
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuyerMainInquiryPage extends StatefulWidget {
  const BuyerMainInquiryPage({super.key, required String selectedGrade, required String selectedType});

  @override
  State<BuyerMainInquiryPage> createState() => _BuyerMainInquiryPageState();
}

class _BuyerMainInquiryPageState extends State<BuyerMainInquiryPage> {
  TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  List<Map<String, dynamic>> products = [
    {
      "name": "HDPE 7000F",
      "category": "Polyethylene / Film Grade",
      "price": "₹ 30 / Kg",
      "order": "25 MT",
      "mfi": "7.0",
    },
    {
      "name": "HDPE 7000F",
      "category": "Polyethylene / Film Grade",
      "price": "₹ 30 / Kg",
      "order": "25 MT",
      "mfi": "7.0",
    },
    {
      "name": "HDPE 7000F",
      "category": "Polyethylene / Film Grade",
      "price": "₹ 30 / Kg",
      "order": "25 MT",
      "mfi": "7.0",
    },
    {
      "name": "HDPE 7000F",
      "category": "Polyethylene / Film Grade",
      "price": "₹ 30 / Kg",
      "order": "25 MT",
      "mfi": "7.0",
    },
  ];

  List<Map<String, dynamic>> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = products;
  }

  void debounceSearch(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        filteredProducts = products
            .where((item) => item['name']
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase()))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // --------------------- Bottom Navigation ------------------------
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 10, top: 5),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 4),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            navItem(Icons.dashboard, "Dashboard", true),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/buyer-all-inquiries"),
              child: navItem(Icons.list_alt, "Inquiries", false),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/news"),
              child: navItem(Icons.newspaper, "News", false),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/profile"),
              child: navItem(Icons.person, "Profile", false),
            ),
          ],
        ),
      ),

      // --------------------------- Body -------------------------------
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // ------------------ Location + icons ---------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.blue),
                      const SizedBox(width: 4),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Location",
                              style: GoogleFonts.poppins(
                                  fontSize: 10, color: Colors.grey)),
                          Text("Ahmadabad , Ghujarat",
                              style: GoogleFonts.poppins(
                                  fontSize: 13, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.notifications_outlined, size: 26),
                      SizedBox(width: 15),
                      CircleAvatar(
                        radius: 15,
                        backgroundImage:
                        AssetImage("assets/profile_placeholder.png"),
                      )
                    ],
                  )
                ],
              ),

              const SizedBox(height: 20),

              // ------------------ Polymer Market title -----------------
              Text("Welcome to",
                  style: GoogleFonts.poppins(
                      fontSize: 12, color: Colors.grey.shade700)),
              Text("Polymer Market",
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade700,
                  )),

              const SizedBox(height: 15),

              // ------------------- Search Bar -------------------------
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: searchController,
                  onChanged: debounceSearch,
                  decoration: InputDecoration(
                    hintText: "Search by Polymer type, grade ...",
                    border: InputBorder.none,
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 14, color: Colors.grey),
                    suffixIcon:
                    const Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // ---------------- Filter Chips ------------------------
              Row(
                children: [
                  filterChip("Price"),
                  const SizedBox(width: 8),
                  filterChip("Qty"),
                  const SizedBox(width: 8),
                  filterChip("Nearby"),
                ],
              ),

              const SizedBox(height: 15),

              // ---------------- Product Listing ----------------------
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final p = filteredProducts[index];
                  return buildProductCard(p);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- Widgets -----------------------

  Widget navItem(IconData icon, String label, bool active) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: active ? Colors.blue : Colors.black54),
        Text(label,
            style: GoogleFonts.poppins(
                fontSize: 12,
                color: active ? Colors.blue : Colors.black54)),
      ],
    );
  }

  Widget filterChip(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Text(title,
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: Colors.black87,
              )),
          const Icon(Icons.swap_vert, size: 16)
        ],
      ),
    );
  }

  Widget buildProductCard(Map<String, dynamic> p) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(p["name"],
              style:
              GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(p["category"],
              style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey)),

          const SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildInfo("Price", p["price"]),
              buildInfo("Min . Order", p["order"]),
              buildInfo("MFI", p["mfi"]),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blue),
            ],
          )
        ],
      ),
    );
  }

  Widget buildInfo(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: GoogleFonts.poppins(fontSize: 11, color: Colors.grey)),
        Text(value,
            style:
            GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

 */
//''''''''''''''''sample navigation
//----------------------------------WORKING FINE-------------
/*
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuyerMainInquiryPage extends StatefulWidget {
  const BuyerMainInquiryPage({super.key, required String selectedGrade, required String selectedType});

  @override
  State<BuyerMainInquiryPage> createState() => _BuyerMainInquiryPageState();
}

class _BuyerMainInquiryPageState extends State<BuyerMainInquiryPage> {
  TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  List<Map<String, dynamic>> products = [
    {
      "name": "HDPE 7000F",
      "category": "Polyethylene / Film Grade",
      "price": "₹ 30 / Kg",
      "order": "25 MT",
      "mfi": "7.0",
    },
    {
      "name": "HDPE 7000F",
      "category": "Polyethylene / Film Grade",
      "price": "₹ 30 / Kg",
      "order": "25 MT",
      "mfi": "7.0",
    },
    {
      "name": "HDPE 7000F",
      "category": "Polyethylene / Film Grade",
      "price": "₹ 30 / Kg",
      "order": "25 MT",
      "mfi": "7.0",
    },
    {
      "name": "HDPE 7000F",
      "category": "Polyethylene / Film Grade",
      "price": "₹ 30 / Kg",
      "order": "25 MT",
      "mfi": "7.0",
    },
  ];

  List<Map<String, dynamic>> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = products;
  }

  void debounceSearch(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        filteredProducts = products
            .where((item) => item['name']
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase()))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // --------------------- Bottom Navigation ------------------------
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 10, top: 5),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 4),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            // Dashboard (already active page → do nothing)
            navItem(Icons.dashboard, "Dashboard", true),

// Inquiries
        GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(
            context,
            "/buyer-all-inquiries",
          ),
          child: navItem(Icons.list_alt, "Inquiries", false),
        ),

// News  ❗ FIXED ROUTE NAME
        GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(
            context,
            "/market-news",
          ),
          child: navItem(Icons.newspaper, "News", false),
        ),

// Profile
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, "/profile"),
          child: navItem(Icons.person, "Profile", false),
        ),
          ]),
    ),


      // --------------------------- Body -------------------------------
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // ------------------ Location + icons ---------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.blue),
                      const SizedBox(width: 4),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Location",
                              style: GoogleFonts.poppins(
                                  fontSize: 10, color: Colors.grey)),
                          Text("Ahmadabad , Ghujarat",
                              style: GoogleFonts.poppins(
                                  fontSize: 13, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.notifications_outlined, size: 26),
                      SizedBox(width: 15),
                      CircleAvatar(
                        radius: 15,
                        backgroundImage:
                        AssetImage("assets/profile_placeholder.png"),
                      )
                    ],
                  )
                ],
              ),

              const SizedBox(height: 20),

              // ------------------ Polymer Market title -----------------
              Text("Welcome to",
                  style: GoogleFonts.poppins(
                      fontSize: 12, color: Colors.grey.shade700)),
              Text("Polymer Market",
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade700,
                  )),

              const SizedBox(height: 15),

              // ------------------- Search Bar -------------------------
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: searchController,
                  onChanged: debounceSearch,
                  decoration: InputDecoration(
                    hintText: "Search by Polymer type, grade ...",
                    border: InputBorder.none,
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 14, color: Colors.grey),
                    suffixIcon:
                    const Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // ---------------- Filter Chips ------------------------
              Row(
                children: [
                  filterChip("Price"),
                  const SizedBox(width: 8),
                  filterChip("Qty"),
                  const SizedBox(width: 8),
                  filterChip("Nearby"),
                ],
              ),

              const SizedBox(height: 15),

              // ---------------- Product Listing ----------------------
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final p = filteredProducts[index];
                  return buildProductCard(p);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- Widgets -----------------------

  Widget navItem(IconData icon, String label, bool active) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: active ? Colors.blue : Colors.black54),
        Text(label,
            style: GoogleFonts.poppins(
                fontSize: 12,
                color: active ? Colors.blue : Colors.black54)),
      ],
    );
  }

  Widget filterChip(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Text(title,
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: Colors.black87,
              )),
          const Icon(Icons.swap_vert, size: 16)
        ],
      ),
    );
  }

  Widget buildProductCard(Map<String, dynamic> p) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(p["name"],
              style:
              GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(p["category"],
              style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey)),

          const SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildInfo("Price", p["price"]),
              buildInfo("Min . Order", p["order"]),
              buildInfo("MFI", p["mfi"]),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blue),
            ],
          )
        ],
      ),
    );
  }

  Widget buildInfo(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: GoogleFonts.poppins(fontSize: 11, color: Colors.grey)),
        Text(value,
            style:
            GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
*/
//--------------------------------
/*
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuyerMainInquiryPage extends StatefulWidget {
  const BuyerMainInquiryPage({
    super.key,
    required String selectedGrade,
    required String selectedType,
  });

  @override
  State<BuyerMainInquiryPage> createState() => _BuyerMainInquiryPageState();
}

class _BuyerMainInquiryPageState extends State<BuyerMainInquiryPage> {
  TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  List<Map<String, dynamic>> products = [
    {
      "name": "HDPE 7000F",
      "category": "Polyethylene / Film Grade",
      "price": "₹ 30 / Kg",
      "order": "25 MT",
      "mfi": "7.0",
    },
    {
      "name": "HDPE 7000F",
      "category": "Polyethylene / Film Grade",
      "price": "₹ 30 / Kg",
      "order": "25 MT",
      "mfi": "7.0",
    },
    {
      "name": "HDPE 7000F",
      "category": "Polyethylene / Film Grade",
      "price": "₹ 30 / Kg",
      "order": "25 MT",
      "mfi": "7.0",
    },
    {
      "name": "HDPE 7000F",
      "category": "Polyethylene / Film Grade",
      "price": "₹ 30 / Kg",
      "order": "25 MT",
      "mfi": "7.0",
    },
  ];

  List<Map<String, dynamic>> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = products;
  }

  void debounceSearch(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        filteredProducts = products
            .where((item) =>
            item['name']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ================= BOTTOM NAVIGATION =================
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 10, top: 5),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 4),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Dashboard (current)
            navItem(Icons.dashboard, "Dashboard", true),

            // Inquiries
            GestureDetector(
              onTap: () => Navigator.pushReplacementNamed(
                context,
                "/buyer-all-inquiries",
              ),
              child: navItem(Icons.list_alt, "Inquiries", false),
            ),

            // News
            GestureDetector(
              onTap: () => Navigator.pushReplacementNamed(
                context,
                "/market-news",
              ),
              child: navItem(Icons.newspaper, "News", false),
            ),

            // Profile
            GestureDetector(
              onTap: () => Navigator.pushReplacementNamed(
                context,
                "/profile",
              ),
              child: navItem(Icons.person, "Profile", false),
            ),
          ],
        ),
      ),

      // ================= BODY =================
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // -------- Location & Icons --------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.blue),
                      const SizedBox(width: 4),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Location",
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "Ahmadabad , Ghujarat",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.notifications_outlined, size: 26),
                      SizedBox(width: 15),
                      CircleAvatar(
                        radius: 15,
                        backgroundImage:
                        AssetImage("assets/profile_placeholder.png"),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // -------- Title --------
              Text(
                "Welcome to",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey.shade700,
                ),
              ),
              Text(
                "Polymer Market",
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700,
                ),
              ),

              const SizedBox(height: 15),

              // -------- Search Bar --------
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: searchController,
                  onChanged: debounceSearch,
                  decoration: InputDecoration(
                    hintText: "Search by Polymer type, grade ...",
                    border: InputBorder.none,
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    suffixIcon:
                    const Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // -------- Filter Chips --------
              Row(
                children: [
                  filterChip("Price"),
                  const SizedBox(width: 8),
                  filterChip("Qty"),
                  const SizedBox(width: 8),
                  filterChip("Nearby"),
                ],
              ),

              const SizedBox(height: 15),

              // -------- Product List --------
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  return buildProductCard(filteredProducts[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= WIDGETS =================

  Widget navItem(IconData icon, String label, bool active) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: active ? Colors.blue : Colors.black54),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: active ? Colors.blue : Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget filterChip(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: Colors.black87,
            ),
          ),
          const Icon(Icons.swap_vert, size: 16),
        ],
      ),
    );
  }

  Widget buildProductCard(Map<String, dynamic> p) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            p["name"],
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            p["category"],
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildInfo("Price", p["price"]),
              buildInfo("Min . Order", p["order"]),
              buildInfo("MFI", p["mfi"]),
              const Icon(Icons.arrow_forward_ios,
                  size: 16, color: Colors.blue),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildInfo(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 11,
            color: Colors.grey,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

 */
//==============================new implementation working fine
/*
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuyerMainInquiryPage extends StatefulWidget {
  const BuyerMainInquiryPage({
    super.key,
    required this.selectedGrade,
    required this.selectedType,
  });

  final String selectedGrade;
  final String selectedType;

  @override
  State<BuyerMainInquiryPage> createState() => _BuyerMainInquiryPageState();
}

class _BuyerMainInquiryPageState extends State<BuyerMainInquiryPage> {
  final TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  // ---------------- PRODUCTS ----------------
  final List<Map<String, dynamic>> products = [
    {
      "name": "HDPE 7000F",
      "category": "Polyethylene / Film Grade",
      "price": "₹ 30 / Kg",
      "order": "25 MT",
      "mfi": "7.0",
      "location": "Ahmedabad",
      "grade": "7000F",
    },
    {
      "name": "LDPE 2420H",
      "category": "Polyethylene / Injection Grade",
      "price": "₹ 92 / Kg",
      "order": "10 MT",
      "mfi": "2.0",
      "location": "Mumbai",
      "grade": "2420H",
    },
    {
      "name": "PP HM012",
      "category": "Polypropylene",
      "price": "₹ 84 / Kg",
      "order": "15 MT",
      "mfi": "12",
      "location": "Delhi",
      "grade": "HM012",
    },
  ];

  List<Map<String, dynamic>> filteredProducts = [];
  String activeFilter = "";

  @override
  void initState() {
    super.initState();
    filteredProducts = List.from(products);
  }

  // ---------------- DEBOUNCE SEARCH ----------------
  void debounceSearch(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 400), () {
      setState(() {
        filteredProducts = products.where((p) {
          return p["name"]
              .toLowerCase()
              .contains(query.toLowerCase());
        }).toList();
      });
    });
  }

  // ---------------- FILTER LOGIC ----------------
  void applyFilter(String type) {
    setState(() {
      activeFilter = type;

      if (type == "Price") {
        filteredProducts.sort((a, b) =>
            _price(a).compareTo(_price(b)));
      } else if (type == "Qty") {
        filteredProducts.sort((a, b) =>
            _qty(b).compareTo(_qty(a)));
      } else {
        filteredProducts = List.from(products);
      }
    });
  }

  int _price(Map p) =>
      int.parse(p["price"].replaceAll(RegExp(r'[^0-9]'), ''));
  int _qty(Map p) =>
      int.parse(p["order"].replaceAll(RegExp(r'[^0-9]'), ''));

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ================= BOTTOM NAV =================
      bottomNavigationBar: _bottomNav(),

      // ================= BODY =================
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _topBar(),
              const SizedBox(height: 20),
              _title(),
              const SizedBox(height: 15),
              _searchBar(),
              const SizedBox(height: 10),
              _filters(),
              const SizedBox(height: 15),

              // ---------------- PRODUCT LIST ----------------
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final p = filteredProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/send-inquiry',
                        arguments: {"product": p},
                      );
                    },
                    child: _productCard(p),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= WIDGETS =================

  Widget _bottomNav() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, top: 6),
      decoration: const BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.dashboard, "Dashboard", true),
          _navTap(Icons.list_alt, "Inquiries", "/buyer-all-inquiries"),
          _navTap(Icons.newspaper, "News", "/market-news"),
          _navTap(Icons.person, "Profile", "/profile"),
        ],
      ),
    );
  }

  Widget _navTap(IconData icon, String label, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacementNamed(context, route),
      child: _navItem(icon, label, false),
    );
  }

  Widget _navItem(IconData icon, String label, bool active) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: active ? Colors.blue : Colors.black54),
        Text(label,
            style: GoogleFonts.poppins(
                fontSize: 12,
                color: active ? Colors.blue : Colors.black54)),
      ],
    );
  }

  Widget _searchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: searchController,
        onChanged: debounceSearch,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Search by Polymer type, grade ...",
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _filters() {
    return Row(
      children: [
        _filterChip("Price"),
        const SizedBox(width: 8),
        _filterChip("Qty"),
        const SizedBox(width: 8),
        _filterChip("Nearby"),
      ],
    );
  }

  Widget _filterChip(String title) {
    final active = activeFilter == title;
    return GestureDetector(
      onTap: () => applyFilter(title),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: active ? Colors.blue.shade100 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Text(title,
                style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: active ? Colors.blue : Colors.black)),
            const Icon(Icons.swap_vert, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _productCard(Map<String, dynamic> p) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(p["name"],
            style: GoogleFonts.poppins(
                fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(p["category"],
            style:
            GoogleFonts.poppins(fontSize: 13, color: Colors.grey)),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _info("Price", p["price"]),
            _info("Min. Order", p["order"]),
            _info("MFI", p["mfi"]),
            const Icon(Icons.arrow_forward_ios,
                size: 16, color: Colors.blue),
          ],
        ),
      ]),
    );
  }

  Widget _info(String label, String value) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label,
          style:
          GoogleFonts.poppins(fontSize: 11, color: Colors.grey)),
      Text(value,
          style: GoogleFonts.poppins(
              fontSize: 14, fontWeight: FontWeight.w600)),
    ]);
  }

  Widget _topBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Icon(Icons.location_on, color: Colors.blue),
        CircleAvatar(radius: 15),
      ],
    );
  }

  Widget _title() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Welcome to",
          style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
      Text("Polymer Market",
          style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.blue)),
    ]);
  }
}

 */

//-----------sample +PROPER NAVIGATION WORKING
/*

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ✅ IMPORT COMMON BOTTOM NAV
import 'BottomNavBar.dart';

class BuyerMainInquiryPage extends StatefulWidget {
  const BuyerMainInquiryPage({
    super.key,
    required this.selectedGrade,
    required this.selectedType,
  });

  final String selectedGrade;
  final String selectedType;

  @override
  State<BuyerMainInquiryPage> createState() => _BuyerMainInquiryPageState();
}

class _BuyerMainInquiryPageState extends State<BuyerMainInquiryPage> {
  final TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  // ---------------- PRODUCTS ----------------
  final List<Map<String, dynamic>> products = [
    {
      "name": "HDPE 7000F",
      "category": "Polyethylene / Film Grade",
      "price": "₹ 30 / Kg",
      "order": "25 MT",
      "mfi": "7.0",
      "location": "Ahmedabad",
      "grade": "7000F",
    },
    {
      "name": "LDPE 2420H",
      "category": "Polyethylene / Injection Grade",
      "price": "₹ 92 / Kg",
      "order": "10 MT",
      "mfi": "2.0",
      "location": "Mumbai",
      "grade": "2420H",
    },
    {
      "name": "PP HM012",
      "category": "Polypropylene",
      "price": "₹ 84 / Kg",
      "order": "15 MT",
      "mfi": "12",
      "location": "Delhi",
      "grade": "HM012",
    },
  ];

  List<Map<String, dynamic>> filteredProducts = [];
  String activeFilter = "";

  @override
  void initState() {
    super.initState();
    filteredProducts = List.from(products);
  }

  // ---------------- DEBOUNCE SEARCH ----------------
  void debounceSearch(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 400), () {
      setState(() {
        filteredProducts = products.where((p) {
          return p["name"]
              .toLowerCase()
              .contains(query.toLowerCase());
        }).toList();
      });
    });
  }

  // ---------------- FILTER LOGIC ----------------
  void applyFilter(String type) {
    setState(() {
      activeFilter = type;

      if (type == "Price") {
        filteredProducts.sort((a, b) =>
            _price(a).compareTo(_price(b)));
      } else if (type == "Qty") {
        filteredProducts.sort((a, b) =>
            _qty(b).compareTo(_qty(a)));
      } else {
        filteredProducts = List.from(products);
      }
    });
  }

  int _price(Map p) =>
      int.parse(p["price"].replaceAll(RegExp(r'[^0-9]'), ''));

  int _qty(Map p) =>
      int.parse(p["order"].replaceAll(RegExp(r'[^0-9]'), ''));

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ✅ COMMON BOTTOM NAV
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),

      // ================= BODY =================
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _topBar(),
              const SizedBox(height: 20),
              _title(),
              const SizedBox(height: 15),
              _searchBar(),
              const SizedBox(height: 10),
              _filters(),
              const SizedBox(height: 15),

              // ---------------- PRODUCT LIST ----------------
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final p = filteredProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/send-inquiry',
                        arguments: {"product": p},
                      );
                    },
                    child: _productCard(p),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= UI WIDGETS =================

  Widget _searchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: searchController,
        onChanged: debounceSearch,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Search by Polymer type, grade ...",
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _filters() {
    return Row(
      children: [
        _filterChip("Price"),
        const SizedBox(width: 8),
        _filterChip("Qty"),
        const SizedBox(width: 8),
        _filterChip("Nearby"),
      ],
    );
  }

  Widget _filterChip(String title) {
    final active = activeFilter == title;
    return GestureDetector(
      onTap: () => applyFilter(title),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: active ? Colors.blue.shade100 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: active ? Colors.blue : Colors.black,
              ),
            ),
            const Icon(Icons.swap_vert, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _productCard(Map<String, dynamic> p) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            p["name"],
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            p["category"],
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _info("Price", p["price"]),
              _info("Min. Order", p["order"]),
              _info("MFI", p["mfi"]),
              const Icon(Icons.arrow_forward_ios,
                  size: 16, color: Colors.blue),
            ],
          ),
        ],
      ),
    );
  }

  Widget _info(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 11, color: Colors.grey),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _topBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Icon(Icons.location_on, color: Colors.blue),
        CircleAvatar(radius: 15),
      ],
    );
  }

  Widget _title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome to",
          style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
        ),
        Text(
          "Polymer Market",
          style: GoogleFonts.poppins(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}

 */
//=========================================================DYNAMIC VALUES FROM DB==================================
/*

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// MODELS & SERVICES
import '../../models/listing_model.dart';
import '../../services/listing_service.dart';

// COMMON BOTTOM NAV
import 'BottomNavBar.dart';

class BuyerMainInquiryPage extends StatefulWidget {
  const BuyerMainInquiryPage({
    super.key,
    required this.selectedGrade,
    required this.selectedType,
  });

  final String selectedGrade;
  final String selectedType;

  @override
  State<BuyerMainInquiryPage> createState() => _BuyerMainInquiryPageState();
}

class _BuyerMainInquiryPageState extends State<BuyerMainInquiryPage> {
  final TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  // 🔥 LIVE DATA
  List<ListingModel> products = [];
  List<ListingModel> filteredProducts = [];

  String activeFilter = "";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadListings();
  }

  // ================= LOAD FROM BACKEND =================
  Future<void> loadListings() async {
    try {
      final List<ListingModel> data =
      await ListingService.getAllListings();

      if (!mounted) return;

      setState(() {
        products = data;
        filteredProducts = data;
        isLoading = false;
      });
    } catch (e) {
      debugPrint("❌ Failed to load listings: $e");
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  // ================= DEBOUNCE SEARCH =================
  void debounceSearch(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 400), () {
      setState(() {
        filteredProducts = products.where((p) {
          return p.polymerGrade
              .toLowerCase()
              .contains(query.toLowerCase());
        }).toList();
      });
    });
  }

  // ================= FILTER LOGIC =================
  void applyFilter(String type) {
    setState(() {
      activeFilter = type;

      if (type == "Price") {
        filteredProducts.sort(
              (a, b) => a.pricePerKg.compareTo(b.pricePerKg),
        );
      } else if (type == "Qty") {
        filteredProducts.sort(
              (a, b) => b.minOrder.compareTo(a.minOrder),
        );
      } else {
        filteredProducts = List.from(products);
      }
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _topBar(),
              const SizedBox(height: 20),
              _title(),
              const SizedBox(height: 15),
              _searchBar(),
              const SizedBox(height: 10),
              _filters(),
              const SizedBox(height: 15),

              if (isLoading)
                const Center(child: CircularProgressIndicator()),

              if (!isLoading && filteredProducts.isEmpty)
                const Center(child: Text("No listings found")),

              if (!isLoading)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final p = filteredProducts[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/send-inquiry',
                          arguments: {"product": p},
                        );
                      },
                      child: _productCard(p),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= COMPONENTS =================

  Widget _searchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: searchController,
        onChanged: debounceSearch,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Search by Polymer type, grade ...",
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _filters() {
    return Row(
      children: [
        _filterChip("Price"),
        const SizedBox(width: 8),
        _filterChip("Qty"),
        const SizedBox(width: 8),
        _filterChip("Nearby"),
      ],
    );
  }

  Widget _filterChip(String title) {
    final active = activeFilter == title;
    return GestureDetector(
      onTap: () => applyFilter(title),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: active ? Colors.blue.shade100 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: active ? Colors.blue : Colors.black,
              ),
            ),
            const Icon(Icons.swap_vert, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _productCard(ListingModel p) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            p.polymerGrade,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "${p.polymerType} / Film Grade",
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _info("Price", "₹ ${p.pricePerKg} / Kg"),
              _info("Min. Order", "${p.minOrder} MT"),
              _info("MFI", p.mfi.toString()),
              const Icon(Icons.arrow_forward_ios,
                  size: 16, color: Colors.blue),
            ],
          ),
        ],
      ),
    );
  }

  Widget _info(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: GoogleFonts.poppins(fontSize: 11, color: Colors.grey)),
        Text(value,
            style: GoogleFonts.poppins(
                fontSize: 14, fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _topBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Icon(Icons.location_on, color: Colors.blue),
        CircleAvatar(radius: 15),
      ],
    );
  }

  Widget _title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Welcome to",
            style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
        Text("Polymer Market",
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            )),
      ],
    );
  }
}

 */
//--------------------------------DB values +debouncing+filters----------------------------
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// MODELS & SERVICES
import '../../models/listing_model.dart';
import '../../services/listing_service.dart';

// COMMON BOTTOM NAV
import 'BottomNavBar.dart';

class BuyerMainInquiryPage extends StatefulWidget {
  const BuyerMainInquiryPage({
    super.key,
    required this.selectedGrade,
    required this.selectedType,
  });

  final String selectedGrade;
  final String selectedType;

  @override
  State<BuyerMainInquiryPage> createState() => _BuyerMainInquiryPageState();
}

class _BuyerMainInquiryPageState extends State<BuyerMainInquiryPage> {
  final TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  // 🔥 LIVE DATA
  List<ListingModel> products = [];
  List<ListingModel> filteredProducts = [];

  String activeFilter = "";
  bool isLoading = true;

  // Filter values
  double? selectedPriceFilter;
  int? selectedQtyFilter;
  double? selectedNearbyFilter;

  // Dropdown options
  final List<double> priceOptions = [10, 20, 30, 40, 50];
  final List<int> qtyOptions = [5, 6, 8, 10, 12, 22];
  final List<double> nearbyOptions = [5, 10, 25, 50, 100];

  @override
  void initState() {
    super.initState();
    loadListings();
  }

  // ================= LOAD FROM BACKEND =================
  Future<void> loadListings() async {
    try {
      final List<ListingModel> data = await ListingService.getAllListings();

      if (!mounted) return;

      setState(() {
        products = data;
        filteredProducts = data;
        isLoading = false;
      });
    } catch (e) {
      debugPrint("❌ Failed to load listings: $e");
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  // ================= DEBOUNCE SEARCH =================
  void debounceSearch(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 400), () {
      applyAllFilters(searchQuery: query);
    });
  }

  // ================= UNIFIED FILTER LOGIC =================
  void applyAllFilters({String? searchQuery}) {
    setState(() {
      String query = searchQuery ?? searchController.text;

      // Start with all products
      List<ListingModel> tempFiltered = List.from(products);

      // Apply search filter
      if (query.isNotEmpty) {
        tempFiltered = tempFiltered.where((p) {
          return p.polymerGrade.toLowerCase().contains(query.toLowerCase()) ||
              p.polymerType.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }

      // Apply price filter (less than or equal to selected price)
      if (selectedPriceFilter != null) {
        tempFiltered = tempFiltered.where((p) {
          return p.pricePerKg <= selectedPriceFilter!;
        }).toList();
      }

      // Apply quantity filter (between >5 and <25 based on selection)
      if (selectedQtyFilter != null) {
        tempFiltered = tempFiltered.where((p) {
          if (selectedQtyFilter == 5) {
            return p.minOrder > 5 && p.minOrder < 25;
          } else {
            return p.minOrder >= selectedQtyFilter! && p.minOrder < 25;
          }
        }).toList();
      }

      // Apply nearby filter (distance in km - assuming location field exists)
      if (selectedNearbyFilter != null) {
        // TODO: Implement actual distance calculation if location data is available
        // For now, this is a placeholder that could filter by location string or coordinates
        tempFiltered = tempFiltered.where((p) {
          // Example: filter by location field if available
          // return calculateDistance(userLocation, p.location) <= selectedNearbyFilter!;
          return true; // Placeholder - implement based on your location data structure
        }).toList();
      }

      filteredProducts = tempFiltered;
    });
  }

  // ================= FILTER ACTIONS =================
  void showPriceFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Filter by Max Price", style: GoogleFonts.poppins()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: priceOptions.map((price) {
            return RadioListTile<double>(
              title: Text("₹ $price or less", style: GoogleFonts.poppins()),
              value: price,
              groupValue: selectedPriceFilter,
              onChanged: (value) {
                Navigator.pop(context);
                setState(() {
                  selectedPriceFilter = value;
                  activeFilter = "Price";
                });
                applyAllFilters();
              },
            );
          }).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                selectedPriceFilter = null;
                if (selectedQtyFilter == null && selectedNearbyFilter == null) {
                  activeFilter = "";
                }
              });
              applyAllFilters();
            },
            child: Text("Clear", style: GoogleFonts.poppins()),
          ),
        ],
      ),
    );
  }

  void showQtyFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Filter by Min. Order Qty", style: GoogleFonts.poppins()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: qtyOptions.map((qty) {
            return RadioListTile<int>(
              title: Text(
                qty == 5 ? ">5 & <25 MT" : "≥$qty & <25 MT",
                style: GoogleFonts.poppins(),
              ),
              value: qty,
              groupValue: selectedQtyFilter,
              onChanged: (value) {
                Navigator.pop(context);
                setState(() {
                  selectedQtyFilter = value;
                  activeFilter = "Qty";
                });
                applyAllFilters();
              },
            );
          }).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                selectedQtyFilter = null;
                if (selectedPriceFilter == null && selectedNearbyFilter == null) {
                  activeFilter = "";
                }
              });
              applyAllFilters();
            },
            child: Text("Clear", style: GoogleFonts.poppins()),
          ),
        ],
      ),
    );
  }

  void showNearbyFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Filter by Distance", style: GoogleFonts.poppins()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: nearbyOptions.map((distance) {
            return RadioListTile<double>(
              title: Text("Within ${distance.toInt()} km", style: GoogleFonts.poppins()),
              value: distance,
              groupValue: selectedNearbyFilter,
              onChanged: (value) {
                Navigator.pop(context);
                setState(() {
                  selectedNearbyFilter = value;
                  activeFilter = "Nearby";
                });
                applyAllFilters();
              },
            );
          }).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                selectedNearbyFilter = null;
                if (selectedPriceFilter == null && selectedQtyFilter == null) {
                  activeFilter = "";
                }
              });
              applyAllFilters();
            },
            child: Text("Clear", style: GoogleFonts.poppins()),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _topBar(),
              const SizedBox(height: 20),
              _title(),
              const SizedBox(height: 15),
              _searchBar(),
              const SizedBox(height: 10),
              _filters(),
              const SizedBox(height: 15),

              if (isLoading)
                const Center(child: CircularProgressIndicator()),

              if (!isLoading && filteredProducts.isEmpty)
                const Center(child: Text("No listings found")),

              if (!isLoading)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final p = filteredProducts[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/send-inquiry',
                          arguments: {"product": p},
                        );
                      },
                      child: _productCard(p),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= COMPONENTS =================

  Widget _searchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: searchController,
        onChanged: debounceSearch,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Search by Polymer type, grade ...",
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _filters() {
    return Row(
      children: [
        _filterChip("Price", selectedPriceFilter != null),
        const SizedBox(width: 8),
        _filterChip("Qty", selectedQtyFilter != null),
        const SizedBox(width: 8),
        _filterChip("Nearby", selectedNearbyFilter != null),
      ],
    );
  }

  Widget _filterChip(String title, bool hasActiveFilter) {
    return GestureDetector(
      onTap: () {
        if (title == "Price") {
          showPriceFilterDialog();
        } else if (title == "Qty") {
          showQtyFilterDialog();
        } else if (title == "Nearby") {
          showNearbyFilterDialog();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: hasActiveFilter ? Colors.blue.shade100 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: hasActiveFilter ? Colors.blue : Colors.black,
              ),
            ),
            const Icon(Icons.swap_vert, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _productCard(ListingModel p) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            p.polymerGrade,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "${p.polymerType} / Film Grade",
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _info("Price", "₹ ${p.pricePerKg} / Kg"),
              _info("Min. Order", "${p.minOrder} MT"),
              _info("MFI", p.mfi.toString()),
              const Icon(Icons.arrow_forward_ios,
                  size: 16, color: Colors.blue),
            ],
          ),
        ],
      ),
    );
  }

  Widget _info(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: GoogleFonts.poppins(fontSize: 11, color: Colors.grey)),
        Text(value,
            style: GoogleFonts.poppins(
                fontSize: 14, fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _topBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Icon(Icons.location_on, color: Colors.blue),
        CircleAvatar(radius: 15),
      ],
    );
  }

  Widget _title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Welcome to",
            style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
        Text("Polymer Market",
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            )),
      ],
    );
  }
}