import 'package:url_launcher/url_launcher.dart';

class GroceryNavigator {
  static Future<void> searchIngredient(String ingredient) async {
    final encodedIngredient = Uri.encodeComponent(ingredient);
    
    final urls = [
      "https://www.zepto.co.in/search?query=$encodedIngredient",
      "https://blinkit.com/s/?q=$encodedIngredient",
      "https://www.swiggy.com/instamart/search?query=$encodedIngredient",
    ];

    for (final urlString in urls) {
      final uri = Uri.parse(urlString);
      try {
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
          return;
        }
      } catch (e) {
        // Continue to next URL
        continue;
      }
    }

    // Fallback: try to open the first URL anyway
    try {
      await launchUrl(Uri.parse(urls.first),
          mode: LaunchMode.externalApplication);
    } catch (e) {
      // Silent fail
    }
  }
}

