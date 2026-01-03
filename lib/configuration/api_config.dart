import 'dart:io';
import 'package:flutter/foundation.dart'; // for kIsWeb

class ApiConfig {
  // 🔹 Backend port
  static const int _port = 5005;

  // 🔹 Your Mac / PC Wi-Fi IP for real devices
  static const String _localNetworkIp = "192.168.237.244";

  /// Returns the correct base URL for API depending on platform
  static String get baseUrl {
    // 🌐 Web
    if (kIsWeb) {
      return "http://localhost:$_port";
    }

    // 🤖 Android Emulator
    if (Platform.isAndroid) {
      // If running on emulator, use 10.0.2.2
      return "http://10.0.2.2:$_port";
    }

    // 🍎 iOS Simulator
    if (Platform.isIOS) {
      return "http://localhost:$_port";
    }

    // 🖥 macOS / Windows / Linux
    if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      return "http://localhost:$_port";
    }

    // 📱 Real device fallback (assumes same Wi-Fi as dev machine)
    return "http://$_localNetworkIp:$_port";
  }
}