import 'package:flutter/material.dart';
import 'package:lumos_text/lumos_text.dart';
import '../constants/constants.dart';

class TagsWidget extends StatelessWidget {
  const TagsWidget({
    super.key,
    required this.highlightText,
  });
  final String highlightText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 30.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kTags.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LumosText(
                text: kTags[index],
                highLightType: HighLightType.letter,
                highlightText: highlightText,
                highLightTextStyle:
                    kHighLightTextStyle.copyWith(fontSize: 14.0),
                textStyle: kTextStyle.copyWith(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              if (index != kTags.length - 1)
                const Text(
                  ', ',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
