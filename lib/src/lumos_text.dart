import 'package:flutter/material.dart';

class LumosText extends StatelessWidget {
  const LumosText({
    super.key,
    required this.text,
    required this.highlightText,
    this.highLightType = HighLightType.letter,
    this.textStyle = const TextStyle(color: Colors.black),
    this.highLightTextStyle = const TextStyle(color: Colors.blue),
    this.maxLines = 1000,
  });

  final int? maxLines;

  ///Pure text you want to show
  final String text;

  ///it's a particular peace of text that you want to be highlighted
  final String highlightText;

  final TextStyle textStyle;
  final TextStyle highLightTextStyle;

  ///Filter highlight text by word or letter
  ///filtered by word means that if [text] == [highlightText] the whole word will be highlight
  ///either filter by letter means that letters can be highlight
  final HighLightType highLightType;

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      text: highLightType == HighLightType.letter
          ? highlightTextLetter()
          : highLightTextWord(),
    );
  }

  TextSpan highlightTextLetter() {
    final searchSplit = highlightText.toLowerCase().split('');

    return TextSpan(
      children: List<InlineSpan>.generate(
        text.length,
        (index) {
          final bool shouldHighlight = searchSplit
              .any((letter) => text[index].toLowerCase().contains(letter));

          return TextSpan(
            text: text[index],
            style: shouldHighlight ? highLightTextStyle : textStyle,
          );
        },
      ),
    );
  }

  TextSpan highLightTextWord() {
    final words = text.split(' ');
    final highlightTextWords = highlightText.split(' ');

    return TextSpan(
      style: textStyle,
      children: words.map<InlineSpan>((word) {
        final sanitizedWord =
            word.toLowerCase().replaceAll(RegExp(r'[^\w\s]+'), '');
        final shouldHighlight = highlightTextWords.contains(sanitizedWord);

        return TextSpan(
          text: '$word ',
          style: shouldHighlight ? highLightTextStyle : textStyle,
        );
      }).toList(),
    );
  }
}

enum HighLightType { letter, word }

class HighlightedText extends StatelessWidget {
  final String text;
  final String highlightText;
  final TextStyle highlightStyle;

  const HighlightedText({
    super.key,
    required this.text,
    required this.highlightText,
    required this.highlightStyle,
  });

  @override
  Widget build(BuildContext context) {
    final startIndex = text.toLowerCase().indexOf(highlightText.toLowerCase());
    final endIndex = startIndex + highlightText.length;

    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16.0,
        ),
        children: [
          TextSpan(text: text.substring(0, startIndex)),
          TextSpan(
            text: text.substring(startIndex, endIndex),
            style: highlightStyle,
          ),
          TextSpan(text: text.substring(endIndex)),
        ],
      ),
    );
  }
}
