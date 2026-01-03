
/*
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../configuration/api_config.dart';
import '../models/listing_model.dart';

class ListingService {

  static const String _endpoint = '/api/listings';

  /// 🔹 Simple call – uses ApiConfig.baseUrl directly
  static Future<List<ListingModel>> getAllListings() async {
    final response = await http.get(
      Uri.parse('http://192.168.237.244:5005/api/listing/'),
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);

      final List list = decoded['data'];

      return list
          .map((e) => ListingModel.fromJson(e))
          .toList();
    } else {
      throw Exception(
        'Failed to load listings (${response.statusCode})',
      );
    }
  }
}

 */

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../configuration/api_config.dart';
import '../models/listing_model.dart';

class ListingService {
  // Use the base URL from your config and the correct endpoint
  static const String _baseUrl = 'http://192.168.237.244:5005';
  static const String _endpoint = '/api/listings';

  /// Fetches all listings from the backend GET "/" route
  static Future<List<ListingModel>> getAllListings() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl$_endpoint'), // Points to /api/listings/
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);

        // Access the 'data' key from your backend response
        final List list = decoded['data'];

        return list.map((e) => ListingModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load listings: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error connecting to the server: $e');
    }
  }
}