import 'package:admin_client_portfolio/components/Cards/PostCard.dart';
import 'package:admin_client_portfolio/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../states/States.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    Function setIndexContent = Provider.of<States>(context).setIndexContent;

    List<Post> myPosts = Provider.of<States>(context).myPosts;
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount:
              (width < 1060 ? (width < 800 ? (width < 650 ? 1 : 2) : 3) : 4),
        ),
        itemCount: myPosts.length,
        itemBuilder: (BuildContext context, int index) {
          return PostCard(myPosts[index].introImg, myPosts[index].postName, ()=>{
            setIndexContent(11),
          });
        });
  }
}
