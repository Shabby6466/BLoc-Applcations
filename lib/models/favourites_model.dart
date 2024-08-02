import 'package:equatable/equatable.dart';

class FavouritesModel extends Equatable {
  final String id;
  final String value;
  final bool isLoading;
  final bool isDeleted;

  const FavouritesModel(
      {required this.id,
      required this.value,
      this.isLoading = false,
      this.isDeleted = false});

  FavouritesModel copyWith(
      {String? id, String? value, bool? isDeleted, bool? isLoading}) {
    return FavouritesModel(
        id: id ?? this.id,
        value: value ?? this.value,
        isDeleted: isDeleted ?? this.isDeleted,
        isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object?> get props => [id, value, isLoading, isDeleted];
}
