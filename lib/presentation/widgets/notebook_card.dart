import 'package:flutter/material.dart';

import '../../models/card_content.dart';

class NoteBookCard extends StatelessWidget {
  final CardContent card;
  final int toBeDisplayedList;
  const NoteBookCard(
      {required this.card, super.key, required this.toBeDisplayedList});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (card.routeName != null) {
          Navigator.pushNamed(context, card.routeName!,
              arguments: toBeDisplayedList);
        }
      },
      child: SizedBox(
        height: 250,
        child: Card(
          elevation: 5,
          shadowColor: Colors.black,
          margin: const EdgeInsets.all(10),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: GridTile(
            // footer: _buildTitle(),
            child: _buildImage(),
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(card.imgPath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color.fromARGB(200, 0, 0, 0), Colors.transparent],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              card.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white,
              ),
              //    textAlign: TextAlign.left,
            ),
          ),
        ),
      ),
    );
  }
}
