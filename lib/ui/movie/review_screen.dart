import 'package:cgv_clone/data/model/movie.dart';
import 'package:cgv_clone/data/review_data.dart';
import 'package:flutter/material.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Movie item;

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  List<String> choices = ['GOOD!', 'BAD'];
  int choiceIndex = 0;
  final TextEditingController reviewIdController = TextEditingController();
  final TextEditingController reviewTextController = TextEditingController();

  @override
  void dispose() {
    reviewIdController.dispose();
    reviewTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Movie thisMovie = widget.item;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '관람평 등록',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                color: Colors.black12,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '이 영화 어땠나요?',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List<Widget>.generate(choices.length, (index) {
                        return ChoiceChip(
                          padding: const EdgeInsets.all(10),
                          label: Text(
                            choices[index],
                            style: TextStyle(
                                color: (choiceIndex == index)
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 20),
                          ),
                          selected: choiceIndex == index,
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 50),
                          onSelected: (value) {
                            setState(
                              () {
                                choiceIndex = index;
                              },
                            );
                          },
                          backgroundColor: Colors.white,
                          selectedColor: Colors.red,
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text('나의 감상평'),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: reviewIdController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: '작성자'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: reviewTextController,
                      minLines: 1,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: '내용'),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        onPressed: () {
                          if (reviewTextController.text.isEmpty ||
                              reviewIdController.text.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                content: const Text('리뷰를 입력하세요'),
                                actions: [
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('OK'))
                                ],
                              ),
                            );
                          } else {
                            addReview(
                                thisMovie.title,
                                reviewIdController.text,
                                reviewTextController.text,
                                choices[choiceIndex]);
                            Navigator.pop(context);
                          }
                        },
                        child: const Text(
                          '제출',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
