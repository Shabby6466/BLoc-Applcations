import 'package:blocexample/bloc/slider/slider_bloc.dart';
import 'package:blocexample/bloc/slider/slider_event.dart';
import 'package:blocexample/bloc/slider/slider_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MySlider extends StatelessWidget {
  const MySlider({super.key});

  @override
  Widget build(BuildContext context) {
    print('whole build');
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<SwitchBloc, SwitchStates>(
              buildWhen: (previous, current) =>
                  previous.isSwitch != current.isSwitch,
              builder: (context, state) {
                print("switch");
                return Switch(
                    value: state.isSwitch,
                    onChanged: (newValue) {
                      context
                          .read<SwitchBloc>()
                          .add(EnableOrDisableNotification());
                    });
              }),
          BlocBuilder<SwitchBloc, SwitchStates>(
              buildWhen: (previous, current) =>
              previous.slider.toDouble() != current.slider.toDouble(),
              builder: (context, state) {
            return Container(
              height: 200,
              width: 400,
              color: Colors.red.withOpacity(state.slider),
            );
          }),
          BlocBuilder<SwitchBloc, SwitchStates>(builder: (context, state) {
            print("slider");
            return Slider(
                value: state.slider,
                onChanged: (newValue) {
                  context.read<SwitchBloc>().add(SliderEvent(slider: newValue));
                });
          }),
        ],
      ),
    );
  }
}
