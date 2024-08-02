import 'package:bloc/bloc.dart';
import 'package:blocexample/api_model/user_model.dart';
import 'package:blocexample/bloc/user/user_event.dart';
import 'package:blocexample/bloc/user/user_state.dart';
import 'package:blocexample/repo/user_repo.dart';
import 'package:blocexample/utils/enum.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepo _userRepo = UserRepo();
  List<User> tempList = [];

  UserBloc() : super(const UserState()) {
    on<FetchUser>(fetchUserApi);
    on<SearchUser>(filterUser);
  }

  void fetchUserApi(FetchUser event, Emitter<UserState> emit) async {
    emit(state.copyWith(postStatus: PostStatus.loading));
    print("Fetching user API triggered");
    try {
      final users = await _userRepo.fetchUser();
      print("Users fetched successfully");
      emit(state.copyWith(
        postStatus: PostStatus.success,
        message: 'success',
        userList: users,
      ));
    } catch (error) {
      print("Error fetching users: $error");
      emit(state.copyWith(
        postStatus: PostStatus.failure,
        message: error.toString(),
      ));
    }
  }

  void filterUser(SearchUser event, Emitter<UserState> emit) async {
    if (event.stSearch.isEmpty) {
      emit(state.copyWith(tempList: []));
    } else {
      tempList = state.userList
          .where(
              (element) => element.id.toString() == event.stSearch.toString())
          .toList();
    }
    emit(state.copyWith(tempList: tempList));
  }
}
