import 'package:LegandsPrsonal_App/screens/chats/side_nav.dart';
import 'package:flutter/material.dart';
import 'package:LegandsPrsonal_App/screens/chats/feedchhistory/chthistory.dart';
import 'package:LegandsPrsonal_App/screens/chats/searchchats/searchchat.dart';
import 'package:LegandsPrsonal_App/screens/subpage/subscriptionpage.dart';
import 'package:LegandsPrsonal_App/screens/userpg/userspg.dart';
import 'package:LegandsPrsonal_App/screens/feedpage/feedpage.dart';
import 'package:LegandsPrsonal_App/screens/settingsfolder/settingpage.dart';
import 'package:LegandsPrsonal_App/screens/chats/addchat.dart';

// Everything begins with main() function

class Chthistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text('Chat History'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.remove_red_eye),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
          })
        ],
      ),
      drawer: Drawer(),
      body: SafeArea(
        child: Container(
            color: Colors.blue,
            margin: EdgeInsets.only(right: 340),
            child: Row(
              children: <Widget>[
                SideNavBar(),
                SingleChildScrollView(
                child: Column(
                    children: <Widget>[],
                ),  
                ),
              ],
            )),
      ),
    );
  }
}


class DataSearch extends SearchDelegate<String> {
  final chatgenres = [
    "spc chat",
    "Trump @ it again",
    "We livin it up in the NYC",
    "Vibein with the crew",
    "Ender armor the new meta",
    "MIT headmaster under invistigation",
    "Hidden Genius Progects Makes OGs out of Black brothers",
    "New up and Coming Business Leg Land",
    "Co owner Legand Haskins of 'Leg Land' clash with Co owner Aasain Brown",
    "New YouTuber DaddyDawit Famous for that 'Knowledge' ",
    "Henti Drip is the new wave in America",

  ];

  final recentchatgenres = [
    "Trump @ it again",
    "Vibein with the crew",
    "MIT headmaster under invistigation",
    "Co owner Legand Haskins of 'Leg Land' clash with Co owner Aasain Brown",
    "Henti Drip is the new wave in America",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    //actions for AppBar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading Icon on the left of Appbar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some results based on the selection
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList = query.isEmpty
        ? recentchatgenres
        : chatgenres.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.collections_bookmark),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style: TextStyle(
                  color: Colors.red[300], fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.black),
                ),
              ]),
        ),
      ),
    );
  }
}


