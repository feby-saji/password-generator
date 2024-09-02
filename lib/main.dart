import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:password_manager/constants/theme/theme.dart';
import 'package:password_manager/hive_DB/db_functions.dart';
import 'package:password_manager/models/password_model.dart';
import 'package:password_manager/pages/Home%20page/Bloc/home_bloc.dart';
import 'package:password_manager/pages/Home%20page/home_page.dart';
import 'package:password_manager/pages/generate_password/BLoc/update_password_bloc.dart';
import 'package:password_manager/pages/password%20details/cubit/hide_show_cubit.dart';

import 'constants/helper_functions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PasswordModelAdapter());
  await HiveDb().init();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    HelperFunc.init(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GeneratePasswordBloc(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
         BlocProvider(
          create: (context) => HideShowCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: KThemeData.lightThemeData, // Light theme
        darkTheme: KThemeData.darkThemeData, // Dark theme
        themeMode: ThemeMode.system,
        home: const HomePage(),
      ),
    );
  }
}
