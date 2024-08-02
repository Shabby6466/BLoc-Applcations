import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocexample/bloc/user/user_bloc.dart';
import 'package:blocexample/bloc/user/user_state.dart';
import 'package:blocexample/utils/enum.dart';



class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state.postStatus == PostStatus.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.postStatus == PostStatus.success) {
            return ListView.builder(
              itemCount: state.userList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.userList[index].name),
                  subtitle: Text(state.userList[index].email),
                );
              },
            );
          } else if (state.postStatus == PostStatus.failure) {
            return Center(child: Text('Failed to fetch users: ${state.message}'));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}