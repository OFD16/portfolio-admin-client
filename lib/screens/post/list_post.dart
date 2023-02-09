import 'package:admin_client_portfolio/components/Cards/PostCard.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

List myPosts = [
  {
    "image":
        "https://images.freeimages.com/images/large-previews/d41/bear-combat-2-1332988.jpg",
    "title":
        "Posasdasfgdsjkalsgdjbalfsngdjsnakslgkjasgansgkjas gkjsagbbaskjggkt 1",
  },
  {
    "image":
        "https://images.freeimages.com/images/large-previews/d41/bear-combat-2-1332988.jpg",
    "title": "Post 1",
  },
  {
    "image":
        "https://images.freeimages.com/images/large-previews/d41/bear-combat-2-1332988.jpg",
    "title": "Post 1",
  },
  {
    "image":
        "https://images.freeimages.com/images/large-previews/d41/bear-combat-2-1332988.jpg",
    "title": "Post 1",
  },
  {
    "image":
        "https://images.freeimages.com/images/large-previews/d41/bear-combat-2-1332988.jpg",
    "title": "Post 1",
  },
  {
    "image":
        "https://images.freeimages.com/images/large-previews/d41/bear-combat-2-1332988.jpg",
    "title": "Post 1",
  },
  {
    "image":
        "https://images.freeimages.com/images/large-previews/d41/bear-combat-2-1332988.jpg",
    "title": "Post 1",
  },
  {
    "image":
        "https://images.freeimages.com/images/large-previews/d41/bear-combat-2-1332988.jpg",
    "title": "Post 1",
  },
];

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount:
              (width < 1060 ? (width < 800 ? (width < 650 ? 1 : 2) : 3) : 4),
        ),
        itemCount: myPosts.length,
        itemBuilder: (BuildContext context, int index) {
          print(width);
          return PostCard(myPosts[index]["image"], myPosts[index]["title"], ()=>{});
        });
  }
}
