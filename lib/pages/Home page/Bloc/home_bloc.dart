import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:password_manager/hive_DB/db_functions.dart';
import 'package:password_manager/models/password_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeInitial> {
  HomeBloc() : super(HomeInitial(passwords: [])) {
    on<OnChangeTextValue>(_onChangeTextValue);
    // on<LoadAllPassword>(_loadAllPassword);
    on<AddPassword>(_addPassword);
    on<UpdatePassword>(_updatePassword);
    on<DeletePassword>(_deletePassword);
  }

  List<PasswordModel> _passwords = [];
  final HiveDb _hive = HiveDb();

  _onChangeTextValue(OnChangeTextValue event, Emitter<HomeInitial> emit) async {
    if (event.value.isEmpty) {
      // Wait for passwords to be retrieved and assign to _passwords
      _passwords = await _hive.getPassWords();
    } else {
      if (_passwords.isNotEmpty) {
        _passwords = _passwords.where((item) {
          return item.title.toLowerCase().contains(event.value.toLowerCase());
        }).toList();
      }
    }

    emit(HomeInitial(passwords: _passwords));
  }

  _addPassword(AddPassword event, Emitter<HomeInitial> emit) async {
    await _hive.savePassWords(event.password);
    _passwords.add(event.password);
    return emit(HomeInitial(passwords: _passwords));
  }

  _updatePassword(UpdatePassword event, Emitter<HomeInitial> emit) async {}

  _deletePassword(DeletePassword event, Emitter<HomeInitial> emit) async {
    _hive.deletePassword(event.password);
    _passwords.removeWhere((pass) => pass == event.password);
    return emit(HomeInitial(passwords: _passwords));
  }
}
