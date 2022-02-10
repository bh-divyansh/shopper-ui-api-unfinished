import 'package:http/http.dart' as http;

class ApiHelper {
  Future<http.Response> getAllProducts() => http.get(
        Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json'),
      );
}
