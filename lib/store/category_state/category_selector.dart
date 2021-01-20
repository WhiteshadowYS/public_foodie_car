import 'package:foodie_client_template/domain/entity/category/category.dart';
import 'package:foodie_client_template/store/category_state/actions/get_categories_for_cafe.dart';
import 'package:redux/redux.dart';
import 'package:foodie_client_template/store/category_state/actions/select_category_action.dart';
import 'package:foodie_client_template/store/category_state/actions/unselect_category_action.dart';
import 'package:foodie_client_template/store/application/app_state.dart';

abstract class CategorySelector {
  static List<Category> getCategories(Store<AppState> store) {
    return store.state.categoryState?.categories ?? [];
  }

  static Category getSelectedProduct(Store<AppState> store) {
    return store.state.categoryState.selectedCategory;
  }

  static void Function() getCategoriesForCafe(Store<AppState> store) {
    return () => store.dispatch(GetCategoriesForCafe());
  }

  static void Function() getUnselectCategoryFunction(Store<AppState> store) {
    return () => store.dispatch(UnselectCategoryAction());
  }

  static void Function(Category) getSelectCategoryFunction(Store<AppState> store) {
    return (Category category) {
      store.dispatch(
        SelectCategoryAction(
          category: category,
        ),
      );
    };
  }
}
