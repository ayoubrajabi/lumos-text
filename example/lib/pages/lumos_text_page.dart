import 'package:flutter/material.dart';
import 'package:lumos_text/lumos_text.dart';

import '../constants/constants.dart';
import '../widget/tags_widget.dart';
import '../widget/text_filed_widget.dart';

class LumosTextPage extends StatefulWidget {
  const LumosTextPage({super.key});

  @override
  State<LumosTextPage> createState() => _LumosTextPageState();
}

class _LumosTextPageState extends State<LumosTextPage> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    textEditingController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('High light text sample'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              textEditingController: textEditingController,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LumosText(
                    text: 'Hello',
                    highLightType: HighLightType.letter,
                    highlightText: textEditingController.value.text,
                    highLightTextStyle: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.blue,
                    ),
                    textStyle: kTextStyle.copyWith(),
                  ),
                  TagsWidget(
                    highlightText: textEditingController.value.text,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: LumosText(
                text: kLoremIpsum,
                highLightType: HighLightType.word,
                highLightTextStyle: kHighLightTextStyle,
                highlightText: textEditingController.value.text,
                textStyle: kTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
