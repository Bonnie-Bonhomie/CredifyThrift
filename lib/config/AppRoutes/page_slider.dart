import 'package:flutter/cupertino.dart';

Route slidePage(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnime) => page,
    transitionDuration: const Duration(milliseconds: 250),
    transitionsBuilder: (context, anime, secondaryAnime, child) {
      const begin = Offset(1, 0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInExpo));
      return SlideTransition(position: anime.drive(tween), child: child);
    },
  );
}
