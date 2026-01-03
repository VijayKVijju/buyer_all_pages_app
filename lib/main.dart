//-==============properly workbng UI===============

/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Import screens
import 'modules/buyer/BuyerMainInquiryPage.dart';
import 'modules/buyer/BuyerOfferPage.dart';
import 'modules/buyer/SendInquiryPage.dart';
import 'modules/buyer/InquiryReceivedPage.dart';

void main() {
  runApp(const PolymartApp());
}

class PolymartApp extends StatelessWidget {
  const PolymartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Polymart - Buyer Flow',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorSchemeSeed: Colors.blue,
      ),

      initialRoute: '/buyer-main-inquiry',

      routes: {
        '/buyer-main-inquiry': (context) => const BuyerMainInquiryPage(),

        // Passing dummy default values; real values will be passed via Navigator.pushNamed
        '/buyer-offer': (context) => const BuyerOfferPage(
          selectedGrade: '',
          selectedType: '',
        ),

        '/send-inquiry': (context) => const SendInquiryPage(produc'/in}),

        '/inquiry-received': (context) => const InquiryReceivedPage(productNa'/in'',, grade: '',, qty: '',, pricePerKg: '',, subtotal: null,, delivery: null,, total: null,),
      },
    );
  }
}

*/
//working with all UI
/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Buyer Screens
import 'modules/buyer/BuyerMainInquiryPage.dart';
import 'modules/buyer/buyer_all_inquiries.dart';
import 'modules/news/market_news_page.dart';

void main() {
  runApp(const PolymartApp());
}

class PolymartApp extends StatelessWidget {
  const PolymartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Polymart - Buyer Flow',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorSchemeSeed: Colors.blue,
      ),

      // Buyer Dashboard
      initialRoute: '/buyer-main-inquiry',

      routes: {
        // DASHBOARD
        '/buyer-main-inquiry': (context) => const BuyerMainInquiryPage(
          selectedGrade: '',
          selectedType: '',
        ),

        // ALL INQUIRIES
        '/buyer-all-inquiries': (context) => const BuyerAllInquiries(
          selectedGrade: '',
          selectedType: '',
        ),

        // NEWS
        '/market-news': (context) => const MarketNewsPage(),

        // PROFILE (TEMP PLACEHOLDER)
        '/profile': (context) => const Scaffold(
          body: Center(child: Text("Profile Page")),
        ),
      },
    );
  }
}

 */
//================old working main with minimal errors
/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Screens
import 'modules/buyer/BuyerMainInquiryPage.dart';
import 'modules/buyer/BuyerOfferPage.dart';
import 'modules/buyer/SendInquiryPage.dart';
import 'modules/buyer/InquiryReceivedPage.dart';
import 'modules/news/Buyermainpage.dart';

void main() {
  runApp(const PolymartApp());
}

class PolymartApp extends StatelessWidget {
  const PolymartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Polymart - Buyer Flow',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorSchemeSeed: Colors.blue,
      ),

      initialRoute: '/buyer-main-inquiry',

      routes: {
        '/buyer-main-inquiry': (context) => const Buyermainpage(),

        /// Buyer Offer Page (can be navigated from Browse More button)
        '/buyer-offer': (context) => const BuyerOfferPage(
          selectedGrade: '',
          selectedType: '',
        ),

        '/send-inquiry': (context) {
          final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

          final product = args?['product'];

          return SendInquiryPage(
            product: product ?? {
              "name": "",
              "grade": "",
              "price": "",
              "order": "",
              "mfi": "",
              "location": "",
            },
          );
        },

        '/inquiry-received': (context) {
          final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

          return InquiryReceivedPage(
            productName: args?['productName'] ?? "",
            grade: args?['grade'] ?? "",
            qty: args?['qty'] ?? "",
            pricePerKg: args?['pricePerKg'] ?? "",
            subtotal: args?['subtotal'] ?? 0,
            delivery: args?['delivery'] ?? 0,
            total: args?['total'] ?? 0,
          );
        },
      },
    );
  }
}

*/
//====================new main with proper navigation
/*
// main.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Screens
import 'modules/buyer/BuyerMainInquiryPage.dart';
import 'modules/buyer/SendInquiryPage.dart';
import 'modules/buyer/InquiryReceivedPage.dart';

void main() {
  runApp(const PolymartApp());
}

class PolymartApp extends StatelessWidget {
  const PolymartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Polymart - Buyer Flow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorSchemeSeed: Colors.blue,
      ),
      initialRoute: '/buyer-main-inquiry',
      routes: {
        '/buyer-main-inquiry': (context) => const SendInquiryPage(product: {},),

        // send-inquiry builds SendInquiryPage with product from arguments (if any)
        '/send-inquiry': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
          final product = args?['product'] as Map<String, dynamic>?;

          return SendInquiryPage(
            product: product ?? {
              "name": "",
              "grade": "",
              "price": "₹ 0 / Kg",
              "order": "0 MT",
              "mfi": "0.0",
              "location": "",
            },
          );
        },

        // inquiry received gets summary args
        '/inquiry-received': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

          return InquiryReceivedPage(
            productName: args?['productName'] ?? "",
            grade: args?['grade'] ?? "",
            qty: args?['qty'] ?? "",
            pricePerKg: args?['pricePerKg'] ?? "",
            subtotal: args?['subtotal'] ?? 0,
            delivery: args?['delivery'] ?? 0,
            total: args?['total'] ?? 0,
          );
        },
      },
    );
  }
}
*/

//'''''''''''''''''''''''main code for responsive screens''''''''''''''''''''''''''''''
/*
// main.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:polymart_app/utils/core/responsive/responsive_layout.dart';

// Responsive Core


// Screens
import 'modules/buyer/BuyerMainInquiryPage.dart';
import 'modules/buyer/SendInquiryPage.dart';
import 'modules/buyer/InquiryReceivedPage.dart';

void main() {
  runApp(const PolymartApp());
}

class PolymartApp extends StatelessWidget {
  const PolymartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Polymart - Buyer Flow',
      debugShowCheckedModeBanner: false,

      // ---------------- THEME ----------------
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorSchemeSeed: Colors.blue,
      ),

      // Default route
      initialRoute: '/buyer-main-inquiry',

      // ---------------- ROUTING ----------------
      routes: {
        // ---------------------------------------------------
        // BUYER MAIN INQUIRY PAGE (Responsive Wrapper)
        // ---------------------------------------------------
        '/buyer-main-inquiry': (context) => ResponsiveLayout(
          small: const BuyerMainInquiryPage(),    // Phones below 360px
          medium: const BuyerMainInquiryPage(),   // Phones 360–480px
          large: const BuyerMainInquiryPage(),    // Large phones & tablets
        ),

        // ---------------------------------------------------
        // SEND INQUIRY PAGE (Receives product object)
        // ---------------------------------------------------
        '/send-inquiry': (context) {
          // Get arguments passed using Navigator.pushNamed()
          final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

          final product = args?['product'] as Map<String, dynamic>?;

          return ResponsiveLayout(
            small: SendInquiryPage(product: product ?? defaultProduct),
            medium: SendInquiryPage(product: product ?? defaultProduct),
            large: SendInquiryPage(product: product ?? defaultProduct),
          );
        },

        // ---------------------------------------------------
        // INQUIRY RECEIVED PAGE (Summary Page)
        // ---------------------------------------------------
        '/inquiry-received': (context) {
          final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

          return ResponsiveLayout(
            small: InquiryReceivedPage(
              productName: args?['productName'] ?? "",
              grade: args?['grade'] ?? "",
              qty: args?['qty'] ?? "",
              pricePerKg: args?['pricePerKg'] ?? "",
              subtotal: args?['subtotal'] ?? 0,
              delivery: args?['delivery'] ?? 0,
              total: args?['total'] ?? 0,
            ),
            medium: InquiryReceivedPage(
              productName: args?['productName'] ?? "",
              grade: args?['grade'] ?? "",
              qty: args?['qty'] ?? "",
              pricePerKg: args?['pricePerKg'] ?? "",
              subtotal: args?['subtotal'] ?? 0,
              delivery: args?['delivery'] ?? 0,
              total: args?['total'] ?? 0,
            ),
            large: InquiryReceivedPage(
              productName: args?['productName'] ?? "",
              grade: args?['grade'] ?? "",
              qty: args?['qty'] ?? "",
              pricePerKg: args?['pricePerKg'] ?? "",
              subtotal: args?['subtotal'] ?? 0,
              delivery: args?['delivery'] ?? 0,
              total: args?['total'] ?? 0,
            ),
          );
        },
      },
    );
  }
}
/*
// ---------------- DEFAULT EMPTY PRODUCT ----------------
final Map<String, dynamic> defaultProduct = {
  "name": "",
  "grade": "",
  "price": "₹ 0 / Kg",
  "order": "0 MT",
  "mfi": "0.0",
  "location": "",
};

 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// Screens
import 'modules/profile/ProfilePages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PolymartApp());
}

class PolymartApp extends StatelessWidget {
  const PolymartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Standard mobile base (iPhone X)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Polymart - UI Testing',

          theme: ThemeData(
            useMaterial3: true,
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),

          home: const ProfilePages(), // 👈 your test page
        );
      },
    );
  }
}

 */
//=================
/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ================= IMPORT PAGES =================

// Buyer
import 'modules/buyer/BuyerMainInquiryPage.dart';
import 'modules/buyer/buyer_all_inquiries.dart';
import 'modules/buyer/BuyerOfferPage.dart';
import 'modules/buyer/SendInquiryPage.dart';
import 'modules/buyer/InquiryReceivedPage.dart';

// News
import 'modules/news/market_news_page.dart';

// Profile
import 'modules/profile/ProfilePages.dart';

void main() {
  runApp(const PolymartApp());
}

class PolymartApp extends StatelessWidget {
  const PolymartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Polymart',
      debugShowCheckedModeBanner: false,

      // ================= THEME =================
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorSchemeSeed: Colors.blue,
      ),

      // ================= START PAGE =================
      initialRoute: '/buyer-dashboard',

      // ================= ROUTES =================
      routes: {
        // ---------------- DASHBOARD ----------------
        '/buyer-dashboard': (context) => const BuyerMainInquiryPage(
          selectedGrade: '',
          selectedType: '',
        ),

        // ---------------- ALL INQUIRIES ----------------
        '/buyer-all-inquiries': (context) => const BuyerAllInquiries(
          selectedGrade: '',
          selectedType: '',
        ),

        // ---------------- BUYER OFFER ----------------
        '/buyer-offer': (context) => const BuyerOfferPage(
          selectedGrade: '',
          selectedType: '',
        ),

        // ---------------- SEND INQUIRY ----------------
        '/send-inquiry': (context) {
          final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

          return SendInquiryPage(
            product: args?['product'] ??
                {
                  "name": "",
                  "grade": "",
                  "price": "₹ 0 / Kg",
                  "order": "0 MT",
                  "mfi": "0.0",
                  "location": "",
                },
          );
        },

        // ---------------- INQUIRY RECEIVED ----------------
        '/inquiry-received': (context) {
          final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

          return InquiryReceivedPage(
            productName: args?['productName'] ?? "",
            grade: args?['grade'] ?? "",
            qty: args?['qty'] ?? "",
            pricePerKg: args?['pricePerKg'] ?? "",
            subtotal: args?['subtotal'] ?? 0,
            delivery: args?['delivery'] ?? 0,
            total: args?['total'] ?? 0,
          );
        },

        // ---------------- MARKET NEWS ----------------
        '/market-news': (context) => const MarketNewsPage(),

        // ---------------- PROFILE ----------------
        '/profile': (context) => const ProfilePages(),
      },
    );
  }
}

 */
//--------------------------------proper working all navigation main=======================

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ================= BUYER =================
import 'modules/buyer/BuyerMainInquiryPage.dart';
import 'modules/buyer/buyer_all_inquiries.dart';
import 'modules/buyer/BuyerOfferPage.dart';
import 'modules/buyer/SendInquiryPage.dart';
import 'modules/buyer/InquiryReceivedPage.dart';

// ================= NEWS =================
import 'modules/news/DetailedMarketNewsPage.dart';
import 'modules/news/market_news_page.dart';


// ================= PROFILE =================
import 'modules/profile/ProfilePages.dart';

void main() {
  runApp(const PolymartApp());
}

class PolymartApp extends StatelessWidget {
  const PolymartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Polymart',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorSchemeSeed: Colors.blue,
      ),

      // 🔥 SINGLE ENTRY POINT
      home: const BuyerMainInquiryPage(
        selectedGrade: '',
        selectedType: '',
      ),

      // ================= ROUTES =================
      routes: {
        '/buyer-main': (context) => const BuyerMainInquiryPage(
          selectedGrade: '',
          selectedType: '',
        ),

        '/buyer-all-inquiries': (context) =>
        const BuyerAllInquiries(selectedGrade: '', selectedType: ''),

        '/market-news': (context) => const MarketNewsPage(),

        '/profile': (context) => const ProfilePages(),

        // ---------------- SEND INQUIRY ----------------
        '/send-inquiry': (context) {
          final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

          return SendInquiryPage(
            product: args?['product'] ??
                {
                  "name": "",
                  "grade": "",
                  "price": "₹ 0 / Kg",
                  "order": "0 MT",
                  "mfi": "0.0",
                  "location": "",
                },
          );
        },

        // ---------------- INQUIRY RECEIVED ----------------
        '/inquiry-received': (context) {
          final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

          return InquiryReceivedPage(
            productName: args?['productName'] ?? "",
            grade: args?['grade'] ?? "",
            qty: args?['qty'] ?? "",
            pricePerKg: args?['pricePerKg'] ?? "",
            subtotal: args?['subtotal'] ?? 0,
            delivery: args?['delivery'] ?? 0,
            total: args?['total'] ?? 0,
          );
        },

        // ---------------- NEWS DETAIL ----------------
        '/news-detail': (context) {
          final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

          return DetailedMarketNewsPage(
            title: args['title'],
            image: args['image'],
            description: args['description'],
            source: args['source'],
            date: args['date'],
            imageUrl: args['imageUrl'],
          );
        },
      },
    );
  }
}



//======================================= DATA ACCESS FROM DB============================
/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ================= BUYER =================
import 'modules/buyer/BuyerMainInquiryPage.dart';
import 'modules/buyer/buyer_all_inquiries.dart';
import 'modules/buyer/BuyerOfferPage.dart';
import 'modules/buyer/SendInquiryPage.dart';
import 'modules/buyer/InquiryReceivedPage.dart';

// ================= NEWS =================
import 'modules/news/DetailedMarketNewsPage.dart';
import 'modules/news/market_news_page.dart';

// ================= PROFILE =================
import 'modules/profile/ProfilePages.dart';

void main() {
  runApp(const PolymartApp());
}

class PolymartApp extends StatelessWidget {
  const PolymartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Polymart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorSchemeSeed: Colors.blue,
      ),

      // 🔥 SINGLE ENTRY POINT
      home: const BuyerMainInquiryPage(
        selectedGrade: '',
        selectedType: '',
      ),

      // ================= ROUTES =================
      routes: {
        '/buyer-main-inquiry': (context) => const BuyerMainInquiryPage(
          selectedGrade: '',
          selectedType: '',
        ),

        '/buyer-all-inquiries': (context) =>
        const BuyerAllInquiries(selectedGrade: '', selectedType: ''),

        '/market-news': (context) => const MarketNewsPage(),

        '/profile': (context) => const ProfilePages(),

        // ---------------- SEND INQUIRY ----------------
        '/send-inquiry': (context) {
          final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

          return SendInquiryPage(
            product: args?['product'],
          );
        },

        // ---------------- INQUIRY RECEIVED Page------------
Page    '/inquiry-rPageved': (cPagext) => conPagenquiryReceivedPage(productNaPagenull,, grade: null,, qty: null,, pricePerKg: null,, subtotal: null,, delivery: null,, total: null,),

        // ---------------- NEWS DETAIL ----------------
        '/news-detail': (context) {
          final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

          return DetailedMarketNewsPage(
            title: args['title'],
            image: args['image'],
            description: args['description'],
            source: args['source'],
            date: args['date'],
            imageUrl: args['imageUrl'],
          );
        },
      },
    );
  }
}

 */