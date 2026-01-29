import 'package:equatable/equatable.dart';

class GetOrCreateTagParams extends Equatable {
  final String name;
  final int? color;
  final String? icon;
  final int priority;
  final bool isSystem;
  final String? category;

  const GetOrCreateTagParams({
    required this.name,
    this.color,
    this.icon,
    this.priority = 0,
    this.isSystem = false,
    this.category,
  });

  @override
  List<Object?> get props => [name, color, icon, priority, isSystem, category];
}
