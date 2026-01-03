
//=========STATIC WORKING UI==============
/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SendInquiryPage extends StatefulWidget {
  final Map<String, dynamic> product; // product from BuyerOfferPage

  const SendInquiryPage({super.key, required this.product});

  @override
  State<SendInquiryPage> createState() => _SendInquiryPageState();
}

class _SendInquiryPageState extends State<SendInquiryPage> {
  final TextEditingController qtyController = TextEditingController();

  // Temporary memory (future DB data)
  Map<String, dynamic> tempSavedInquiry = {};

  // Safe value handler
  String safe(dynamic v) {
    if (v == null || v == "null") return "N/A";
    return v.toString();
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.product;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 10),

              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back,
                  size: 26,
                  color: Color(0xFF1E73FF),
                ),
              ),

              const SizedBox(height: 10),

              Center(
                child: Text(
                  "Send Inquiry",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1E73FF),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// PRODUCT CARD
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            safe(p["name"]),
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            safe(p["grade"]),
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: const Color(0xFF8B97A9),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Image.asset(
                      "assets/icons/exxclametary.png",
                      width: 22,
                      height: 22,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// FIRST ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _infoBlock(
                      title: "Price",
                      value: safe(p["price"])
                  ),
                  _infoBlock(
                      title: "Min . Order",
                      value: safe(p["order"])
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// SECOND ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _infoBlock(title: "Supplier", value: "Global Polymers Inc"),
                  _infoBlock(title: "MFI", value: safe(p["mfi"])),
                ],
              ),

              const SizedBox(height: 20),

              /// QUANTITY + LOCATION
              Row(
                children: [
                  /// QUANTITY INPUT
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Quantity",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: const Color(0xFF8B97A9),
                                fontWeight: FontWeight.w500)),
                        const SizedBox(height: 6),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: TextField(
                            controller: qtyController,
                            decoration: InputDecoration(
                              hintText: "Enter quantity",
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.poppins(
                                color: const Color(0xFFBFC6D0),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(width: 20),

                  /// LOCATION
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Location",
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF1E73FF),
                                fontSize: 14,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(height: 6),
                        Text(
                          safe(p["location"]),
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: const Color(0xFF5D6B7A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              /// SUBMIT
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    if (qtyController.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please enter quantity"),
                        ),
                      );
                      return;
                    }

                    /// Save to temporary memory
                    setState(() {
                      tempSavedInquiry = {
                        "name": safe(p["name"]),
                        "grade": safe(p["grade"]),
                        "price": safe(p["price"]),
                        "order": safe(p["order"]),
                        "mfi": safe(p["mfi"]),
                        "location": safe(p["location"]),
                        "quantity": qtyController.text.trim(),
                      };
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            "Saved Temporarily: ${tempSavedInquiry["quantity"]} units"),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E73FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  child: Text(
                    "Submit",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoBlock({required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: GoogleFonts.poppins(
                fontSize: 13, color: const Color(0xFF8B97A9))),
        const SizedBox(height: 4),
        Text(value,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            )),
      ],
    );
  }
}

 */


//========================new code
/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'InquiryReceivedPage.dart';

class SendInquiryPage extends StatefulWidget {
  final Map<String, dynamic> product;

  const SendInquiryPage({super.key, required this.product});

  @override
  State<SendInquiryPage> createState() => _SendInquiryPageState();
}

class _SendInquiryPageState extends State<SendInquiryPage> {
  String selectedQty = "18";

  bool showCalculation = false; // 🔥 calculation block is hidden until clicked

  final NumberFormat currencyFormat = NumberFormat.currency(
    locale: "en_IN",
    symbol: "₹ ",
    decimalDigits: 0,
  );

  int get subtotal {
    final qty = int.tryParse(selectedQty) ?? 0;

    String priceText = widget.product["price"]
        .toString()
        .replaceAll("₹", "")
        .replaceAll("/ Kg", "")
        .trim();

    final price = int.tryParse(priceText) ?? 0;
    return qty * price;
  }

  int get deliveryCharge => 8655;

  int get total => subtotal + deliveryCharge;

  @override
  Widget build(BuildContext context) {
    final p = widget.product;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),

                    /// Back Button
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFF1E73FF),
                        size: 26,
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// Title
                    Center(
                      child: Text(
                        "Send Inquiry",
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1E73FF),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// PRODUCT CARD
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.07),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  p["name"],
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  p["grade"],
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: const Color(0xFF8B97A9),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const Icon(Icons.info_outline,
                              color: Color(0xFF1E73FF)),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// Price & Min Order
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _info("Price", p["price"]),
                        _info("Min . Order", p["order"]),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// Supplier + MFI
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _info("Supplier", "Global Polymers Inc"),
                        _info("MFI", p["mfi"]),
                      ],
                    ),

                    const SizedBox(height: 25),

                    /// Quantity + Location
                    Row(
                      children: [
                        /// QUANTITY
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Quantity",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF8B97A9),
                                ),
                              ),
                              const SizedBox(height: 6),

                              Container(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  underline: Container(),
                                  value: selectedQty,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  items: [
                                    "10", "12", "15", "18", "20", "25"
                                  ]
                                      .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e,
                                        style: GoogleFonts.poppins()),
                                  ))
                                      .toList(),
                                  onChanged: (v) =>
                                      setState(() => selectedQty = v!),
                                ),
                              )
                            ],
                          ),
                        ),

                        const SizedBox(width: 20),

                        /// LOCATION
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Location",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: const Color(0xFF1E73FF),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                p["location"],
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: const Color(0xFF5D6B7A),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    /// CALCULATE BUTTON
                    GestureDetector(
                      onTap: () {
                        setState(() => showCalculation = true);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 48,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDDEBFF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "Calculate",
                          style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF1E73FF)),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// ONLY SHOW AFTER CALCULATE CLICKED
                    if (showCalculation) ...[
                      _summaryRow("Subtotal", currencyFormat.format(subtotal)),
                      _summaryRow("Delivery Charges",
                          currencyFormat.format(deliveryCharge)),
                      const SizedBox(height: 10),
                      Text(
                        "Total Charges",
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF1E73FF),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        currencyFormat.format(total),
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF1E73FF),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ]
                  ],
                ),
              ),
            ),

            /// SUBMIT BUTTON
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
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
                    if (!showCalculation) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Please calculate total first")),
                      );
                      return;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => InquiryReceivedPage(
                          productName: p["name"],
                          grade: p["grade"],
                          qty: selectedQty,
                          pricePerKg: p["price"],
                          subtotal: subtotal,
                          delivery: deliveryCharge,
                          total: total,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "Submit",
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: Colors.white,
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

  Widget _info(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: GoogleFonts.poppins(
                fontSize: 13, color: const Color(0xFF8B97A9))),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _summaryRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: GoogleFonts.poppins(
                  fontSize: 14, color: const Color(0xFF8B97A9))),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}

 */

//new updated code
// send_inquiry_page.dart
// modules/buyer/SendInquiryPage.dart

//------------------------------nav,feature ,UI working fine
/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SendInquiryPage extends StatefulWidget {
  final Map<String, dynamic> product;

  const SendInquiryPage({super.key, required this.product});

  @override
  State<SendInquiryPage> createState() => _SendInquiryPageState();
}

class _SendInquiryPageState extends State<SendInquiryPage> {
  String selectedQty = "18";
  bool showCalculation = false;

  int get unitPrice {
    final raw = widget.product['price'] as String? ?? '';
    final digits = raw.replaceAll(RegExp(r'[^0-9]'), '');
    return int.tryParse(digits) ?? 0;
  }

  int get subtotal => (int.tryParse(selectedQty) ?? 0) * unitPrice;
  int get deliveryCharge => 8655;
  int get total => subtotal + deliveryCharge;

  @override
  Widget build(BuildContext context) {
    final p = widget.product;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF1E73FF)),
        elevation: 0,
        title: Center(child: Text("Send Inquiry", style: GoogleFonts.poppins(color: const Color(0xFF1E73FF), fontWeight: FontWeight.w600))),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
                    child: Row(children: [
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(p['name'] ?? "", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 6),
                        Text(p['grade'] ?? "", style: GoogleFonts.poppins(fontSize: 12, color: const Color(0xFF8B97A9))),
                      ])),
                      const Icon(Icons.info_outline, color: Color(0xFF1E73FF))
                    ]),
                  ),
                  const SizedBox(height: 24),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    _info("Price", p['price'] ?? ""),
                    _info("Min . Order", p['order'] ?? ""),
                  ]),
                  const SizedBox(height: 20),
                  Row(children: [
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text("Quantity", style: GoogleFonts.poppins(fontSize: 14, color: const Color(0xFF8B97A9))),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            underline: Container(),
                            value: selectedQty,
                            items: ["10", "12", "15", "18", "20", "25"].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                            onChanged: (v) => setState(() => selectedQty = v ?? selectedQty),
                          ),
                        )
                      ]),
                    ),
                    const SizedBox(width: 16),
                    Expanded(child: _locationInfo(p['location'] ?? "")),
                  ]),
                  const SizedBox(height: 24),
                  GestureDetector(
                    onTap: () => setState(() => showCalculation = true),
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(color: const Color(0xFFDDEBFF), borderRadius: BorderRadius.circular(12)),
                      alignment: Alignment.center,
                      child: Text("Calculate", style: GoogleFonts.poppins(color: const Color(0xFF1E73FF), fontWeight: FontWeight.w600)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (showCalculation) ...[
                    _summaryRow("Subtotal", "₹ $subtotal"),
                    _summaryRow("Delivery Charges", "₹ $deliveryCharge"),
                    const SizedBox(height: 10),
                    Text("Total Charges", style: GoogleFonts.poppins(color: const Color(0xFF1E73FF), fontWeight: FontWeight.w600)),
                    Text("₹ $total", style: GoogleFonts.poppins(color: const Color(0xFF1E73FF), fontSize: 20, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                  ]
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1E73FF), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                  onPressed: () {
                    if (!showCalculation) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please calculate total first")));
                      return;
                    }

                    // navigate to inquiry received via named route, pass all args
                    Navigator.pushNamed(context, '/inquiry-received', arguments: {
                      'productName': p['name'] ?? "",
                      'grade': p['grade'] ?? "",
                      'qty': selectedQty,
                      'pricePerKg': p['price'] ?? "",
                      'subtotal': subtotal,
                      'delivery': deliveryCharge,
                      'total': total,
                    });
                  },
                  child: Text("Submit", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _info(String title, String value) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: GoogleFonts.poppins(fontSize: 13, color: const Color(0xFF8B97A9))),
      const SizedBox(height: 6),
      Text(value, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700)),
    ]);
  }

  Widget _locationInfo(String location) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Location", style: GoogleFonts.poppins(fontSize: 14, color: const Color(0xFF1E73FF), fontWeight: FontWeight.w600)),
      const SizedBox(height: 6),
      Text(location, style: GoogleFonts.poppins(fontSize: 14, color: const Color(0xFF5D6B7A))),
    ]);
  }

  Widget _summaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(label, style: GoogleFonts.poppins(fontSize: 14, color: const Color(0xFF8B97A9))),
        Text(value, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
      ]),
    );
  }
}
*/
//------------------------------------delviery charge removed
/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SendInquiryPage extends StatefulWidget {
  final Map<String, dynamic> product;

  const SendInquiryPage({super.key, required this.product});

  @override
  State<SendInquiryPage> createState() => _SendInquiryPageState();
}

class _SendInquiryPageState extends State<SendInquiryPage> {
  String selectedQty = "18";
  bool showCalculation = false;

  int get unitPrice {
    final raw = widget.product['price'] as String? ?? '';
    final digits = raw.replaceAll(RegExp(r'[^0-9]'), '');
    return int.tryParse(digits) ?? 0;
  }

  int get subtotal => (int.tryParse(selectedQty) ?? 0) * unitPrice;

  @override
  Widget build(BuildContext context) {
    final p = widget.product;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF1E73FF)),
        elevation: 0,
        title: Center(child: Text("Send Inquiry", style: GoogleFonts.poppins(color: const Color(0xFF1E73FF), fontWeight: FontWeight.w600))),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
                    child: Row(children: [
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(p['name'] ?? "", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 6),
                        Text(p['grade'] ?? "", style: GoogleFonts.poppins(fontSize: 12, color: const Color(0xFF8B97A9))),
                      ])),
                      const Icon(Icons.info_outline, color: Color(0xFF1E73FF))
                    ]),
                  ),
                  const SizedBox(height: 24),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    _info("Price", p['price'] ?? ""),
                    _info("Min . Order", p['order'] ?? ""),
                  ]),
                  const SizedBox(height: 20),
                  Row(children: [
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text("Quantity", style: GoogleFonts.poppins(fontSize: 14, color: const Color(0xFF8B97A9))),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            underline: Container(),
                            value: selectedQty,
                            items: ["10", "12", "15", "18", "20", "25"].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                            onChanged: (v) => setState(() => selectedQty = v ?? selectedQty),
                          ),
                        )
                      ]),
                    ),
                    const SizedBox(width: 16),
                    Expanded(child: _locationInfo(p['location'] ?? "")),
                  ]),
                  const SizedBox(height: 24),
                  GestureDetector(
                    onTap: () => setState(() => showCalculation = true),
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(color: const Color(0xFFDDEBFF), borderRadius: BorderRadius.circular(12)),
                      alignment: Alignment.center,
                      child: Text("Calculate", style: GoogleFonts.poppins(color: const Color(0xFF1E73FF), fontWeight: FontWeight.w600)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (showCalculation) ...[
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal",
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF1E73FF),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "₹ $subtotal",
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF1E73FF),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ]
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1E73FF), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                  onPressed: () {
                    if (!showCalculation) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please calculate subtotal first")));
                      return;
                    }

                    // navigate to inquiry received via named route, pass all args
                    Navigator.pushNamed(context, '/inquiry-received', arguments: {
                      'productName': p['name'] ?? "",
                      'grade': p['grade'] ?? "",
                      'qty': selectedQty,
                      'pricePerKg': p['price'] ?? "",
                      'subtotal': subtotal,
                    });
                  },
                  child: Text("Submit", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _info(String title, String value) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: GoogleFonts.poppins(fontSize: 13, color: const Color(0xFF8B97A9))),
      const SizedBox(height: 6),
      Text(value, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700)),
    ]);
  }

  Widget _locationInfo(String location) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Location", style: GoogleFonts.poppins(fontSize: 14, color: const Color(0xFF1E73FF), fontWeight: FontWeight.w600)),
      const SizedBox(height: 6),
      Text(location, style: GoogleFonts.poppins(fontSize: 14, color: const Color(0xFF5D6B7A))),
    ]);
  }
}

 */

//------------------------------------------------------------------updated code accessing list values from DB--------------------
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/listing_model.dart'; // Import your ListingModel

class SendInquiryPage extends StatefulWidget {
  final ListingModel product; // Changed from Map to ListingModel

  const SendInquiryPage({super.key, required this.product});

  @override
  State<SendInquiryPage> createState() => _SendInquiryPageState();
}

class _SendInquiryPageState extends State<SendInquiryPage> {
  String selectedQty = "18";
  bool showCalculation = false;

  double get unitPrice => widget.product.pricePerKg; // Direct access to model property

  double get subtotal => (int.tryParse(selectedQty) ?? 0) * unitPrice;

  @override
  Widget build(BuildContext context) {
    final p = widget.product;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF1E73FF)),
        elevation: 0,
        title: Center(
          child: Text(
            "Send Inquiry",
            style: GoogleFonts.poppins(
              color: const Color(0xFF1E73FF),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  p.polymerGrade,
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "${p.polymerType} / Film Grade",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: const Color(0xFF8B97A9),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.info_outline, color: Color(0xFF1E73FF))
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _info("Price", "₹ ${p.pricePerKg} / Kg"),
                        _info("Min. Order", "${p.minOrder} MT"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Quantity",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: const Color(0xFF8B97A9),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  underline: Container(),
                                  value: selectedQty,
                                  items: ["10", "12", "15", "18", "20", "25"]
                                      .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                                      .toList(),
                                  onChanged: (v) => setState(() => selectedQty = v ?? selectedQty),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(child: _locationInfo("Delhi")), // 🔥 Changed to default "Delhi"
                      ],
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () => setState(() => showCalculation = true),
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDDEBFF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Calculate",
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF1E73FF),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (showCalculation) ...[
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal",
                              style: GoogleFonts.poppins(
                                color: const Color(0xFF1E73FF),
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "₹ $subtotal",
                              style: GoogleFonts.poppins(
                                color: const Color(0xFF1E73FF),
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                    ]
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
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
                    if (!showCalculation) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please calculate subtotal first")),
                      );
                      return;
                    }

                    // Navigate to inquiry received
                    Navigator.pushNamed(
                      context,
                      '/inquiry-received',
                      arguments: {
                        'productName': p.polymerGrade,
                        'grade': "${p.polymerType} / Film Grade",
                        'qty': selectedQty,
                        'pricePerKg': "₹ ${p.pricePerKg} / Kg",
                        'subtotal': subtotal,
                      },
                    );
                  },
                  child: Text(
                    "Submit",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
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

  Widget _info(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 13,
            color: const Color(0xFF8B97A9),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _locationInfo(String location) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Location",
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: const Color(0xFF1E73FF),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          location,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: const Color(0xFF5D6B7A),
          ),
        ),
      ],
    );
  }
}