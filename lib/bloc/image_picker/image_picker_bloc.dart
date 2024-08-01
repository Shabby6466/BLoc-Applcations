import 'package:bloc/bloc.dart';
import 'package:blocexample/bloc/image_picker/image_picker_event.dart';
import 'package:blocexample/bloc/image_picker/image_picker_state.dart';
import 'package:blocexample/utils/image_picker_util.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtil _imagePickerUtil;

  ImagePickerBloc(this._imagePickerUtil) : super(const ImagePickerState()) {
    on<PickImageFromGallery>(_galleryPicker);
    on<PickImageFromCamera>(_cameraCapture);
  }

  void _cameraCapture(
      PickImageFromCamera event, Emitter<ImagePickerState> emit) async {
    XFile? file = await _imagePickerUtil.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void _galleryPicker(
      PickImageFromGallery event, Emitter<ImagePickerState> emit) async {
    XFile? file = await _imagePickerUtil.galleryCapture();
    emit(state.copyWith(file: file));
  }
}
