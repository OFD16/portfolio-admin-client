import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../states/ThemeModel.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const Header(this.title);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
      return AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: themeNotifier.isDark
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.sunny),
            onPressed: () => {
              themeNotifier.isDark
                  ? themeNotifier.isDark = false
                  : themeNotifier.isDark = true,
            },
          ),
        ],
      );
    });
  }
}
