import 'package:drift/drift.dart';

//
//テーブルを定義
//大嶽
//ユーザー
class Users extends Table {
  IntColumn get usersNum => integer().autoIncrement()(); // 自動インクリメント主キー
  IntColumn get studentId => integer().nullable()(); // 学生ID
  TextColumn get password => text().nullable()(); // パスワード
  IntColumn get year => integer().nullable()(); // 学年
  IntColumn get period => integer().nullable()(); // 学期
}

//科目
class Subjects extends Table {
  IntColumn get subjectsNum => integer().autoIncrement()(); // 自動インクリメント主キー
  IntColumn get subjectId => integer().nullable()(); // 時間割番号
  TextColumn get subjectName => text().nullable()(); // 科目名
  IntColumn get dayOfweek => integer().nullable()(); // 曜日
  IntColumn get period => integer().nullable()(); // 時限
}

//カテゴリ
class Categories extends Table {
  IntColumn get categoriesNum => integer().autoIncrement()(); // 自動インクリメント主キー
  TextColumn get categoryName => text().nullable()(); // カテゴリ名
  IntColumn get subjectId => integer().nullable()(); // 時間割番号
}

//コンテナ
class Containers extends Table {
  IntColumn get containersNum => integer().autoIncrement()(); // 自動インクリメント主キー
  TextColumn get containerId => text().nullable()(); // コンテナID
  IntColumn get subjectId => integer().nullable()(); // 時間割番号
  TextColumn get title => text().nullable()(); // タイトル
  DateTimeColumn get available => dateTime().nullable()(); // 利用可能期間
  TextColumn get categoryName => text().nullable()(); // カテゴリ名
}

// //コンテンツ
class Contents extends Table {
  IntColumn get contentsNum => integer().autoIncrement()(); // 自動インクリメント主キー
  TextColumn get contentId => text().nullable()(); // コンテンツID
  TextColumn get containerId => text().nullable()(); // コンテナID
  TextColumn get file => text().nullable()(); // ファイルの種別
  TextColumn get content => text().nullable()(); // コンテンツファイル
}
