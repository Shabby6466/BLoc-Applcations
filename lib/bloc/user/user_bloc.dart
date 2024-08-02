import 'package:bloc/bloc.dart';
import 'package:blocexample/bloc/user/user_event.dart';
import 'package:blocexample/bloc/user/user_state.dart';
import 'package:blocexample/repo/user_repo.dart';
import 'package:blocexample/utils/enum.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepo _userRepo = UserRepo();

  UserBloc() : super(const UserState()) {
    on<FetchUser>(fetchUserApi);
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
}
