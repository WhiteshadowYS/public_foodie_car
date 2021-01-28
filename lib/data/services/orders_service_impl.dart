import 'package:foodie_car_template/data/local/orders_storage.dart';
import 'package:foodie_car_template/data/network/repositories/orders_repository.dart';
import 'package:foodie_car_template/data/network/responses/orders_response.dart/orders_response.dart';
import 'package:foodie_car_template/domain/data_services/orders_service.dart';
import 'package:foodie_car_template/domain/entity/order/order.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OrdersService)
class OrdersServiceImpl implements OrdersService {
  final OrdersStorage _storage;
  final OrdersRepository _repository;

  OrdersServiceImpl(
    this._storage,
    this._repository,
  );

  @override
  Future<List<Order>> getOrdersList() async {
    final OrdersResponse response = await _repository.getOrders();

    if (response.error == null && response?.orders != null && response.orders.isNotEmpty) {
      _storage.saveOrders(response.orders);
      return response?.orders ?? [];
    }

    final List<Order> _savedList = await _storage.getOrders();

    if (_savedList != null && _savedList.isNotEmpty) {
      return _savedList;
    }

    return null;
  }
}
