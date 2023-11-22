import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:tcm_project/prensentation/home/home_page.dart';
import 'package:tcm_project/prensentation/login_signup/login_page.dart';
import 'package:tcm_project/prensentation/login_signup/signup_page.dart';
import 'package:tcm_project/prensentation/tcg_overview/sub_pages/overview.dart';
import 'package:tcm_project/prensentation/tcg_overview/overview_root.dart';
import 'package:tcm_project/theme.dart';
import 'application/services/load_saved_properties.dart' as load_properties;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final bool state = await load_properties.loadProperties() ?? false;
  runApp(MyApp(state: state));
}

class MyApp extends StatelessWidget {
  final bool state;
  const MyApp({super.key, required this.state, required});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trading Card Colletion Manager - TCM',
      
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light, 

      onGenerateRoute: (settings) {
        if (settings.name == '/overview_root'){
          final args = settings.arguments as Map<String, dynamic>;
          final tcgImagePath = args['tcgImagePath'];
          return MaterialPageRoute(builder: (context) => OverviewRoot(tcgImagePath: tcgImagePath));
        }
        return null;
      },
      routes: <String, WidgetBuilder>{
        '/login' : (BuildContext context) => Login(rememberUser: state),
        '/signUp' : (BuildContext context) => const SignUp(),
        '/home' : (BuildContext context) => const HomePage(),
        '/overview' : (BuildContext context) => const Overview(),
        //'/overview' : (BuildContext contet) => Overview(tcgImagePath: tcgImagePath,), //!variable wird bei aufruhen mitgegeben !!!
      },
      home: Login(rememberUser: state),
    );
  }
}
