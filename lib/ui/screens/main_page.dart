import 'package:creditoverde/constants.dart';
import 'package:creditoverde/models/models.dart';
import 'package:creditoverde/ui/screens/cards/reels_page.dart';
import 'package:creditoverde/ui/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(
        "assets/main/main-back.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: Column(
            children: <Widget>[
              topBarWidget(),
              const Spacer(),
              AspectRatio(
                aspectRatio: 1.00,
                child: PageView.builder(
                    itemCount: dataList.length,
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    itemBuilder: (context, index) {
                      return carouselView(index);
                    }),
              ),
              const Spacer(),
              bottomBarWidget(),
            ],
          ),
        ),
      )
    ]);
  }

  Widget carouselView(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        return carouselCard(dataList[index]);
      },
    );
  }

  Widget topBarWidget() {
    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 75, left: 20),
                  child: Text(getCurrentDate(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Manjari',
                          color: Colors.white,
                          fontSize: 20)),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 0, left: 20),
                    child: Row(
                      children: <Widget>[
                        const Padding(
                            padding: EdgeInsets.only(top: 11),
                            child: Text("Olá, João!",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Manjari',
                                    color: Colors.white,
                                    fontSize: 25))),
                        Image.asset("assets/main/little-hand.png",
                            width: 30, height: 30)
                      ],
                    )),
              ]),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 60, right: 20),
            child: Center(
                child: Image.asset(
              "assets/main/avatar.png",
              width: 100,
              height: 100,
            )),
          )
        ],
      ),
      const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 0, left: 15, right: 15),
          child: SearchBar(trailing: <Widget>[
            Spacer(),
            Padding(
                padding: EdgeInsets.only(right: 20), child: Icon(Icons.search))
          ]))
    ]);
  }

  String getCurrentDate() {
    var date = DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    var formattedDate = "${dateParse.day}";
    if (dateParse.month == 10) {
      formattedDate += " Out";
    }
    return formattedDate.toString();
  }

  Widget bottomBarWidget() {
    return Container(
        width: double.infinity,
        height: 100,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            const Spacer(),
            Image.asset(
              "assets/main/icons/icone_exit.png",
              width: 70,
              height: 70,
            ),
            const Spacer(),
            Image.asset(
              "assets/main/icons/icone_friend.png",
              width: 70,
              height: 70,
            ),
            const Spacer(),
            Image.asset(
              "assets/main/icons/icone_add.png",
              width: 70,
              height: 70,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChatScreen()));
              },
              child: Image.asset(
              "assets/main/icons/icone_chat.png",
              width: 70,
              height: 70,
            ),
            ),
            
            const Spacer(),
            Image.asset(
              "assets/main/icons/icone_favorito.png",
              width: 70,
              height: 70,
            ),
            const Spacer(),
          ],
        ));
  }

  Widget carouselCard(DataModel data) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 4), blurRadius: 4, color: Colors.black26)
              ]),
          child: Hero(
            tag: data.id,
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VideoScreen()));
                },
                child: Column(children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 10, left: 10, right: 10),
                      child: Container(
                          constraints: BoxConstraints(
                            minHeight: 100, //minimum height

                            maxHeight: 150,
                            //maximum height set to 100% of vertical height

                            maxWidth: MediaQuery.of(context).size.width,
                            //maximum width set to 100% of width
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(data.imageName),
                              fit: BoxFit.cover,
                            ),
                          ))),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Text(
                      data.title,
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 25,
                          fontFamily: 'Manjari',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, left: 30, right: 30),
                    child: Text(
                      textAlign: TextAlign.center,
                      data.description,
                      style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 11,
                          fontFamily: 'Manjari',
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        child: SizedBox(
                          width: 130,
                          height: 38,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const VideoScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: mainColor,
                            ),
                            child: const Text(
                              'Assista',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Manjari',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      )),
                ])),
          ),
        ),
      ),
    );
  }
}
