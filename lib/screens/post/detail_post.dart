import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/Cards/ImageCard.dart';
import '../../models/medias_model.dart';
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
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isDark = Provider.of<ModelTheme>(context).isDark;
    Function setIndexContent = Provider.of<States>(context).setIndexContent;

    Post currentPost = Provider.of<States>(context).currentPost;
    int currentPostIndex = Provider.of<States>(context).currentPostIndex;
    Function updatePost = Provider.of<States>(context).updatePost;
    Function deletePost = Provider.of<States>(context).deletePost;

    final TextEditingController postNameController = TextEditingController(text: currentPost.postName);
    final TextEditingController postTypeController = TextEditingController(text: currentPost.postType);
    final TextEditingController postTitleController = TextEditingController(text: currentPost.postTitle);
    final TextEditingController postIntroTextController = TextEditingController(text: currentPost.postIntro);
    final TextEditingController postIntroImageController = TextEditingController(text: currentPost.introImg);
    // en son postun paragraf objelerinin lsitesini düzenleme sayfasına paragrafları göndermede kaldım
    List<Paragraph> paragraphsList = currentPost.paragraphs;
    Function clearParagraphs1 = Provider.of<States>(context).clearParagraphs1;
    Function setCurrentParagraph = Provider.of<States>(context).setCurrentParagraph;
    int paragraphIndex = Provider.of<States>(context).paragraphIndex;
    Function setCurrentIndex = Provider.of<States>(context).setCurrentIndex;
    Paragraph paragraphInstance = Paragraph();

    List<String> linksPostList = Provider.of<States>(context).linksPostList;
    Function addPostLink = Provider.of<States>(context).addPostLink;
    Function updatePostLink = Provider.of<States>(context).updatePostLink;
    Function deletePostLink = Provider.of<States>(context).deletePostLink;
    Function clearPostLinks = Provider.of<States>(context).clearPostLinks;

    Future<void> _linkDialog(BuildContext context, String link, int index) {
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () => {setIndexContent(0)},
                icon: const Icon(Icons.arrow_back)),
            const Text('Blog Düzenle: '),
            IconButton(
                onPressed: () => {
                  deletePost(currentPost),
                      setIndexContent(0)
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
          itemCount: paragraphsList.length,
          itemBuilder: (BuildContext context, int index) {
            return ImageCard(() => {

              /*setCurrentParagraph(paragraphsList[index]),
              setCurrentIndex(index),
              setIndexContent(9),*/
            });
          },
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Linkler'),
            InkWell(
              onTap: () => {_linkDialog(context, "",0)},
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
              onTap: ()=>{_linkDialog(context, linksPostList[index], index)},
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
            print('paragraflar : ${currentPost.paragraphs}'),
            print('paragrafların sayısı : ${currentPost.paragraphs.length}'),
/*            currentPost.postName = postNameController.text,
            currentPost.postType = postTypeController.text,
            currentPost.postTitle = postTitleController.text,
            currentPost.introImg = postIntroImageController.text,
            currentPost.postIntro = postIntroTextController.text,
            currentPost.paragraphs = paragraphsList,
            currentPost.medias = Medias(videos: [],images: []),
            currentPost.postOwner = 0, // localdeki login olmuş user id si gönderilicek
            currentPost.links = linksPostList,
            updatePost(currentPost, currentPostIndex),
            currentPost.postName = postNameController.text,
            currentPost.postType = postTypeController.text,
            currentPost.postTitle = postTitleController.text,
            currentPost.introImg = postIntroImageController.text,
            currentPost.postIntro = postIntroTextController.text,
            currentPost.paragraphs = paragraphsList,
            currentPost.medias = Medias(videos: [],images: []),
            currentPost.postOwner = 0, // localdeki login olmuş user id si gönderilicek
            currentPost.links = linksPostList,
            updatePost(currentPost),
            setIndexContent(0),
            //Sayfadan çıktıktna sonra içeriğini temizleme
            postNameController.text = "",
            postTypeController.text = "",
            postTitleController.text = "",
            postIntroImageController.text = "",
            postIntroTextController.text = "",
            clearParagraphs1(),
            clearPostLinks(),*/
          },
          child: const Text('Bloğu Düzenle'),
        ),
      ],
    );
  }
}
