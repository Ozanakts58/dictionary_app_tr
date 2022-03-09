import 'package:dictionary_app_tr/viewmodels/meaning_view_model.dart';
import 'package:dictionary_app_tr/widgets/sing_language.dart';
import 'package:flutter/material.dart';

class MeanList extends StatelessWidget {
  final MeaningViewModel meaningViewModel;
  final SignLanguage signLanguage;
  const MeanList(
      {Key? key, required this.meaningViewModel, required this.signLanguage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          meaningViewModel.word,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        ListView.builder(
            padding: const EdgeInsets.all(8),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: meaningViewModel.meaning.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  child: Text(
                    '${index + 1}. ${meaningViewModel.meaning[index]}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              );
            }),
        signLanguage
      ],
    );
  }
}