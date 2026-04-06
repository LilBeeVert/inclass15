class Item {
  final String id;
  final String name;
  final String category;
  final int quantity;
  final double price;
  final String description;
  final DateTime createdAt;

  Item({
    this.id = '',
    required this.name,
    required this.category,
    required this.quantity,
    required this.price,
    this.description = '',
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category,
      'quantity': quantity,
      'price': price,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Item.fromMap(String id, Map<String, dynamic> map) {
    return Item(
      id: id,
      name: map['name'] ?? '',
      category: map['category'] ?? '',
      quantity: (map['quantity'] ?? 0).toInt(),
      price: (map['price'] ?? 0.0).toDouble(),
      description: map['description'] ?? '',
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'])
          : DateTime.now(),
    );
  }

  Item copyWith({
    String? id,
    String? name,
    String? category,
    int? quantity,
    double? price,
    String? description,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      description: description ?? this.description,
      createdAt: createdAt,
    );
  }
}
