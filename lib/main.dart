import 'package:blocexample/bloc/counter/counter_bloc.dart';
import 'package:blocexample/bloc/image_picker/image_picker_bloc.dart';
import 'package:blocexample/bloc/slider/slider_bloc.dart';
import 'package:blocexample/ui/image_picker_screen.dart';
import 'package:blocexample/ui/slider.dart';
import 'package:blocexample/utils/image_picker_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CounterBloc()),
          BlocProvider(create: (_) => SwitchBloc()),
          BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtil())),
        ],
        child: const MaterialApp(
            debugShowCheckedModeBanner: false, home: ImagePickerScreen()));
  }
}
