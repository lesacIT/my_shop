import 'package:flutter/foundation.dart';

import '../../models/auth_token.dart';
import '../../models/product.dart';
import '../../services/products_service.dart';

class ProductsManager with ChangeNotifier {
  List<Product> _items = [];

  final ProductService _productService;

  ProductsManager([AuthToken? authToken])
      : _productService = ProductService(authToken);

  set authToken(AuthToken? authToken) {
    _productService.authToken = authToken;
  }

  Future<void> fetchProducts() async {
    _items = await _productService.fetchProducts();
    notifyListeners();
  }

  Future<void> fetchUserProducts() async {
    _items = await _productService.fetchProducts(
      filteredByUser: true,
    );
    notifyListeners();
  }

  Future<void> addProduct(Product product) async {
    final newProduct = await _productService.addProduct(product);
    if (newProduct != null) {
      _items.add(newProduct);
      notifyListeners();
    }
  }

  Future<void> updateProduct(Product product) async {
    final index = _items.indexWhere((item) => item.id == product.id);
    if (index >= 0) {
      if (await _productService.updateProduct(product)) {
        _items[index] = product;
        notifyListeners();
      }
    }
  }

  void toggleFavoriteStatus(Product product) async {
    final saveStatus = product.isFavorite;
    product.isFavorite = !saveStatus;
    if (!await _productService.saveFavoritesStatus(product)) {
      product.isFavorite = saveStatus;
    }
  }

  Future<void> deleteProduct(String id) async {
    final index = _items.indexWhere((item) => item.id == id);
    Product? existingProduct = _items[index];
    _items.removeAt(index);
    notifyListeners();
    if (!await _productService.deleteProduct(id)) {
      _items.insert(index, existingProduct);
      notifyListeners();
    }
  }

  int get itemCount {
    return _items.length;
  }

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product? findById(String id) {
    try {
      return _items.firstWhere((item) => item.id == id);
    } catch (error) {
      return null;
    }
  }
}
