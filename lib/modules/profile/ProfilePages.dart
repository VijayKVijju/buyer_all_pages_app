
//-------------working fine

/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePages extends StatelessWidget {
  const ProfilePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: GoogleFonts.comfortaa(
            fontWeight: FontWeight.w700,
            fontSize: 30.sp,
            color: const Color(0xff2287EE),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 29.w, right: 33.w),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 143.h,
                    width: 143.w,
                    child: const CircleAvatar(backgroundColor: Colors.blue),
                  ),
                  Positioned(
                    bottom: 5.h,
                    right: 5.w,
                    child: Container(
                      height: 25.h,
                      width: 25.w,
                      decoration: BoxDecoration(
                        color: const Color(0xff22C55E),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 13.h),

              Text(
                "Robert D J",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff000000),
                  fontSize: 20.sp,
                ),
              ),

              Text(
                "Online",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff22C55E),
                  fontSize: 14.sp,
                ),
              ),

              SizedBox(height: 5.h),

              Text(
                "+91 8754387654",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff000000),
                  fontSize: 14.sp,
                ),
              ),

              SizedBox(height: 60.h),

              // ---------------- WEBSITE BOX ----------------
              GestureDetector(
                onTap: () async {
                  final url = Uri.parse("https://google.com");
                  if (await canLaunchUrl(url)) {
                    launchUrl(url, mode: LaunchMode.externalApplication);
                  }
                },
                child: Material(
                  elevation: 2,
                  child: Container(
                    height: 53.h,
                    width: 331.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.r),
                      color: const Color(0xfff6f6f6),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xffDFCECE),
                          blurRadius: 31.8,
                          spreadRadius: -19,
                          offset: Offset(8, 12),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(12.0.w),
                    child: Row(
                      children: [
                        SizedBox(width: 10.w),
                        Image(
                          height: 16.h,
                          width: 20.w,
                          color: Colors.black,
                          image: const AssetImage("assets/Images/Group.png"),
                        ),
                        SizedBox(width: 11.w),
                        Text(
                          "Website",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff000000),
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 7.h),


              GestureDetector(
                onTap: () => _openHelpSupport(context),
                child: Material(
                  elevation: 2,
                  child: Container(
                    height: 53.h,
                    width: 331.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.r),
                      color: const Color(0xfff6f6f6),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xffDFCECE),
                          blurRadius: 31.8,
                          spreadRadius: -19,
                          offset: Offset(8, 12),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(12.0.w),
                    child: Row(
                      children: [
                        SizedBox(width: 10.w),
                        Image(
                          height: 16.h,
                          width: 20.w,
                          color: Colors.black,
                          image: const AssetImage("assets/Images/feedback.png"),
                        ),
                        SizedBox(width: 11.w),
                        Text(
                          "Help & Support",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff000000),
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 6.h),

              // ---------------- LOGOUT BOX ----------------
              Material(
                elevation: 2,
                child: Container(
                  height: 53.h,
                  width: 331.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.r),
                    color: const Color(0xfff6f6f6),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xffDFCECE),
                        blurRadius: 31.8,
                        spreadRadius: -19,
                        offset: Offset(8, 12),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(12.0.w),
                  child: Row(
                    children: [
                      SizedBox(width: 10.w),
                      Image(
                        height: 16.h,
                        width: 20.w,
                        color: const Color(0xffe24949),
                        image: const AssetImage("assets/Images/logout.png"),
                      ),
                      SizedBox(width: 11.w),
                      Text(
                        "Log Out",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xffe24949),
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ===================== HELP & SUPPORT BOTTOMSHEET =====================
void _openHelpSupport(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22.r)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 20.h,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
              ),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Help & Support",
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextFormField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: "Type your message...",
                        filled: true,
                        fillColor: const Color(0xfff5f5f5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                        height: 48.h,
                        width: 330.w,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Message sent to admin")),
                              );
                            },
                            child: Text(
                                "Submit",
                                style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500
                                ))
                        ))
                  ])
          ),
        );
      }
  );
}

 */
//sample-------------------------------

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePages extends StatelessWidget {
  const ProfilePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fix LateInitializationError by forcing textScaleFactor
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Profile",
            style: GoogleFonts.comfortaa(
              fontWeight: FontWeight.w700,
              fontSize: 30,
              color: const Color(0xff2287EE),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: ListView(
          padding: const EdgeInsets.only(left: 29, right: 33),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    const SizedBox(
                      height: 143,
                      width: 143,
                      child: CircleAvatar(backgroundColor: Colors.blue),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: const Color(0xff22C55E),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 13),

                Text(
                  "Robert D J",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff000000),
                    fontSize: 20,
                  ),
                ),

                Text(
                  "Online",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff22C55E),
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  "+91 8754387654",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff000000),
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 60),

                // ---------------- WEBSITE BOX ----------------
                GestureDetector(
                  onTap: () async {
                    final url = Uri.parse("https://google.com");
                    if (await canLaunchUrl(url)) {
                      launchUrl(url, mode: LaunchMode.externalApplication);
                    }
                  },
                  child: Material(
                    elevation: 2,
                    child: Container(
                      height: 53,
                      width: 331,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: const Color(0xfff6f6f6),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xffDFCECE),
                            blurRadius: 31.8,
                            spreadRadius: -19,
                            offset: Offset(8, 12),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          Image.asset(
                            "assets/images/Group.png",
                            height: 16,
                            width: 20,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 11),
                          Text(
                            "Website",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff000000),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 7),

                GestureDetector(
                  onTap: () => _openHelpSupport(context),
                  child: Material(
                    elevation: 2,
                    child: Container(
                      height: 53,
                      width: 331,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: const Color(0xfff6f6f6),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xffDFCECE),
                            blurRadius: 31.8,
                            spreadRadius: -19,
                            offset: Offset(8, 12),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          Image.asset(
                            "assets/images/feedback.png",
                            height: 16,
                            width: 20,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 11),
                          Text(
                            "Help & Support",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff000000),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 6),

                // ---------------- LOGOUT BOX ----------------
                Material(
                  elevation: 2,
                  child: Container(
                    height: 53,
                    width: 331,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: const Color(0xfff6f6f6),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xffDFCECE),
                          blurRadius: 31.8,
                          spreadRadius: -19,
                          offset: Offset(8, 12),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        const Image(
                          height: 16,
                          width: 20,
                          color: Color(0xffe24949),
                          image: AssetImage("assets/images/logout.png"),
                        ),
                        const SizedBox(width: 11),
                        Text(
                          "Log Out",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffe24949),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ],
        ),
        bottomNavigationBar: const BottomNavBar(currentIndex: 3),
      ),
    );
  }
}

// ===================== HELP & SUPPORT BOTTOMSHEET =====================
void _openHelpSupport(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Help & Support",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: "Type your message...",
                        filled: true,
                        fillColor: const Color(0xfff5f5f5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                        height: 48,
                        width: 330,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Message sent to admin")),
                              );
                            },
                            child: Text(
                                "Submit",
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                ))
                        ))
                  ])
          ),
        );
      }
  );
}

// ===================== BOTTOM NAVIGATION BAR =====================
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