import 'package:bullseye/text_styles.dart';
import 'package:flutter/material.dart';

class ScoreList extends StatelessWidget {
  const ScoreList({
    super.key,
    required this.roundedScores,
    required this.onlyTopScoresVisible,
  });

  final List<int> roundedScores;
  final bool onlyTopScoresVisible;

  String getOrdinal(int number) {
    if (number == 1) {
      return '🥇';
    } else if (number == 2) {
      return '🥈';
    } else if (number == 3) {
      return '🥉';
    } else {
      return '$number' '.';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (onlyTopScoresVisible) {
      // Sort the roundedScores list in descending order
      roundedScores.sort((a, b) => b.compareTo(a));
    }

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(
            'images/background.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text('About Bullseye'),
            backgroundColor: Colors.transparent,
          ),
          body: Center(
              child: Column(
            children: [
              Text(
                "Top Scores:",
                style: LabelTextStyle.bodyText1(context),
              ),
              scoreList(),
            ],
          ))),
    );
  }

  Expanded scoreList() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: onlyTopScoresVisible
            ? (roundedScores.length > 3 ? 3 : roundedScores.length)
            : roundedScores.length,
        itemBuilder: (BuildContext context, int index) {
          final ordinalNumber = getOrdinal(index + 1);
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == 0
                      ? Colors.yellow
                      : index == 1
                          ? Colors.grey
                          : index == 2
                              ? Colors.brown
                              : Colors.redAccent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    ordinalNumber,
                    style: TextStyle(
                      fontSize: (index == 0)
                          ? 30
                          : (index == 1)
                              ? 20
                              : (index == 2)
                                  ? 10
                                  : 9,
                    ),
                  ),
                ),
              ),
              Text(' ${roundedScores[index]}'),
            ],
          );
        },
      ),
    );
  }
}
