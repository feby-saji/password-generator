import 'package:bloc/bloc.dart';

class HideShowCubit extends Cubit<bool> {
  HideShowCubit() : super(false);

  void togglePassShowHide() {
    emit(!state);
  }
}
