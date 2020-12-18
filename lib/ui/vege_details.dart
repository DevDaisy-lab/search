import 'package:flutter/material.dart';
//import 'package:path_provider/path_provider.dart';

import '../model/vege.dart';

class VegeDetails extends StatefulWidget {
  final Vege vege;
  final List<Vege> listVege;

  VegeDetails({this.vege, this.listVege});

  @override
  _VegeDetailsState createState() => _VegeDetailsState();
}

class _VegeDetailsState extends State<VegeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 50, top: 10),
            child: Center(
              child: Text(
                widget.vege.name,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 70),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40, top: 20),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Image.network(widget.vege.imageUrl),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    "About",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    widget.vege.about,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Calories",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.vege.calories,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
