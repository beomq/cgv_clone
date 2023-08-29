import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

CollectionReference reviewCollection = firestore.collection('review');

void addReview(
    String movieTitle, String name, String comment, String evaluation) {
  reviewCollection.add({
    'movie_title': movieTitle,
    'name': name,
    'comment': comment,
    'evaluation': evaluation,
    'registration_date': DateTime.now(),
  }).then((value) => print('review'));
}

Stream<QuerySnapshot> getReviews(String movieTitle) {
  return reviewCollection
      .where('movie_title', isEqualTo: movieTitle)
      .snapshots();
}
