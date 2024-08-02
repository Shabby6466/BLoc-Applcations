import 'package:blocexample/bloc/user/user_event.dart';
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              onChanged: (value) {
                context.read<UserBloc>().add(SearchUser(value));
              },
              decoration: const InputDecoration(
                hintText: 'Search with Name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state.postStatus == PostStatus.loading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state.postStatus == PostStatus.success) {
                  return ListView.builder(
                    itemCount: state.tempList.isEmpty
                        ? state.userList.length
                        : state.tempList.length,
                    itemBuilder: (context, index) {
                      if (state.tempList.isEmpty) {
                        return ListTile(
                          title: Text(state.userList[index].name),
                          subtitle: Text(state.userList[index].email),
                        );
                      } else {
                        return ListTile(
                          title: Text(state.tempList[index].name),
                          subtitle: Text(state.tempList[index].email),
                        );
                      }
                    },
                  );
                } else if (state.postStatus == PostStatus.failure) {
                  return Center(
                      child: Text('Failed to fetch users: ${state.message}'));
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
