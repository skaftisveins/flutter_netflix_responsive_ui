import 'package:flutter/material.dart';

import '../models/models.dart';

class ContentList extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  final bool isOriginals;

  const ContentList({
    Key key,
    @required this.title,
    @required this.contentList,
    this.isOriginals = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: isOriginals ? 500 : 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: contentList.length,
              itemBuilder: (content, index) {
                final Content content = contentList[index];
                return GestureDetector(
                  onTap: () => print(content.name),
                  child: Container(
                    margin: EdgeInsets.only(left: 8, right: 8, top: 6),
                    height: isOriginals ? 400 : 200,
                    width: isOriginals ? 200 : 130,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(content.imageUrl),
                          fit: BoxFit.cover),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
