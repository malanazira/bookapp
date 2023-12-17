import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bookapp/models/product.dart';

class ApiFetch {
  final String apiUrl;

  ApiFetch({this.apiUrl = 'https://my-bookapp11-default-rtdb.asia-southeast1.firebasedatabase.app/Populer.json'});

  Future<List<Book>> getapiData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Book.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  fetchData() {}
}
