import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final int difficultyLevel;
  const Difficulty({
    Key? key,
    required this.difficultyLevel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 15,
          color: difficultyLevel >= 1 ? Colors.purple : Colors.purple[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: difficultyLevel >= 2 ? Colors.purple : Colors.purple[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: difficultyLevel >= 3 ? Colors.purple : Colors.purple[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: difficultyLevel >= 4 ? Colors.purple : Colors.purple[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: difficultyLevel >= 5 ? Colors.purple : Colors.purple[100],
        ),
      ],
    );
  }
}
