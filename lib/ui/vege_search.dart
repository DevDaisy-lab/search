import 'package:flutter/material.dart';
import '../model/vege.dart';
import '../ui/vege_details.dart';

class Search extends SearchDelegate {
  final List<Vege> listVege;

  Search(this.listVege);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
        //close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text('not less when three letters'),
          ),
        ],
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final result = listVege.where((v) => v.name.toLowerCase().contains(query));
    return result.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text('No results found'),
              ),
            ],
          )
        : ListView(
            children: result
                .map((v) => Card(
                      elevation: 2,
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VegeDetails(vege: v),
                            ),
                          );
                        },
                        leading: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            child: Image.network(v.imageUrl),
                          ),
                        ),
                        title: Text(
                          v.name,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        trailing: Text(v.calories),
                      ),
                    ))
                .toList(),
          );
  }
}
