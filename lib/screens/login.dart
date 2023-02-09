import 'package:admin_client_portfolio/states/ThemeModel.dart';
import 'package:admin_client_portfolio/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ModelTheme theme, child) {
      return Scaffold(
          backgroundColor: theme.isDark
              ? AppColors().darkBackground
              : Colors.deepPurple[200],
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: AlignmentDirectional.center,
              child: SizedBox(
                width: 800,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Mail",
                        hintText: "ornek@gmail.com",
                      ),
                      controller: emailController,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Şifre",
                        hintText: "Şifre",
                      ),
                      controller: passwordController,
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () => {
                        Navigator.pushReplacementNamed(context, 'home_view')
                      },
                      child: const Text('Giriş Yap'),
                    ),
                  ],
                ),
              ),
            ),
          ));
    });
  }
}
