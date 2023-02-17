import 'package:admin_client_portfolio/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/Cards/ImageCard.dart';
import '../../models/paragraph_model.dart';
import '../../models/post_model.dart';
import '../../states/States.dart';
import '../../states/ThemeModel.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({Key? key}) : super(key: key);

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

final TextEditingController linkController = TextEditingController();

class _PostDetailPageState extends State<PostDetailPage> {

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isDark = Provider.of<ModelTheme>(context).isDark;
    Function setIndexContent = Provider.of<States>(context).setIndexContent;
    Function setLastIndexContent =
        Provider.of<States>(context).setLastIndexContent;

    Post currentPost = Provider.of<States>(context).currentPost;
    List<String> currentPostLinks = Provider.of<States>(context).currentPostLinks;

    final TextEditingController postNameController =
        TextEditingController(text: currentPost.postName);
    final TextEditingController postTypeController =
        TextEditingController(text: currentPost.postType);
    final TextEditingController postTitleController =
        TextEditingController(text: currentPost.postTitle);
    final TextEditingController postIntroTextController =
        TextEditingController(text: currentPost.postIntro);
    final TextEditingController postIntroImageController =
        TextEditingController(text: currentPost.introImg);
    // en son postun link lsitesini düzenlemede kaldım

    Function setCurrentParagraph =
        Provider.of<States>(context).setCurrentParagraph;
    Function setCurrentParagraphIndex =
        Provider.of<States>(context).setCurrentParagraphIndex;
    Paragraph paragraphInstance = Paragraph();

    Function addPostLink = Provider.of<States>(context).addPostLink;
    Function updatePostLink = Provider.of<States>(context).updatePostLink;
    Function deletePostLink = Provider.of<States>(context).deletePostLink;

    void deleteBlog(int id) async {
      await Services().deleteBlog(id).then((res) => {
            if (res["statusCode"] == 204)
              {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Blog Başarıyla Silindi"))),
                setIndexContent(0),
              }
            else
              {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(res["errorMessage"])))
              }
          });
    }

    void updateBlog(Post post, int id) async {
      await Services().updateBlog(post, id).then((res) => {
            if (res.runtimeType == Post)
              {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Post Başarıyla Güncellendi"))),
                setIndexContent(0),
              }
            else
              {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Post Başarıyla Güncellendi"))),
              }
          });
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
                IconButton(
                    onPressed: () => {Navigator.of(context).pop()},
                    icon: const Icon(Icons.arrow_back)),
                const Text('Link Ekle/Düzenle'),
                IconButton(
                    onPressed: () => {
                          deletePostLink(linkController.text),
                          Navigator.of(context).pop()
                        },
                    icon: const Icon(Icons.delete)),
              ],
            ),
            content: TextFormField(
              controller: linkController,
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Ekle/Düzenle',
                  style:
                      TextStyle(color: isDark ? null : Colors.deepPurple[800]),
                ),
                onPressed: () {
                  link == ""
                      ? addPostLink(linkController.text)
                      : updatePostLink(linkController.text, index);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    Future<void> sureCheckDialog(BuildContext context, int id) {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Silmek İstediğine Emin Misin?'),
            actions: <Widget>[
              TextButton(
                  onPressed: () => {Navigator.of(context).pop()},
                  child:
                      const Text('Hayır', style: TextStyle(color: Colors.red))),
              TextButton(
                  onPressed: () =>
                      {deleteBlog(id), Navigator.of(context).pop()},
                  child: const Text('Evet,eminim.')),
            ],
          );
        },
      );
    }

    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () => {setIndexContent(0)},
                icon: const Icon(Icons.arrow_back)),
            const Text('Blog Düzenle: '),
            IconButton(
                onPressed: () => {
                      sureCheckDialog(context, currentPost.id!),
                    },
                icon: const Icon(Icons.delete)),
          ],
        ),
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
              onTap: () => {
                setCurrentParagraph(paragraphInstance),
                setIndexContent(8),
                setLastIndexContent(11)
              },
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
            crossAxisCount:
                (width < 1060 ? (width < 800 ? (width < 650 ? 2 : 4) : 6) : 8),
          ),
          itemCount: currentPost.paragraphs.length,
          itemBuilder: (BuildContext context, int index) {
            return ImageCard(() => {
                  setCurrentParagraph(currentPost.paragraphs[index]),
                  setCurrentParagraphIndex(index),
                  setIndexContent(9),
                  setLastIndexContent(11),
                });
          },
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Linkler'),
            InkWell(
              onTap: () => {linkDialog(context, "", 0)},
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
          itemCount: currentPostLinks.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () => {linkDialog(context, currentPostLinks[index], index)},
              child: Chip(
                label: Text(currentPostLinks[index]),
                labelStyle: const TextStyle(overflow: TextOverflow.ellipsis),
                clipBehavior: Clip.none,
              ),
            );
          },
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () => {
            currentPost.links = currentPostLinks,
            updateBlog(currentPost, currentPost.id),
          },
          child: const Text('Bloğu Düzenle'),
        ),
      ],
    );
  }
}
