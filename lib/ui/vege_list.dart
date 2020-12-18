import 'package:flutter/material.dart';

import '../model/vege.dart';
import '../services/api.dart';

import '../ui/vege_details.dart';
import '../ui/vege_search.dart';

class VegeList extends StatefulWidget {
  @override
  _VegeListState createState() => _VegeListState();
}

class _VegeListState extends State<VegeList> {
  List<Vege> _veges = [];

  @override
  void initState() {
    super.initState();
    _loadList();
  }

  _loadList() async {
    String fileData =
        await DefaultAssetBundle.of(context).loadString("assets/veges.json");
    setState(() {
      _veges = VegeApi.allVegesFromJson(fileData);
    });
  }

  Widget _buildHerbItem(BuildContext context, int index) {
    Vege vege = _veges[index];

    return Card(
      elevation: 2,
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VegeDetails(
                vege: vege,
                listVege: _veges,
              ),
            ),
          );
        },
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            child: Image.network(vege.imageUrl),
          ),
        ),
        title: Text(
          vege.name,
          style: Theme.of(context).textTheme.headline3,
        ),
        trailing: Text(vege.calories),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Veges",
          style: Theme.of(context).textTheme.headline2,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              return showSearch(
                context: context,
                delegate: Search(_veges),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.greenAccent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                child: Icon(
                  Icons.home,
                  color: Colors.yellow,
                ),
              ),
              GestureDetector(
                child: Icon(
                  Icons.info,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                child: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: _buildHerbItem,
        itemCount: _veges.length,
      ),
    );
  }
}
