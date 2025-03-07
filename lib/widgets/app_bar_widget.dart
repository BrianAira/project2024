import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(31, 115, 180, 221),
      titleSpacing: 0,
      title: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Aira business',
              style: TextStyle(
                color: Color.fromARGB(255, 20, 43, 66),
                fontFamily: 'Arial',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                _launchURL('https://www.facebook.com/?locale=es_LA');
              },
              icon: const Icon(Icons.facebook)),
          IconButton(
              onPressed: () {
                _launchURL('https://mail.google.com/mail/u/0/#inbox');
              },
              icon: const Icon(Icons.email)),
          IconButton(
              onPressed: () {
                _launchURL('https://www.linkedin.com/feed/');
              },
              icon: const Icon(Icons.work))
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

//fuuncion para abrir enlaces
void _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'No se puede abrir el enlace $url';
  }
}
