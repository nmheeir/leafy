import 'package:equatable/equatable.dart';

class Tag extends Equatable {
  final int? id;
  final String name;
  final int? color;
  final String? icon;
  final int priority;
  final bool isSystem;
  final String? category;
  final bool deleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Tag({
    this.id,
    required this.name,
    this.color,
    this.icon,
    this.priority = 0,
    this.isSystem = false,
    this.category,
    this.deleted = false,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Tag.empty({DateTime? now}) {
    final current = now ?? DateTime.now();
    return Tag(
      id: null,
      name: '',
      color: null,
      icon: null,
      priority: 0,
      isSystem: false,
      category: null,
      deleted: false,
      createdAt: current,
      updatedAt: current,
    );
  }

  Tag copyWith({
    int? id,
    String? name,
    int? color,
    String? icon,
    int? priority,
    bool? isSystem,
    String? category,
    bool? deleted,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Tag(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      icon: icon ?? this.icon,
      priority: priority ?? this.priority,
      isSystem: isSystem ?? this.isSystem,
      category: category ?? this.category,
      deleted: deleted ?? this.deleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    color,
    icon,
    priority,
    isSystem,
    category,
    deleted,
    createdAt,
    updatedAt,
  ];
}
