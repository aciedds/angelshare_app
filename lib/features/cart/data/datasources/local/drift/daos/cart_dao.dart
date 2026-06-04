import 'package:drift/drift.dart';
import 'package:angelshare_app/core/database/app_database.dart';
import 'package:angelshare_app/features/cart/data/datasources/local/drift/tables/cart_table.dart';
import 'package:angelshare_app/features/cart/data/datasources/local/drift/tables/order_history_table.dart';

part 'cart_dao.g.dart';

@DriftAccessor(tables: [CartTable, OrderHistoryTable])
class CartDao extends DatabaseAccessor<AppDatabase> with _$CartDaoMixin {
  CartDao(super.db);

  Future<List<CartTableData>> getCartItems() {
    return select(cartTable).get();
  }

  Future<void> addToCart({required CartTableData item}) async {
    final existing = await (select(cartTable)..where((tbl) => tbl.idDrink.equals(item.idDrink))).getSingleOrNull();
    if (existing != null) {
      final updated = existing.copyWith(quantity: existing.quantity + item.quantity);
      await updateCartItem(item: updated);
    } else {
      await into(cartTable).insert(item);
    }
  }

  Future<void> updateCartItem({required CartTableData item}) async {
    await update(cartTable).replace(item);
  }

  Future<void> deleteCartItem({required String idDrink}) async {
    await (delete(cartTable)..where((tbl) => tbl.idDrink.equals(idDrink))).go();
  }

  Future<void> clearCart() async {
    await delete(cartTable).go();
  }

  Future<List<OrderHistoryTableData>> getOrderHistory() {
    return (select(orderHistoryTable)
          ..orderBy([
            (tbl) => OrderingTerm(expression: tbl.orderedAt, mode: OrderingMode.desc)
          ]))
        .get();
  }

  Future<void> checkout() async {
    await transaction(() async {
      final items = await getCartItems();
      if (items.isEmpty) return;

      final historyItems = items.map((item) => OrderHistoryTableCompanion.insert(
        idDrink: item.idDrink,
        strDrink: item.strDrink,
        strDrinkThumb: Value(item.strDrinkThumb),
        quantity: item.quantity,
        orderedAt: Value(DateTime.now()),
      )).toList();

      for (final companion in historyItems) {
        await into(orderHistoryTable).insert(companion);
      }

      await clearCart();
    });
  }
}
