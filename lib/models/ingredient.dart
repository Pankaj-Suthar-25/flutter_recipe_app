import 'package:equatable/equatable.dart';

class Ingredient extends Equatable {
  final String id;
  final String name;
  final bool isChecked;

  const Ingredient({
    required this.id,
    required this.name,
    this.isChecked = false,
  });

  Ingredient copyWith({
    String? id,
    String? name,
    bool? isChecked,
  }) {
    return Ingredient(
      id: id ?? this.id,
      name: name ?? this.name,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  @override
  List<Object?> get props => [id, name, isChecked];
}
