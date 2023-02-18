
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../states/ThemeModel.dart';

class ImageCard extends StatelessWidget {
  void Function()? onTap;
  ImageCard(this.onTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ModelTheme>(context).isDark;
    return  InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
            color: isDark ? Colors.grey : Colors.purple[800],
        ),
        child: const Icon(Icons.verified),
      ),
    );
  }
}
