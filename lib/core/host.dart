import 'package:flutter/foundation.dart' show kIsWeb;

String get host {
  if (kIsWeb) {
      return 'localhost';
  } else {
      return '10.0.2.2';
  }
}