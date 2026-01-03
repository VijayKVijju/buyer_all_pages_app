/*

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Root app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Polymart - Offers UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const Buyermainpage(),
    );
  }
}

/// The required screen: Buyermainpage (static UI)
class Buyermainpage extends StatefulWidget {
  const Buyermainpage({super.key});

  @override
  State<Buyermainpage> createState() => _BuyermainpageState();
}

class _BuyermainpageState extends State<Buyermainpage> {
  bool showActive = true;
  int bottomIndex = 1;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: SafeArea(
        child: Column(
          children: [
            // Top title row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18),
              child: Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 6,
                    child: Text(
                      'My Offers',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1E73FF),
                      ),
                    ),
                  ),
                  const Spacer(flex: 1),

                  // Updated Add icon (PNG)
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/icons/icon_add_circl.png',
                        width: 28,
                        height: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Stats + Toggle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Stats card
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 10,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Total Offers',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF8B97A9),
                              )),
                          const SizedBox(height: 8),
                          Text(
                            '36',
                            style: GoogleFonts.poppins(
                              fontSize: 34,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Active 22 , Passive 14',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF8B97A9),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Toggle
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            CupertinoSwitch(
                              value: showActive,
                              onChanged: (v) {
                                setState(() {
                                  showActive = v;
                                });
                              },
                              activeColor: const Color(0xFF1E73FF),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          _legendDot(Colors.blue, 'Active'),
                          const SizedBox(width: 8),
                          _legendDot(const Color(0xFFF4C04A), 'Passive'),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Progress Bars
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Text(
                    'Price',
                    style: TextStyle(fontSize: 14, color: Color(0xFF5D6B7A)),
                  ),
                  const SizedBox(width: 6),

                  Image.asset(
                    'assets/icons/icon_sort_price.png',
                    width: 16,
                    height: 16,
                  ),

                  const SizedBox(width: 18),

                  const Text(
                    'Qty',
                    style: TextStyle(fontSize: 14, color: Color(0xFF5D6B7A)),
                  ),
                  const SizedBox(width: 6),

                  // Using same icon here
                  Image.asset(
                    'assets/icons/icon_sort_price.png',
                    width: 16,
                    height: 16,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Offers List
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                  itemCount: 4,
                  separatorBuilder: (_, __) => const SizedBox(height: 14),
                  itemBuilder: (context, index) {
                    final sample = [
                      OfferData(
                        title: 'HDPE 7000F',
                        subtitle: 'Polyethylene / Film Grade',
                        price: '₹ 30 / Kg',
                        min: 'Min . 20 MT',
                        badge: 'Active',
                        badgeColor: const Color(0xFFDCF7E6),
                        badgeTextColor: const Color(0xFF2EA64B),
                      ),
                      OfferData(
                        title: 'PE 63',
                        subtitle: 'HMEL P0142SUV',
                        price: '₹ 28 / Kg',
                        min: 'Min . 10 MT',
                        badge: 'Active',
                        badgeColor: const Color(0xFFDCF7E6),
                        badgeTextColor: const Color(0xFF2EA64B),
                      ),
                      OfferData(
                        title: 'HD LBM',
                        subtitle: 'HMEL N0053D',
                        price: '₹ 27 / Kg',
                        min: 'Min . 10 MT',
                        badge: 'Active',
                        badgeColor: const Color(0xFFDCF7E6),
                        badgeTextColor: const Color(0xFF2EA64B),
                      ),
                      OfferData(
                        title: 'LDPE 500',
                        subtitle: 'Polyethylene',
                        price: '₹ 26 / Kg',
                        min: 'Min . 5 MT',
                        badge: 'Passive',
                        badgeColor: const Color(0xFFFFF6E6),
                        badgeTextColor: const Color(0xFFB88600),
                      ),
                    ];

                    return OfferCard(
                      data: sample[index],
                      onEdit: () {},
                      onPause: () {},
                      onDuplicate: () {},
                      onDelete: () {},
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      // Updated Bottom Navigation (using PNG icons)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomIndex,
        onTap: (i) => setState(() => bottomIndex = i),
        showSelectedLabels: true,
        selectedItemColor: const Color(0xFF1E73FF),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/nav_dashboard.png', width: 24),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/nav_listings.png', width: 24),
            label: 'Listings',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/nav_news.png', width: 24),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/nav_profile.png', width: 24),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _legendDot(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
        ),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFF7A8896))),
      ],
    );
  }
}

class OfferData {
  final String title, subtitle, price, min, badge;
  final Color badgeColor, badgeTextColor;
  OfferData({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.min,
    required this.badge,
    required this.badgeColor,
    required this.badgeTextColor,
  });
}

/// Offer Card
class OfferCard extends StatelessWidget {
  final OfferData data;
  final VoidCallback onEdit;
  final VoidCallback onPause;
  final VoidCallback onDuplicate;
  final VoidCallback onDelete;

  const OfferCard({
    super.key,
    required this.data,
    required this.onEdit,
    required this.onPause,
    required this.onDuplicate,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE7EDF6)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 6)),
        ],
      ),
      child: Column(
        children: [
          // TOP SECTION
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              children: [
                // Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.title,
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 6),
                      Text(data.subtitle,
                          style: const TextStyle(fontSize: 12, color: Color(0xFF8B97A9))),
                      const SizedBox(height: 10),
                      Text(data.price,
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 4),
                      Text(data.min,
                          style: const TextStyle(fontSize: 12, color: Color(0xFF8B97A9))),
                    ],
                  ),
                ),

                // Badge + Edit Button
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(
                        color: data.badgeColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        data.badge,
                        style: TextStyle(
                            fontSize: 12,
                            color: data.badgeTextColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: onEdit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1777FF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        elevation: 2,
                      ),
                      child: const Text('Edit'),
                    )
                  ],
                ),
              ],
            ),
          ),

          const Divider(height: 1, color: Color(0xFFF0F4F8)),

          // ACTION BUTTONS (with PNG icons)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                _pngActionButton('icon_pause.png', 'Pause',
                    const Color(0xFFE5A400), onPause),
                const SizedBox(width: 12),
                _pngActionButton('icon_duplicate.png', 'Duplicate',
                    const Color(0xFF1E73FF), onDuplicate),
                const SizedBox(width: 12),
                _pngActionButton('icon_delete.png', 'Delete',
                    Colors.red, onDelete),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// PNG action button
  Widget _pngActionButton(
      String asset, String label, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            'assets/icons/$asset',
            width: 18,
            height: 18,
          ),
          const SizedBox(width: 6),
          Text(label,
              style: TextStyle(
                  color: color, fontSize: 13, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}


 */
//only active page is workig fine


/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'market_news_page.dart';

class Buyermainpage extends StatefulWidget {
  const Buyermainpage({super.key});

  @override
  State<Buyermainpage> createState() => _BuyermainpageState();
}

class _BuyermainpageState extends State<Buyermainpage> {
  bool showActive = true;
  int bottomIndex = 1;

  void _onBottomNavTap(int i) {
    if (i == 2) {
      // navigate to MarketNewsPage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const MarketNewsPage()),
      );
      return;
    }
    setState(() {
      bottomIndex = i;
    });
  }

  Widget _legendDot(Color color, String label) {
    return Row(
      children: [
        Container(width: 12, height: 12, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(6))),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFF7A8896))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // simplified sample; keep OfferCard available in this file for completeness
    final sampleOffers = [
      OfferData(
        title: 'HDPE 7000F',
        subtitle: 'Polyethylene / Film Grade',
        price: '₹ 30 / Kg',
        min: 'Min . 20 MT',
        badge: 'Active',
        badgeColor: const Color(0xFFDCF7E6),
        badgeTextColor: const Color(0xFF2EA64B),
      ),
      OfferData(
        title: 'PE 63',
        subtitle: 'HMEL P0142SUV',
        price: '₹ 28 / Kg',
        min: 'Min . 10 MT',
        badge: 'Active',
        badgeColor: const Color(0xFFDCF7E6),
        badgeTextColor: const Color(0xFF2EA64B),
      ),
      OfferData(
        title: 'HD LBM',
        subtitle: 'HMEL N0053D',
        price: '₹ 27 / Kg',
        min: 'Min . 10 MT',
        badge: 'Active',
        badgeColor: const Color(0xFFDCF7E6),
        badgeTextColor: const Color(0xFF2EA64B),
      ),
      OfferData(
        title: 'LDPE 500',
        subtitle: 'Polyethylene',
        price: '₹ 26 / Kg',
        min: 'Min . 5 MT',
        badge: 'Passive',
        badgeColor: const Color(0xFFFFF6E6),
        badgeTextColor: const Color(0xFFB88600),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: SafeArea(
        child: Column(
          children: [
            // Top title row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18),
              child: Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 6,
                    child: Text(
                      'My Offers',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1E73FF),
                      ),
                    ),
                  ),
                  const Spacer(flex: 1),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/icons/icon_add_circl.png',
                        width: 28,
                        height: 28,
                        errorBuilder: (_, __, ___) => const Icon(Icons.add_circle_outline, color: Color(0xFF1E73FF), size: 28),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Stats + toggle + sort row (kept simple)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Stats card
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 6))],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Total Offers', style: TextStyle(fontSize: 13, color: Color(0xFF8B97A9))),
                          const SizedBox(height: 8),
                          Text('36', style: GoogleFonts.poppins(fontSize: 34, fontWeight: FontWeight.w700, color: Colors.black87)),
                          const SizedBox(height: 6),
                          const Text('Active 22 , Passive 14', style: TextStyle(fontSize: 12, color: Color(0xFF8B97A9))),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 4))]),
                        child: CupertinoSwitch(value: showActive, onChanged: (v) => setState(() => showActive = v), activeColor: const Color(0xFF1E73FF)),
                      ),
                      const SizedBox(height: 8),
                      Row(children: [ _legendDot(Colors.blue, 'Active'), const SizedBox(width: 8), _legendDot(const Color(0xFFF4C04A), 'Passive') ]),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Sort row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Text('Price', style: TextStyle(fontSize: 14, color: Color(0xFF5D6B7A))),
                  const SizedBox(width: 6),
                  Image.asset('assets/icons/icon_sort_price.png', width: 16, height: 16, errorBuilder: (_, __, ___) => const Icon(Icons.sort, size: 16, color: Color(0xFF5D6B7A))),
                  const SizedBox(width: 18),
                  const Text('Qty', style: TextStyle(fontSize: 14, color: Color(0xFF5D6B7A))),
                  const SizedBox(width: 6),
                  Image.asset('assets/icons/icon_sort_price.png', width: 16, height: 16, errorBuilder: (_, __, ___) => const Icon(Icons.sort, size: 16, color: Color(0xFF5D6B7A))),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Offer list (reused small cards)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                  itemCount: sampleOffers.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 14),
                  itemBuilder: (_, i) {
                    final data = sampleOffers[i];
                    return OfferCard(
                      data: data,
                      onEdit: () {},
                      onPause: () {},
                      onDuplicate: () {},
                      onDelete: () {},
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomIndex,
        onTap: _onBottomNavTap,
        showSelectedLabels: true,
        selectedItemColor: const Color(0xFF1E73FF),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Image.asset('assets/icons/nav_dashboard.png', width: 24, errorBuilder: (_, __, ___)=>const Icon(Icons.grid_view)), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Image.asset('assets/icons/nav_listings.png', width: 24, errorBuilder: (_, __, ___)=>const Icon(Icons.list_alt)), label: 'Listings'),
          BottomNavigationBarItem(icon: Image.asset('assets/icons/nav_news.png', width: 24, errorBuilder: (_, __, ___)=>const Icon(Icons.article_outlined)), label: 'News'),
          BottomNavigationBarItem(icon: Image.asset('assets/icons/nav_profile.png', width: 24, errorBuilder: (_, __, ___)=>const Icon(Icons.person_outline)), label: 'Profile'),
        ],
      ),
    );
  }
}

/// OfferData + OfferCard kept inside this file for quick testing
class OfferData {
  final String title, subtitle, price, min, badge;
  final Color badgeColor, badgeTextColor;
  OfferData({ required this.title, required this.subtitle, required this.price, required this.min, required this.badge, required this.badgeColor, required this.badgeTextColor });
}

class OfferCard extends StatelessWidget {
  final OfferData data;
  final VoidCallback onEdit, onPause, onDuplicate, onDelete;
  const OfferCard({super.key, required this.data, required this.onEdit, required this.onPause, required this.onDuplicate, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE7EDF6)), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 6))]),
      child: Column(children: [
        Padding(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12), child: Row(children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(data.title, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700)),
            const SizedBox(height: 6),
            Text(data.subtitle, style: const TextStyle(fontSize: 12, color: Color(0xFF8B97A9))),
            const SizedBox(height: 10),
            Text(data.price, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 4),
            Text(data.min, style: const TextStyle(fontSize: 12, color: Color(0xFF8B97A9))),
          ])),
          Column(children: [
            Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6), decoration: BoxDecoration(color: data.badgeColor, borderRadius: BorderRadius.circular(8)), child: Text(data.badge, style: TextStyle(fontSize: 12, color: data.badgeTextColor, fontWeight: FontWeight.w600))),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: onEdit, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1777FF), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), elevation: 2), child: const Text('Edit'))
          ]),
        ])),
        const Divider(height: 1, color: Color(0xFFF0F4F8)),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10), child: Row(children: [
          _pngActionButton('icon_pause.png', 'Pause', const Color(0xFFE5A400), onPause),
          const SizedBox(width: 12),
          _pngActionButton('icon_duplicate.png', 'Duplicate', const Color(0xFF1E73FF), onDuplicate),
          const SizedBox(width: 12),
          _pngActionButton('icon_delete.png', 'Delete', Colors.red, onDelete),
        ]))
      ]),
    );
  }

  Widget _pngActionButton(String asset, String label, Color color, VoidCallback onTap) {
    return InkWell(onTap: onTap, child: Row(children: [ Image.asset('assets/icons/$asset', width: 18, height: 18, errorBuilder: (_, __, ___) => Icon(Icons.circle, color: color, size: 18)), const SizedBox(width: 6), Text(label, style: TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.w600)) ]));
  }
}

 */

//======================working both active and passive toggle
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Buyermainpage extends StatefulWidget {
  const Buyermainpage({super.key});

  @override
  State<Buyermainpage> createState() => _BuyermainpageState();
}

class _BuyermainpageState extends State<Buyermainpage> {
  bool showActive = true;
  int bottomIndex = 1;

  // ACTIVE LIST
  final List<OfferData> activeOffers = [
    OfferData(
      title: 'HDPE 7000F',
      subtitle: 'Polyethylene / Film Grade',
      price: '₹ 30 / Kg',
      min: 'Min . 20 MT',
      badge: 'Active',
      badgeBg: const Color(0xFFDFF6EA),
      badgeText: const Color(0xFF2EA64B),
    ),
    OfferData(
      title: 'PE 63',
      subtitle: 'HMEL P0142SUV',
      price: '₹ 28 / Kg',
      min: 'Min . 10 MT',
      badge: 'Active',
      badgeBg: const Color(0xFFDFF6EA),
      badgeText: const Color(0xFF2EA64B),
    ),
    OfferData(
      title: 'HD LBM',
      subtitle: 'HMEL N0053D',
      price: '₹ 27 / Kg',
      min: 'Min . 20 MT',
      badge: 'Active',
      badgeBg: const Color(0xFFDFF6EA),
      badgeText: const Color(0xFF2EA64B),
    ),
  ];

  // PASSIVE LIST
  final List<OfferData> passiveOffers = [
    OfferData(
      title: 'HMEL N0053D',
      subtitle: 'Polyethylene',
      price: '₹ 30 / Kg',
      min: 'Min . 20 MT',
      badge: 'Passive',
      badgeBg: const Color(0xFFFFF0F0),
      badgeText: const Color(0xFFEC6E78),
    ),
    OfferData(
      title: 'TCP L&05',
      subtitle: 'HMEL N0053D',
      price: '₹ 28 / Kg',
      min: 'Min . 10 MT',
      badge: 'Passive',
      badgeBg: const Color(0xFFFFF0F0),
      badgeText: const Color(0xFFEC6E78),
    ),
    OfferData(
      title: 'EXXON LD7515',
      subtitle: 'HMEL P0142SUV',
      price: '₹ 27 / Kg',
      min: 'Min . 20 MT',
      badge: 'Passive',
      badgeBg: const Color(0xFFFFF0F0),
      badgeText: const Color(0xFFEC6E78),
    ),
  ];

  void _onNavTap(int i) {
    setState(() => bottomIndex = i);
  }

  @override
  Widget build(BuildContext context) {
    final offers = showActive ? activeOffers : passiveOffers;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),

            // HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              child: Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 6,
                    child: Text(
                      "My Offers",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1E73FF),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.add, color: Color(0xFF1E73FF)),
                  )
                ],
              ),
            ),

            const SizedBox(height: 12),

            // STATS + TOGGLE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 10,
                            offset: const Offset(0, 6),
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total Offers",
                              style: GoogleFonts.poppins(
                                  fontSize: 13, color: const Color(0xFF8B97A9))),
                          const SizedBox(height: 8),
                          Text("36",
                              style: GoogleFonts.poppins(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black)),
                          const SizedBox(height: 6),
                          Text("Active 22 , Passive 14",
                              style: GoogleFonts.poppins(
                                  fontSize: 12, color: const Color(0xFF8B97A9))),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Column(
                    children: [
                      CupertinoSwitch(
                        value: showActive,
                        activeColor: const Color(0xFF1E73FF),
                        trackColor: const Color(0xFFF4C04A),
                        onChanged: (v) => setState(() => showActive = v),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            "Active",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: showActive
                                  ? const Color(0xFF1E73FF)
                                  : const Color(0xFFB0B8C2),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Passive",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: !showActive
                                  ? const Color(0xFFF4C04A)
                                  : const Color(0xFFB0B8C2),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // SORTING ROW
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text("Price",
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: const Color(0xFF5D6B7A))),
                  const SizedBox(width: 20),
                  Text("Location",
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: const Color(0xFF5D6B7A))),
                  const SizedBox(width: 20),
                  Text("Qty",
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: const Color(0xFF5D6B7A))),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // OFFER LIST
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                  itemCount: offers.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 14),
                  itemBuilder: (_, i) {
                    return OfferCard(
                      data: offers[i],
                      isPassive: !showActive,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomIndex,
        onTap: _onNavTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF1E73FF),
        unselectedItemColor: const Color(0xFF9AA6B2),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_outlined), label: "Dashboard"),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined), label: "Listings"),
          BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined), label: "News"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),
    );
  }
}

class OfferData {
  final String title, subtitle, price, min, badge;
  final Color badgeBg, badgeText;

  OfferData({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.min,
    required this.badge,
    required this.badgeBg,
    required this.badgeText,
  });
}

class OfferCard extends StatelessWidget {
  final OfferData data;
  final bool isPassive;

  const OfferCard({super.key, required this.data, required this.isPassive});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE7EDF6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: Column(
        children: [
          // TOP CONTENT
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              children: [
                // Left column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.title,
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 6),
                      Text(
                        data.subtitle,
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: Color(0xFF8B97A9)),
                      ),
                      const SizedBox(height: 10),
                      Text(data.price,
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 4),
                      Text(data.min,
                          style: GoogleFonts.poppins(
                              fontSize: 12, color: Color(0xFF8B97A9))),
                    ],
                  ),
                ),

                // Badge + Edit button
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(
                        color: data.badgeBg,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        data.badge,
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: data.badgeText),
                      ),
                    ),
                    const SizedBox(height: 14),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1777FF),
                        fixedSize: const Size(88, 36),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text("Edit",
                          style: GoogleFonts.poppins(
                              fontSize: 14, color: Colors.white)),
                    ),
                  ],
                )
              ],
            ),
          ),

          const Divider(height: 1, color: Color(0xFFF0F4F8)),

          // ACTION ROW (WITH DELETE ON RIGHT ALWAYS)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              children: [
                // LEFT ACTION BUTTONS (ONLY FOR ACTIVE MODE)
                if (!isPassive) ...[
                  _action(Icons.pause_circle_outline, "Pause",
                      const Color(0xFFF4A800)),
                  const SizedBox(width: 20),
                  _action(Icons.copy_outlined, "Duplicate",
                      const Color(0xFF1E73FF)),
                ],

                const Spacer(),

                // DELETE ALWAYS AT RIGHT
                _action(Icons.delete_outline, "Delete",
                    const Color(0xFFD9534F)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _action(IconData icon, String text, Color color) {
    return Row(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 6),
        Text(text,
            style: GoogleFonts.poppins(
                fontSize: 13, fontWeight: FontWeight.w600, color: color)),
      ],
    );
  }
}