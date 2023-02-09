import 'package:admin_client_portfolio/routes.dart';
import 'package:admin_client_portfolio/states/States.dart';
import 'package:admin_client_portfolio/states/ThemeModel.dart';
import 'package:admin_client_portfolio/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<States>(create: (_) => States()),
        ChangeNotifierProvider<ModelTheme>(create: (_) => ModelTheme()),
      ],
      child: Consumer<ModelTheme>(
          builder: (context, ModelTheme themeNotifier, child) {
        return MaterialApp(
          title: 'Portfolio Admin Client',
          theme: themeNotifier.isDark
              ? AppColors().darkTheme
              : AppColors().lightTheme,
          debugShowCheckedModeBanner: false,
          //snapshot.data == null ? "login_view" : "home_view",
          initialRoute: "login_view",
          routes: routes,
        );
      }),
    );
  }
}
