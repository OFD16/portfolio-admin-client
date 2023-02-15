import 'package:admin_client_portfolio/routes.dart';
import 'package:admin_client_portfolio/screens/homepage.dart';
import 'package:admin_client_portfolio/screens/login.dart';
import 'package:admin_client_portfolio/sharedPreferences/localLogin.dart';
import 'package:admin_client_portfolio/states/States.dart';
import 'package:admin_client_portfolio/states/ThemeModel.dart';
import 'package:admin_client_portfolio/states/experience_provider.dart';
import 'package:admin_client_portfolio/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool login = false;

  Future getIsLogin()async{
    bool isLogin = await LoginValue().getLoginValue();
    setState(() {
      login = isLogin;
    });
  }

  @override
  void initState(){
    getIsLogin();
    super.initState();
  }

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<States>(create: (_) => States()),
        ChangeNotifierProvider<ModelTheme>(create: (_) => ModelTheme()),
        ChangeNotifierProvider<ExperienceProvider>(create: (_) => ExperienceProvider())
      ],
      child: Consumer<ModelTheme>(
          builder: (context, ModelTheme themeNotifier, child) {
        return MaterialApp(
          title: 'Portfolio Admin Client',
          theme: themeNotifier.isDark
              ? AppColors().darkTheme
              : AppColors().lightTheme,
          debugShowCheckedModeBanner: false,
          home: login ? HomePage() :LoginPage(),
          routes: routes,
        );
      }),
    );
  }
}
