import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:foodie_client_template/domain/entity/product/product.dart';
import 'package:foodie_client_template/store/product_state/actions/save_products_for_category.dart';
import 'package:foodie_client_template/store/product_state/actions/select_product_action.dart';
import 'package:foodie_client_template/store/product_state/actions/unselect_product_action.dart';
import 'package:foodie_client_template/store/shared/reducer.dart';

class ProductState {
  final Product selectedProduct;
  final List<Product> products;

  ProductState({
    @required this.selectedProduct,
    @required this.products,
  });

  factory ProductState.initial() {
    return ProductState(
      selectedProduct: null,
      products: [],
    );
  }

  ProductState copyWith({Product selectedProduct, List<Product> products}) {
    return ProductState(
      selectedProduct: selectedProduct ?? this.selectedProduct,
      products: products ?? this.products,
    );
  }

  ProductState deleteSelectedProduct() {
    return ProductState(
      selectedProduct: null,
      products: products,
    );
  }

  ProductState reducer(dynamic action) {
    return Reducer<ProductState>(
      actions: HashMap.from({
        SelectProductAction: (action) => _selectProductAction(action as SelectProductAction),
        UnselectProductAction: (action) => _unselectProductAction(action as UnselectProductAction),
        SaveProductsForCategory: (action) => _saveProductsForCategory(action as SaveProductsForCategory),
      }),
    ).updateState(action, this);
  }

  ProductState _saveProductsForCategory(SaveProductsForCategory action) {
    return copyWith(
      products: action.products ?? [],
    );
  }

  ProductState _unselectProductAction(UnselectProductAction action) {
    return deleteSelectedProduct();
  }

  ProductState _selectProductAction(SelectProductAction action) {
    return copyWith(
      selectedProduct: action.product,
    );
  }
}
