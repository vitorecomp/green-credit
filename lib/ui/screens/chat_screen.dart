import 'package:creditoverde/constants.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Column(
        children: <Widget>[
          topBarWidget(),
          ...chatBarWidget(),
          const Spacer(),
          typeBarWidget(),
          bottomBarWidget(),
        ],
      ),
    );
  }

  Widget topBarWidget() {
    return Container(
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(offset: Offset(0, 4), blurRadius: 4, color: Colors.black26)
        ]),
        constraints:
            const BoxConstraints(minHeight: 50, minWidth: double.infinity),
        child: const Padding(
            padding: EdgeInsets.only(top: 45, bottom: 20),
            child: Text(
              textAlign: TextAlign.center,
              "Chat",
              style: TextStyle(
                  color: simpleGray,
                  fontSize: 30,
                  fontFamily: 'Manjari',
                  fontWeight: FontWeight.w700),
            )));
  }

  Widget typeBarWidget() {
    return Container(
        decoration: const BoxDecoration(color: clearGray, boxShadow: [
          BoxShadow(offset: Offset(0, 4), blurRadius: 4, color: Colors.black26)
        ]),
        child: Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
            child: SearchBar(
                constraints: const BoxConstraints(
                  maxHeight: 40,
                  minHeight: 40,
                ),
                leading: Image.asset(
                  "assets/main/icons/icone_smile.png",
                  width: 30,
                  height: 30,
                ),
                trailing: <Widget>[
                  const Spacer(),
                  Image.asset(
                    "assets/main/icons/icone_anexo.png",
                    width: 30,
                    height: 30,
                  ),
                  Image.asset(
                    "assets/main/icons/icone_audio.png",
                    width: 30,
                    height: 30,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        "assets/main/icons/icone_enviar.png",
                        width: 30,
                        height: 30,
                      ))
                ])));
  }

  List<Widget> chatBarWidget() {
    return <Widget>[
      robotChat("Olá, eu sou o Robô do Crédito Verde, tudo bem?"),
      clientChat(
          "Oi, tudo sim, estou com um problema de uma praga no meu plantio, pode me ajudar?"),
      robotChat("Claro, voçe pode me enviar uma photo?"),
      clientPhoto(),
      robotChat(
          "Humm, não sei o que é isto, porem vou enviar a nosso técnico, e entro em contato contigo, pode ser?"),
      clientChat("Tudo bem, fico no aguardo."),
    ];
  }

  Widget clientPhoto() {
    return Container(
        constraints: const BoxConstraints(
        minHeight: 180, 
        maxHeight: 180,
        minWidth: double.infinity),
        alignment: Alignment.centerRight,
        child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              "assets/chat/foto_campo.png",
              width: 200,
              height: 200,
            )));
  }

  Widget clientChat(String text) {
    return Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Row(
          children: <Widget>[
            const Spacer(),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 4,
                          color: Colors.black26)
                    ]),
                constraints: const BoxConstraints(maxWidth: 230),
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      textAlign: TextAlign.left,
                      text,
                      style: const TextStyle(
                          color: simpleGray,
                          fontSize: 15,
                          fontFamily: 'Manjari',
                          fontWeight: FontWeight.w700),
                    ))),
            Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Image.asset(
                  "assets/main/icons/icone_avatar.png",
                  width: 50,
                  height: 50,
                )),
          ],
        ));
  }

  Widget robotChat(String text) {
    return Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Row(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(
                  "assets/main/icons/icone_robo.png",
                  width: 50,
                  height: 50,
                )),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 4,
                          color: Colors.black26)
                    ]),
                constraints: const BoxConstraints(maxWidth: 230),
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      textAlign: TextAlign.left,
                      text,
                      style: const TextStyle(
                          color: simpleGray,
                          fontSize: 15,
                          fontFamily: 'Manjari',
                          fontWeight: FontWeight.w700),
                    )))
          ],
        ));
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
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/main/icons/icone_home.png",
                width: 70,
                height: 70,
              ),
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
            Image.asset(
              "assets/main/icons/icone_chat.png",
              width: 70,
              height: 70,
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
}
