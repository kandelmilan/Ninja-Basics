import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product_model.dart';
import '../services/ApiService.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

final productProvider = FutureProvider<List<Product>>((ref) async {
  final apiService = ref.read(apiServiceProvider);
  return apiService.fetchProducts();
});
