import 'package:admin_client_portfolio/models/login_data.dart';
import 'package:admin_client_portfolio/models/medias_model.dart';
import 'package:admin_client_portfolio/models/post_model.dart';
import 'package:admin_client_portfolio/models/project_model.dart';
import 'package:admin_client_portfolio/services/services.dart';
import 'package:admin_client_portfolio/sharedPreferences/localLogin.dart';
import 'package:admin_client_portfolio/sharedPreferences/localUser.dart';
import 'package:admin_client_portfolio/states/ThemeModel.dart';
import 'package:admin_client_portfolio/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/user_model.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
LoginData loginData= LoginData(signMail: "", password: "");
Map result = {};

class _LoginPageState extends State<LoginPage> {
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
                        loginData.signMail = emailController.text,
                        loginData.password = passwordController.text,
                        Services().login(loginData).then((body) => {
                          if(body["statusCode"] == 200){
                            Navigator.pushReplacementNamed(context, 'home_view')
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(body["errorMessage"]))),
                          }
                        }),
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
