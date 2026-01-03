class ListingModel {
  final String id;
  final String polymerGrade;
  final String polymerType;
  final double pricePerKg;
  final int minOrder;
  final String dataSheetUrl;
  final double mfi;
  final bool isAcknowledged;
  final String status;

  ListingModel({
    required this.id,
    required this.polymerGrade,
    required this.polymerType,
    required this.pricePerKg,
    required this.minOrder,
    required this.dataSheetUrl,
    required this.mfi,
    required this.isAcknowledged,
    required this.status,
  });

  factory ListingModel.fromJson(Map<String, dynamic> json) {
    return ListingModel(
      id: json['_id'],
      polymerGrade: json['polymerGrade'],
      polymerType: json['polymerType'],
      pricePerKg: (json['pricePerKg'] as num).toDouble(),
      minOrder: json['minOrder'],
      dataSheetUrl: json['dataSheetUrl'],
      mfi: (json['mfi'] as num).toDouble(),
      isAcknowledged: json['isAcknowledged'],
      status: json['status'],
    );
  }
}