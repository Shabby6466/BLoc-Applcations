import 'package:blocexample/models/favourites_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus { loading, success, failure }

class FavoritesState extends Equatable {
  final List<FavouritesModel> favoritesList;
  final ListStatus listStatus;

  const FavoritesState(
      {this.listStatus = ListStatus.loading, this.favoritesList = const []});

  @override
  List<Object?> get props => [favoritesList, listStatus];

  FavoritesState copyWith(
      {List<FavouritesModel>? favoritesList, ListStatus? listStatus}) {
    return FavoritesState(
        listStatus: listStatus ?? this.listStatus,
        favoritesList: favoritesList ?? this.favoritesList);
  }
}
