import 'dart:io';

import 'package:blocexample/bloc/image_picker/image_picker_bloc.dart';
import 'package:blocexample/bloc/image_picker/image_picker_event.dart';
import 'package:blocexample/bloc/image_picker/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<ImagePickerBloc, ImagePickerState>(
              builder: (context, state) {
            if (state.file == null) {
              return InkWell(
                onTap: () {
                  context.read<ImagePickerBloc>().add(PickImageFromCamera());
                },
                child: const Center(
                  child: CircleAvatar(
                    child: Icon(Icons.camera),
                  ),
                ),
              );
            } else {
              return Image.file(File(state.file!.path.toString()));
            }
          }),
          BlocBuilder<ImagePickerBloc, ImagePickerState>(
              builder: (context, state) {
            if (state.file == null) {
              return InkWell(
                onTap: () {
                  context.read<ImagePickerBloc>().add(PickImageFromGallery());
                },
                child: Center(
                  child: CircleAvatar(
                    child: Icon(Icons.image),
                  ),
                ),
              );
            } else {
              return Image.file(File(state.file!.path.toString()));
            }
          })
        ],
      ),
    );
  }
}
