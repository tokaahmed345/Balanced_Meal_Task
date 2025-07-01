import 'package:balancedmeal/feature/home/data/models/order_item_model.dart';
import 'package:dio/dio.dart';

class OrderService {
  final Dio _dio = Dio();
Future<bool> placeOrder(List<OrderItem> items) async {
  final data = {
    "items": items.map((item) => item.toJson()).toList(),
  };

  try {
    final response = await _dio.post(
      'https://uz8if7.buildship.run/placeOrder',
      data: data,
      options: Options(headers: {'Content-Type': 'application/json'}),
    );

    print('Response status: ${response.statusCode}');
    print('Response data: ${response.data}');

    if (response.statusCode == 200 && response.data['result'] == true) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print('Exception caught: $e');
    throw Exception('Failed to place order: $e');
  }
}

  }

