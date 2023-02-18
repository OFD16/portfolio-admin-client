import 'package:admin_client_portfolio/states/ThemeModel.dart';
import 'package:admin_client_portfolio/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostCard extends StatefulWidget {
  final String image;
  final String title;
  void Function()? onTap;
  PostCard(this.image, this.title,this.onTap, {Key? key}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isDark = Provider.of<ModelTheme>(context).isDark;

    bool isUrl(String urlString) {
      try {
        Uri uri = Uri.parse(urlString);
        return uri.isAbsolute;
      } catch (e) {
        return false;
      }
    }
    bool isValidUrl = isUrl(widget.image);  // returns true
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 8,left: 8,right: 8),
        decoration: BoxDecoration(
            color: isDark ? (width < 600 ? AppColors().darkCard : AppColors().darkBackground ) : Colors.purple[800],
            borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9), // Image border
                child: Image.network(isValidUrl ? widget.image : "https://cdn.pixabay.com/photo/2016/07/16/22/51/abstract-1522884_960_720.jpg", fit: BoxFit.cover),
              ),
            ),
            Expanded(
              flex: 1,
                child: Text(widget.title, overflow: TextOverflow.ellipsis, maxLines: 1,)),
          ],
        ),
      ),
    );
  }
}