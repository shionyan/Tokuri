import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

/*
newData(例：スクレイピングしたデータ)とoldData(例：データストアに格納されたデータ)を引数として更新があればhasupdatesがtrue,なければfalseとなる関数
CheckForUpdate関数使用後，hasupdatesの値を参照することで更新が行われたかわかる。
*/
class UpdateChecker extends ChangeNotifier {
  bool _hasUpdates = false;

  bool get hasUpdates => _hasUpdates;

  Future<void> CheckForUpdate(newData, oldData) async{

    // 差異をチェック
    if (oldData != newData) {
      _hasUpdates = true;

    } else {
      _hasUpdates = false;
    }
  }
}