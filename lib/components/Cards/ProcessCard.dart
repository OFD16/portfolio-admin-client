import 'package:admin_client_portfolio/states/ThemeModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProcessCard extends StatefulWidget {
  late String processTitle;
  late IconData iconName;
  void Function()? onTap;
  bool isOpened = false;

  ProcessCard(this.processTitle, this.iconName, this.onTap, this.isOpened, {Key? key})
      : super(key: key);

  @override
  State<ProcessCard> createState() => _ProcessCardState();
}

class _ProcessCardState extends State<ProcessCard> {

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ModelTheme>(context).isDark;

    return Container(
      color: widget.isOpened ? (isDark ? Colors.grey : Colors.deepPurple[400]) : Colors.transparent,
      child: ListTile(
          leading: Icon(widget.iconName),
          title: Text(widget.processTitle),
          onTap: widget.onTap),
    );
  }
}