import 'package:blocexample/api_model/user_model.dart';
import 'package:blocexample/utils/enum.dart';
import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  final PostStatus postStatus;
  final List<User> userList;
  final List<User> tempList;
  final String message;

  @override
  List<Object> get props => [postStatus, userList, message, tempList];

  const UserState({
    this.tempList = const <User>[],
    this.postStatus = PostStatus.loading,
    this.message = "",
    this.userList = const <User>[],
  });

  UserState copyWith(
      {PostStatus? postStatus,
      List<User>? userList,
      String? message,
      List<User>? tempList}) {
    return UserState(
        postStatus: postStatus ?? this.postStatus,
        userList: userList ?? this.userList,
        message: message ?? this.message,
        tempList: tempList ?? this.tempList);
  }
}
