import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_samet_aydin/pages/auth/bonus_page.dart';
import 'package:flutter_samet_aydin/pages/auth/entry/first_page.dart';
import 'package:flutter_samet_aydin/pages/auth/entry/login_page.dart';

import 'package:flutter_samet_aydin/pages/auth/entry/maps_page.dart';

import 'package:flutter_samet_aydin/pages/auth/maps_page.dart';
import 'package:flutter_samet_aydin/pages/auth/entry/reset_page.dart';
import 'package:flutter_samet_aydin/pages/auth/settings_screen.dart';
import 'package:flutter_samet_aydin/pages/auth2/form_screen.dart';
import 'package:flutter_samet_aydin/pages/auth2/second_page.dart';
import 'package:flutter_samet_aydin/pages/auth/entry/sign_up.dart';
import 'package:flutter_samet_aydin/pages/auth2/home_page.dart';
import 'package:flutter_samet_aydin/pages/auth2/widgets/settings_screen.dart';
import 'package:flutter_samet_aydin/routes.dart';

import 'package:flutter_samet_aydin/utils/customColors.dart';
import 'package:redux/redux.dart';
import 'firebase_options.dart';
import 'package:flutter_samet_aydin/store/app/app.state.dart';
import 'package:flutter_samet_aydin/store/app/app.reducer.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

final GlobalKey<State> globalKey = GlobalKey();

void main() async {
  final store = Store<AppState>(appReducer, initialState: AppState.initial());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({Key? key, required Store<AppState> this.store})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        routes: {
          "/formPage": (context) => EmailScreen(),
          "/bonusPage": (context) => BonusPage(),
          "/ayarlarPage": (context) => SettingsScreenPage1(),
          "/restoranPage": (context) => HomePage(),
          "/resetPage": (context) => ResetPage(),
          "/secondPage": (context) => secondPage(),
          "/mapsPage": (context) => Maps(),
          "/mapsPage2": (context) => MapScreen(),
          "/firstPage": (context) => FirstPage(),
          "/loginPage": (context) => LoginPage(),
          "/signUp": (context) => SignUp(),
        },
        theme: ThemeData(
          scaffoldBackgroundColor: CustomColors.scaffoldBackgroundColor,
        ),
        home: Scaffold(
          body: EmailScreen(),
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Page2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      key: globalKey,
      initialRoute: AppRoutes.intial,
      routes: AppRoutes.getRoutes(context),
    );
  }
}
