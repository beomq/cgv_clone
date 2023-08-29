import 'package:cgv_clone/data/model/movie.dart';
import 'package:cgv_clone/data/review_data.dart';
import 'package:cgv_clone/ui/movie/review_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key,
    required this.thisMovie,
  }) : super(key: key);

  final Movie thisMovie;

  @override
  Widget build(BuildContext context) {
    Size appSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          thisMovie.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Image.asset(
                thisMovie.imageUrl,
                width: appSize.width,
                height: 300,
                fit: BoxFit.cover,
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.grey.withOpacity(0.4),
                      Colors.black,
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 10,
                bottom: 14,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      thisMovie.imageUrl,
                      width: appSize.width * 0.25,
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            thisMovie.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            thisMovie.subTitle,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            thisMovie.runTime,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReviewScreen(item: thisMovie),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.black87),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Text(
                '실관람평 등록하기',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
              stream: getReviews(thisMovie.title),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return const Text('loadings');
                return Column(
                  children: snapshot.data!.docs
                      .map<Widget>((DocumentSnapshot document) {
                    return ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.person,
                          color: Colors.black87,
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            document['evaluation'],
                            style: const TextStyle(color: Colors.brown),
                          ),
                          Row(
                            children: [
                              Text(
                                document['name'],
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const Spacer(),
                              Text(
                                (document['registration_date'])
                                    .toDate()
                                    .toString()
                                    .split('.')
                                    .first,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          )
                        ],
                      ),
                      subtitle: Text(document['comment']),
                    );
                  }).toList(),
                );
              })
        ],
      ),
    );
  }
}
