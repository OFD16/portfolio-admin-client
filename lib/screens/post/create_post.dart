import 'package:admin_client_portfolio/components/Cards/ImageCard.dart';
import 'package:admin_client_portfolio/models/medias_model.dart';
import 'package:admin_client_portfolio/models/paragraph_model.dart';
import 'package:admin_client_portfolio/sharedPreferences/localUser.dart';
import 'package:admin_client_portfolio/states/States.dart';
import 'package:admin_client_portfolio/states/ThemeModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/post_model.dart';
import '../../models/user_model.dart';
import '../../services/services.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

final TextEditingController postNameController = TextEditingController(text: "");
final TextEditingController postTypeController = TextEditingController(text: "");
final TextEditingController postTitleController = TextEditingController(text: "");
final TextEditingController postIntroTextController = TextEditingController(text: "");
final TextEditingController postIntroImageController = TextEditingController(text: "");

final TextEditingController linkController = TextEditingController();

class _CreatePostPageState extends State<CreatePostPage> {
  User localUser = User(id: 0, firstName: "", lastName: "", age: 0, email: "", userImg: "", introduction: "", markedProjects: [], markedBlogs: [], role: "");

  @override
  void initState() {
    super.initState();
    _loadLocalUser();
  }

  void _loadLocalUser() async {
    localUser = await LocalUserData().getLocalUser();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ModelTheme>(context).isDark;
    Function setCurrentParagraph = Provider.of<States>(context).setCurrentParagraph;
    Function setIndexContent = Provider.of<States>(context).setIndexContent;
    Paragraph paragraphInstance = Paragraph();

/*    List<Paragraph> paragraphListInstance = [];
    Function addPost = Provider.of<States>(context).addPost;*/

    List<String> linksPostList = Provider.of<States>(context).currentPostLinks;
    Function addPostLink = Provider.of<States>(context).addPostLink;
    Function updatePostLink = Provider.of<States>(context).updatePostLink;
    Function deletePostLink = Provider.of<States>(context).deletePostLink;
    Function clearPostLinks = Provider.of<States>(context).clearPostLinks;

    Function setCurrentIndex1 = Provider.of<States>(context).setCurrentIndex1;

    List<Paragraph> paragraphsList1 = Provider.of<States>(context).paragraphsList1;
    Function clearParagraphs1 = Provider.of<States>(context).clearParagraphs1;
    double width = MediaQuery.of(context).size.width;

    Post newPost = Post(
        id: 0,  // id gönderilmeyecek
        postName: '',
        postType: '',
        postTitle: '',
        introImg: '',
        postIntro: '',
        paragraphs: [],
        medias: Medias(),
        postOwner: 0, //localde login olmuş user id si göndeirlicek
        links: []);

    void createBlog (Post post) async {
      await Services().createBlog(post).then((res) => {
        if(newPost.postOwner == res.postOwner){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Blog Başarıyla Oluşturuldu"))),
          setIndexContent(0),
          //Sayfadan çıktıktna sonra içeriğini temizleme
          postNameController.text = "",
          postTypeController.text = "",
          postTitleController.text = "",
          postIntroImageController.text = "",
          postIntroTextController.text = "",
          clearParagraphs1(),
          clearPostLinks(),
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Blog oluşturulurken bir sorun oluştu :(")))
        }
      } );
    }

    Future<void> linkDialog(BuildContext context, String link, int index) {
      linkController.text = link;
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: ()=>{Navigator.of(context).pop()}, icon: const Icon(Icons.arrow_back)),
                const Text('Link Ekle/Düzenle'),
                IconButton(onPressed: ()=>{deletePostLink(linkController.text), Navigator.of(context).pop()}, icon: const Icon(Icons.delete)),
              ],
            ),
            content: TextFormField(controller: linkController,),
            actions: <Widget>[
              TextButton(
                child: Text('Ekle/Düzenle', style: TextStyle(color: isDark ? null : Colors.deepPurple[800]),),
                onPressed: () {
                  link == "" ? addPostLink(linkController.text) : updatePostLink(linkController.text, index);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return ListView(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Blog Adı",
            hintText: "Hata  Blog",
          ),
          controller: postNameController,
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Blog Tipi",
            hintText: "Redesign",
          ),
          controller: postTypeController,
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Blog Başlığı",
            hintText: "UI/UX Design",
          ),
          controller: postTitleController,
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Blog İntro Resim Linki: ",
            hintText: "url",
          ),
          controller: postIntroImageController,
        ),
        //ImageCard("Blognin Ana Resim Linki:"),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Blog İntrosu",
            hintText: "...",
          ),
          controller: postIntroTextController,
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Paragraflar'),
            InkWell(
              onTap: () =>
              {setCurrentParagraph(paragraphInstance), setIndexContent(8)},
              child: const Row(
                children: [
                  Text('Paragraf Ekle'),
                  Icon(Icons.add),
                ],
              ),
            )
          ],
        ),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            crossAxisCount: (width < 1060
                ? (width < 800 ? (width < 650 ? 2 : 4) : 6)
                : 8),
          ),
          itemCount: paragraphsList1.length,
          itemBuilder: (BuildContext context, int index) {
            return ImageCard(() => {
              setCurrentParagraph(paragraphsList1[index]),
              setCurrentIndex1(index),
              setIndexContent(9),
            });
          },
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Linkler'),
            InkWell(
              onTap: () => {linkDialog(context, "",0)},
              child: const Row(
                children: [
                  Text('Link Ekle'),
                  Icon(Icons.add),
                ],
              ),
            )
          ],
        ),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            crossAxisCount: (width < 1060
                ? (width < 800 ? (width < 650 ? 5 : 5) : 10)
                : 15),
          ),
          itemCount: linksPostList.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: ()=>{linkDialog(context, linksPostList[index], index)},
              child: Chip(
                label: Text(linksPostList[index]),
                labelStyle: const TextStyle(
                    overflow: TextOverflow.ellipsis
                ),
                clipBehavior: Clip.none,

              ),
            );
          },
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () => {
            newPost.postName = postNameController.text,
            newPost.postType = postTypeController.text,
            newPost.postTitle = postTitleController.text,
            newPost.introImg = postIntroImageController.text,
            newPost.postIntro = postIntroTextController.text,
            newPost.paragraphs = paragraphsList1,
            newPost.medias = Medias(videos: [],images: []),
            newPost.postOwner = localUser.id, // localdeki login olmuş user id si gönderilicek
            newPost.links = linksPostList,
            createBlog(newPost),
          },
          child: const Text('Bloğu Oluştur'),
        ),
      ],
    );
  }

}
