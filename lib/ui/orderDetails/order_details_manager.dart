import '../../models/cart_item.dart';
import '../../models/order_item.dart';

class OrderDetailsManager {
  final List<OrderItem> _orders = [
    OrderItem(
      id: '01',
      amount: 2,
      products: [
        CartItem(
          id: 'p1',
          title: 'Red Shirt',
          price: 50000,
          quantity: 2,
          imageUrl:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
        ),
        CartItem(
          id: 'p3',
          title: 'Yellow Scarf',
          price: 30000,
          quantity: 1,
          imageUrl:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
        )
      ],
      dateTime: DateTime.now(),
    )
  ];

  List<CartItem> get itemOrder {
    List<CartItem> _item = [];
    _orders.forEach((element) {
      _item = [...element.products];
    });
    return _item;
  }

  double get totalAmout {
    double total = 0;
    itemOrder.forEach((element) {
      total += element.quantity * element.price;
    });
    return total;
  }
}
