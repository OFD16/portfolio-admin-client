import 'package:admin_client_portfolio/components/CustomDrawer.dart';
import 'package:admin_client_portfolio/components/Header.dart';
import 'package:admin_client_portfolio/states/States.dart';
import 'package:admin_client_portfolio/states/ThemeModel.dart';
import 'package:admin_client_portfolio/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyMobileBody extends StatefulWidget {
  final String title;
  final List contents;

  const MyMobileBody(this.title, this.contents, {Key? key}) : super(key: key);

  @override
  State<MyMobileBody> createState() => _MyMobileBodyState();
}

class _MyMobileBodyState extends State<MyMobileBody> {
  @override
  Widget build(BuildContext context) {
    int indexContent = Provider.of<States>(context).indexContent;

    return Consumer(builder: (context, ModelTheme theme, child) {
      return Scaffold(
        backgroundColor:
            theme.isDark ? AppColors().darkBackground : Colors.deepPurple[200],
        appBar: Header(widget.title),
        drawer: const CustomDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: widget.contents[indexContent],
          ),
        ),
      );
    });
  }
}
