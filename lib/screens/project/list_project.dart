import 'package:admin_client_portfolio/components/Cards/PostCard.dart';
import 'package:flutter/material.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

List myProjects = [
  {
    "id": 1,
    "project_name": "proje adı 1",
    "project_type": "proje tipi 1",
    "project_title": "proje başlıpı 1",
    "intro_image":
        "https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg",
    "project_intro":
        "1 I am a 20-year-old, self-taught freelance UI/UX designer based in Turkey. My passion is to using design to inspire and impact others, so I make it a point to constantly improve my skills and write my learnings in both English and Turkish.",
    "paragraphs": [
      {
        "first_video": "",
        "first_image": "",
        "left_image": "",
        "paragpaph":
            "Lorem ipsum dolor sit amet consectetur. In volutpat sed quis tortor magna libero mi. At aliquam nec consectetur sem eget nunc aliquam. In adipiscing sit tristique nunc sodales. Id nisi libero massa mi senectus quis. Erat varius tortor lobortis et nunc laoreet cras. Lorem ipsum dolor sit amet consectetur. In volutpat sed quis tortor magna libero mi. At aliquam nec consectetur sem eget nunc aliquam. In adipiscing sit tristique nunc sodales. Id nisi libero massa mi senectus quis. Erat varius tortor lobortis et nunc laoreet cras. Lorem ipsum dolor sit amet consectetur. In volutpat sed quis tortor magna libero mi. At aliquam nec consectetur sem eget nunc aliquam. In adipiscing sit tristique nunc sodales. Id nisi libero massa mi senectus quis. Erat varius tortor lobortis et nunc laoreet cras. ",
        "right_image": "",
        "last_image": "",
        "last_video": "",
      }
    ],
    "medias": {
      "videos": [
        "https://www.youtube.com/watch?v=lSIWNfNzJ18",
        "https://www.youtube.com/watch?v=G1GgjXbc6VM"
      ],
      "images": [
        "https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg"
      ],
    },
    "members": ["ali", "ayşe"],
    "links": ["https://www.twitch.tv/", "https://www.twitch.tv/elraenn"]
  },
  {
    "id": 2,
    "project_name": "proje adı 2",
    "project_type": "proje tipi 2",
    "project_title": "proje başlıpı 2",
    "intro_image":
        "https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg",
    "project_intro":
        "1 I am a 20-year-old, self-taught freelance UI/UX designer based in Turkey. My passion is to using design to inspire and impact others, so I make it a point to constantly improve my skills and write my learnings in both English and Turkish.",
    "paragraphs": [],
    "medias": {
      "videos": [
        "https://www.youtube.com/watch?v=lSIWNfNzJ18",
        "https://www.youtube.com/watch?v=G1GgjXbc6VM"
      ],
      "images": [
        "https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg"
      ],
    },
    "members": ["ali", "ahmet"],
    "links": ["https://www.twitch.tv/", "https://www.twitch.tv/elraenn"]
  }
];

class _ProjectPageState extends State<ProjectPage> {
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
        itemCount: myProjects.length,
        itemBuilder: (BuildContext context, int index) {
          print(width);
          return PostCard(myProjects[index]["intro_image"],
              myProjects[index]["project_title"], () => {});
        });
  }
}
