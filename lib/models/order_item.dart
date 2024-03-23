import 'cart_item.dart';

class OrderItem {
  final String? id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  int get productCount {
    return products.length;
  }
  int get totalPrice {
    int total = 0;
    products.forEach((element) {
      total += element.price.toInt() * element.quantity.toInt();
    });
    return total;
  }

  int get numOfProducts {
    return products.length;
  }
  OrderItem({
    this.id,
    required this.amount,
    required this.products,
    DateTime? dateTime,
  }) : dateTime = dateTime ?? DateTime.now();

  OrderItem copyWith({
    String? id,
    double? amount,
    List<CartItem>? products,
    DateTime? dateTime,
  }) {
    return OrderItem(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      products: products ?? this.products,
      dateTime: dateTime ?? this.dateTime,
    );
  }
  Map<String, dynamic> toJson() {
    final List<Map<String, dynamic>> productJson = [];
    products.forEach(
      (product) {
        productJson.add(product.toJson());
      },
    );
    return {
      'id': id,
      'amount': amount,
      'products': productJson,
      'dateTime': dateTime.toString(),
    };
  }

  static OrderItem fromJson(Map<String, dynamic> json) {
    final List<CartItem> products = [];
    json["products"].toList().forEach((cartItem) {
      products.add(CartItem.fromJson(cartItem));
    });
    return OrderItem(
      id: json["id"],
      amount: json['amount'],
      products: products,
      dateTime: DateTime.tryParse(json['dateTime']),
    );
  }
  
  
  
}

