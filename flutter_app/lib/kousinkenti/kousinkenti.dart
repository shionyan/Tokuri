import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'database.dart'; // Driftのデータベース定義ファイル

class updateChecker extends ChangeNotifier {
  bool _hasUpdates = false;

  bool get hasUpdates => _hasUpdates;

  Future<void> checkForUpdate() async{
    final dbHelper = DatabaseHelper.instance;

    // ローカルデータを取得
    final oldData = await dbHelper.fetchData();

    // 新しいデータをスクレイピング
    final newData = await Scraper.fetchNewData();

    // 差異をチェック
    if (oldData != newData) {
      _hasUpdates = true;
      notifyListeners();

      // データストアを更新
      await dbHelper.saveData(newData);
    } else {
      _hasUpdates = false;
      notifyListeners();
    }
  }
}