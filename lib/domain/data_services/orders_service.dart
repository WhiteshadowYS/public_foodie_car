import 'package:foodie_car_template/domain/entity/order/order.dart';

abstract class OrdersService {
  Future<List<Order>> getOrdersList();
}
