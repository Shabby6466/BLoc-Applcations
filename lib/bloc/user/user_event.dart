import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class FetchUser extends UserEvent {}

class SearchUser extends UserEvent {
  final String stSearch;

  SearchUser(this.stSearch);
}
