
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/Cards/PostCard.dart';
import '../../models/post_model.dart';
import '../../services/services.dart';
import '../../states/States.dart';
import '../../states/post_provider.dart';

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
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Function setIndexContent = Provider.of<States>(context).setIndexContent;
    Function setLastIndexContent = Provider.of<States>(context).setLastIndexContent;

    Function setCurrentPost = Provider.of<PostStates>(context).setCurrentPost;
    Function setCurrentPostIndex = Provider.of<PostStates>(context).setCurrentPostIndex;
    Function setCurrentPostLinks = Provider.of<PostStates>(context).setCurrentPostLinks;

    List<Post> myPosts = blogsList;
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: (width < 1060 ? (width < 800 ? (width < 650 ? 1 : 2) : 3) : 4)),
        itemCount: myPosts.length,
        itemBuilder: (BuildContext context, int index) {
          return PostCard(myPosts[index].introImg, myPosts[index].postName, ()=>{
            setCurrentPost(myPosts[index]),
            setCurrentPostIndex(index),
            setCurrentPostLinks(myPosts[index].links),
            setLastIndexContent(0),
            setIndexContent(11),
          });
        });
  }

  void getBlogs () async {
    List<Post> lists = await Services().getBlogs();
    blogsList = lists;
  }
}
