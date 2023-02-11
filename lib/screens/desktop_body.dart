import 'package:admin_client_portfolio/components/CustomDrawer.dart';
import 'package:admin_client_portfolio/components/Header.dart';
import 'package:admin_client_portfolio/states/States.dart';
import 'package:admin_client_portfolio/states/ThemeModel.dart';
import 'package:admin_client_portfolio/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDesktopBody extends StatefulWidget {
  final String title;
  final List contents;

  const MyDesktopBody(this.title, this.contents, {Key? key}) : super(key: key);

  @override
  State<MyDesktopBody> createState() => _MyDesktopBodyState();
}

class _MyDesktopBodyState extends State<MyDesktopBody> {
  @override
  Widget build(BuildContext context) {
    int indexContent = Provider.of<States>(context).indexContent;
    return Consumer(builder: (context, ModelTheme themenotifier, child) {
      return Scaffold(
        backgroundColor: themenotifier.isDark
            ? AppColors().darkBackground
            : Colors.deepPurple[200],
        appBar: Header(widget.title),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomDrawer(),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(8),
                  color: themenotifier.isDark
                      ? AppColors().darkCard
                      : Colors.deepPurple[300],
                  child: widget.contents[indexContent],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
