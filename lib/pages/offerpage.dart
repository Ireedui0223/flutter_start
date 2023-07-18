import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Wrap(
          children: [
            Offer(title: "title", descripion: "descripion"),
            Offer(title: "title", descripion: "descripion"),
            Offer(title: "title", descripion: "descripion"),
            Offer(title: "title", descripion: "descripion"),
            Offer(title: "title", descripion: "descripion"),
            Offer(title: "title", descripion: "descripion"),
            Offer(title: "title", descripion: "descripion")
          ],
        )
      ],
    );
  }
}

class Offer extends StatelessWidget {
  final String title;
  final String descripion;

  const Offer({
    super.key,
    required this.title,
    required this.descripion,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 300,
      child: Card(
        elevation: 7,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              image: AssetImage("images/profile.png"),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline3,
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  descripion,
                  style: Theme.of(context).textTheme.headline6,
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
