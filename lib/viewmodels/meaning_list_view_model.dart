import 'package:flutter/material.dart';
import 'package:dictionary_app_tr/services/dictionary_service.dart';
import 'meaning_view_model.dart';

enum Status{inital, loading, notfound, succes}

class MeaningListViewModel extends ChangeNotifier{
  MeaningViewModel meaningViewModel = MeaningViewModel('', []);
  Status status = Status.inital;
  Future<void> getMeaning(String word) async {
    status = Status.loading;
    notifyListeners();
    List<String> meanings = await DictionaryServices().searchWord(word);
    meaningViewModel = MeaningViewModel(word, meanings);
    status = meanings.isNotEmpty ? Status.succes : Status.notfound;
    notifyListeners();// bu class izleyen veri varsa bilgilendir
  }
}

