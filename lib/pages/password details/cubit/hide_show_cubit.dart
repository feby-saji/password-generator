import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class HideShowCubit extends Cubit<bool> {
  HideShowCubit() : super(false);

  void togglePassShowHide() {
    emit(!state);
  }
}
