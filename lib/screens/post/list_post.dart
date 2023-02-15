import 'package:admin_client_portfolio/components/Cards/PostCard.dart';
import 'package:admin_client_portfolio/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/paragraph_model.dart';
import '../../services/services.dart';
import '../../states/States.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<Post> blogsList = [];

  @override
  void initState() {
    getBlogs();
    super.initState();
  }
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Function setIndexContent = Provider.of<States>(context).setIndexContent;

    Function setCurrentPost = Provider.of<States>(context).setCurrentPost;
    Function setCurrentPostIndex = Provider.of<States>(context).setCurrentPostIndex;

    List<Post> myPosts = blogsList;
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
            print('currentPost: ${myPosts[index]}'),
            print('currentPost paragraflaro: ${myPosts[index].paragraphs}'),
            print('currentPost paragrafların uzunluğu: ${myPosts[index].paragraphs.length}'),
            setCurrentPost(myPosts[index]),
            setCurrentPostIndex(index),
            setIndexContent(11),
          });
        });
  }

  void getBlogs () async {
    List<Post> lists = await Services().getBlogs();
    blogsList = lists;
  }
}
