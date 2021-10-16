import 'package:burger_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common/util/color_utils.dart';
import 'common/util/internet_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  App();

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<InternetCheck>(
          create: (context) => InternetCheck(),
          lazy: true,
        ),
      ],
      child: MaterialApp(
        color: ConstantColor.materialPrimaryColor,
        theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context).textTheme,
          ),
          primaryColor: ConstantColor.materialPrimaryColor,
          primarySwatch: ConstantColor.materialPrimaryColor,
          accentColor: ConstantColor.materialPrimaryColor,
        ),
        debugShowCheckedModeBanner: false,
        home: MainPage(),
        title: "Burger App",
      ),
    );
  }
}
