import 'package:admin_client_portfolio/components/Cards/ProcessCard.dart';
import 'package:admin_client_portfolio/states/States.dart';
import 'package:admin_client_portfolio/states/ThemeModel.dart';
import 'package:admin_client_portfolio/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

List<bool> _isOpen = [false, false, false];
List items = <Map<String, dynamic>>[
  {
    "processTitle": "Blog Yazılarım",
    "iconName": Icons.signpost,
    "page": 0,
  },
  {
    "processTitle": "Projelerim",
    "iconName": Icons.library_books,
    "page": 1,
  },
  {
    "processTitle": "Profilim",
    "iconName": Icons.person,
    "page": 2,
  },
];

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    Function setIndexContent = Provider.of<States>(context).setIndexContent;
    int indexContent = Provider.of<States>(context).indexContent;

    return Consumer(builder: (context, ModelTheme theme, child) {
      return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: 200, //darkCard
              color:
                  theme.isDark ? AppColors().darkCard : Colors.deepPurple[300],
              child: ListView(
                children: [
                  ExpansionPanelList(
                    expansionCallback: (i, isOpen) => setState(() {
                      _isOpen[i] = !isOpen;
                    }),
                    children: [
                      ExpansionPanel(
                        backgroundColor: theme.isDark ? AppColors().darkCard : Colors.deepPurple[300],
                          headerBuilder: (context, isOpen) {
                            return ProcessCard(
                                "Bloglar", Icons.signpost_sharp, () => setState(() {
                              _isOpen[0] = !isOpen;
                            }), false);
                          },
                          body: Column(
                            children: [
                              ProcessCard(
                                  "Blogları Listele", Icons.list, () => {setIndexContent(0)}, indexContent == 0),
                              ProcessCard(
                                  "Yeni Blog Oluştur", Icons.add, () => {setIndexContent(1)}, indexContent == 1),
                            ],
                          ),
                          isExpanded: _isOpen[0]),
                      ExpansionPanel(
                          backgroundColor: theme.isDark ? AppColors().darkCard : Colors.deepPurple[300],
                          headerBuilder: (context, isOpen) {
                            return ProcessCard(
                                "Projeler", Icons.file_copy, () => setState(() {
                              _isOpen[1] = !isOpen;
                            }), false);
                          },
                          body: Column(
                            children: [
                              ProcessCard(
                                  "Projeleri Listele", Icons.list, () => {setIndexContent(2)}, indexContent == 2),
                              ProcessCard(
                                  "Yeni Projee Oluştur", Icons.add, () => {setIndexContent(3)}, indexContent == 3),
                            ],
                          ),
                          isExpanded: _isOpen[1]),
                      /*ExpansionPanel(
                          backgroundColor: theme.isDark ? AppColors().darkCard : Colors.deepPurple[300],
                          headerBuilder: (context, isOpen) {
                            return ProcessCard(
                                "Kullanıcılar", Icons.people, () => setState(() {
                              _isOpen[2] = !isOpen;
                            }), false);
                          },
                          body: Column(
                            children: [
                              ProcessCard(
                                  "Kullanıcılar Listele", Icons.list, () => {setIndexContent(6)}, indexContent == 6),
                              ProcessCard(
                                  "Yeni Kullanıcı Oluştur", Icons.add, () => {setIndexContent(7)}, indexContent == 7),
                            ],
                          ),
                          isExpanded: _isOpen[2]),*/
                    ],
                  ),
                  ProcessCard(
                      "Hakkımda", Icons.info, () => {setIndexContent(4)}, indexContent == 4),
                  ProcessCard(
                      "Profilim", Icons.person, () => {setIndexContent(5)}, indexContent == 5),
                  ProcessCard(
                      "Çıkış Yap",
                      Icons.exit_to_app,
                      () => {
                            Navigator.pushReplacementNamed(
                                context, 'login_view')
                          }, false),
                ],
              )));
    });
  }
}
/*ProcessCard(
                      items[index]["processTitle"],
                      items[index]["iconName"],
                          () => {setIndexContent(items[index]["page"])}),*/
