// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Pages extends StatelessWidget{
  const Pages({super.key});

  void _launcherUrl(String url)async{
    await launch(url);
  }

  PageViewModel _pageView({title,body,urlImg,urlLancher}){
    return PageViewModel(
    title:title, 
    body:body,
    image:Center(
    child:Image.network(urlImg),
    ),
    footer:ElevatedButton(
    child: const Text("Let's Go!"),
    onPressed: (){
      _launcherUrl(urlLancher);
     },
    )
   );
  }

  @override
  Widget build(BuildContext context) {
    var listPages = [
    _pageView(title:'twitch',body:'Me sigam na Twitch',
      urlImg:'https://cdn.pixabay.com/photo/2018/05/08/21/29/twitch-3384022_960_720.png',
      urlLancher:'https://www.twitch.tv/bob_lee_oficial'),
      _pageView(title:'Github',body: 'Acessem meu git',
      urlImg: 'https://cdn.pixabay.com/photo/2014/07/15/23/36/github-394322_960_720.png',
      urlLancher: 'https://github.com/Alexgcosta'),
      _pageView(title: 'Linkedin',body: 'Acessem meu Linkedin',
      urlImg: 'https://cdn.pixabay.com/photo/2017/10/04/11/58/linkedin-2815969_960_720.jpg',
      urlLancher:'https://www.linkedin.com/in/alexgcosta/'),
    ];
    return Scaffold(
      body: IntroductionScreen(
        pages: listPages,
        next: const Icon(Icons.navigate_next),
        done: const Text('Fechar'),
        showSkipButton:true,
        skip: const Text('Pular'),
        onDone: (){
          Navigator.of(context).push(MaterialPageRoute(builder:(context)=>AppBar()));
        },

        onSkip:(){Navigator.of(context).push(MaterialPageRoute(builder:(context)=>AppBar()));
          },
      ),

    );
  }

}