import 'package:admin_client_portfolio/states/ThemeModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageCard extends StatefulWidget {
  void Function()? onTap;
  ImageCard(this.onTap, {Key? key}) : super(key: key);

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ModelTheme>(context).isDark;
    return  InkWell(
      onTap: widget.onTap,
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
