import 'package:flutter/material.dart';
import 'package:uepgacadonline_flutter/misc/custom_icons_icons.dart';
import 'package:uepgacadonline_flutter/widgets/base_card.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutCard extends StatelessWidget {
  AboutCard();

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      Icon(CustomIcons.github, size: 100.0, color: Color(0xff4a6aff)),
      Text("Sobre".toUpperCase(),
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xff4a6aff))),
      Column(
        children: <Widget>[
          Text(
              "Projeto opensource desenvolvido por alunos e ex-alunos da universidade.",
              textAlign: TextAlign.center),
          SizedBox(height: 8.0),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: "O projeto se encontra no ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff4a6aff))),
                TextSpan(
                    text: "github",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff5a6aff))),
                TextSpan(
                    text: " sendo que todos podem contribuir ❤️",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff4a6aff))),
              ],
            ),
          ),
          SizedBox(height: 8.0),
          Text(
              "Não há uso de nenhuma API privilegiada da universidade, todos os dados são extraídos através de análise de texto do portal web. O único objetivo desse projeto é melhorar a qualidade do portal para os alunos da universidade.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey)),
        ],
      ),
      onTap: () async {
        final url = "https://github.com/pstwh/uepgacadonline-flutter";
        await canLaunch(url) ? await launch(url) : throw 'Url: $url inválida';
      },
    );
  }
}
