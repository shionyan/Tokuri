import 'package:drift/drift.dart';

//
//テーブルを定義
//大嶽
//ユーザー
class Users extends Table {
  IntColumn get usersNum => integer().autoIncrement()(); // 自動インクリメント主キー
  IntColumn get studentId => integer()(); // 学生ID
  TextColumn get password => text()(); // パスワード
  IntColumn get year => integer()(); // 学年
  IntColumn get period => integer()(); // 学期
}

//科目
class Subjects extends Table {
  IntColumn get subjectsNum => integer().autoIncrement()(); // 自動インクリメント主キー
  IntColumn get subjectId => integer()(); // 時間割番号
  TextColumn get subjectName => text()(); // 科目名
  IntColumn get dayOfweek => integer()(); // 曜日
  IntColumn get period => integer()(); // 時限
}

//カテゴリ
class Categories extends Table {
  IntColumn get categoriesNum => integer().autoIncrement()(); // 自動インクリメント主キー
  TextColumn get categoryName => text()(); // カテゴリ名
}

//コンテナ
class Containers extends Table {
  IntColumn get containersNum => integer().autoIncrement()(); // 自動インクリメント主キー
  TextColumn get containerId => text()(); // コンテナID
  IntColumn get subjectId => integer()(); // 時間割番号
  TextColumn get title => text()(); // タイトル
  DateTimeColumn get available => dateTime()(); // 利用可能期間
}

// //コンテナ
class Contents extends Table {
  IntColumn get contentsNum => integer().autoIncrement()(); // 自動インクリメント主キー
  TextColumn get contentId => text()(); // コンテンツID
  TextColumn get containerId => text()(); // コンテナID
  TextColumn get file => text()(); // ファイルの種別
  TextColumn get content => text()(); // コンテンツファイル
}
