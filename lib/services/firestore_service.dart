import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/item.dart';

class FirestoreService {
  final CollectionReference _itemsRef =
      FirebaseFirestore.instance.collection('items');

  // CREATE
  Future<void> addItem(Item item) async {
    await _itemsRef.add(item.toMap());
  }

  // READ
  Stream<List<Item>> streamItems({String? category, String? sortBy}) {
    Query query = _itemsRef;

    if (category != null && category != 'All') {
      query = query.where('category', isEqualTo: category);
    }

    if (sortBy == 'name') {
      query = query.orderBy('name');
    } else if (sortBy == 'price') {
      query = query.orderBy('price');
    } else if (sortBy == 'quantity') {
      query = query.orderBy('quantity');
    } else {
      query = query.orderBy('createdAt', descending: true);
    }

    return query.snapshots().map(
          (snap) => snap.docs
              .map((d) => Item.fromMap(d.id, d.data() as Map<String, dynamic>))
              .toList(),
        );
  }

  // UPDATE
  Future<void> updateItem(Item item) async {
    await _itemsRef.doc(item.id).update(item.toMap());
  }

  // DELETE
  Future<void> deleteItem(String id) async {
    await _itemsRef.doc(id).delete();
  }

  // SEARCH (client-side filter on stream)
  Stream<List<Item>> searchItems(String query) {
    return streamItems().map((items) => items
        .where((item) =>
            item.name.toLowerCase().contains(query.toLowerCase()) ||
            item.category.toLowerCase().contains(query.toLowerCase()))
        .toList());
  }
}
