import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
// import 'package:sqlite3/sqlite3.dart';
// import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:drift/drift.dart';
import 'package:tuple/tuple.dart';

// import 'table.dart';
import 'package:flutter_app/database/table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Users, Subjects, Categories, Containers, Contents])
class AppDatabase extends _$AppDatabase {
  //シングルトンインスタンスを維持する静的な変数
  static AppDatabase? _instance;

  //privateなコンストラクタ
  AppDatabase._() : super(_openConnection());

  // factoryコンストラクタでインスタンスを取得
  factory AppDatabase() {
    // まだインスタンスが作成されていない場合のみ新たに作成
    _instance ??= AppDatabase._();
    return _instance!;
  }

  //スキーマバージョン
  @override
  int get schemaVersion => 1;

  // 全テーブルのデータを削除
  Future<void> clearAllTables() async {
    await batch((batch) {
      batch.deleteWhere(users, (row) => Constant(true)); // Usersテーブルの全データ削除
      batch.deleteWhere(subjects, (row) => Constant(true)); // Usersテーブルの全データ削除
      batch.deleteWhere(
          categories, (row) => Constant(true)); // Usersテーブルの全データ削除
      batch.deleteWhere(
          containers, (row) => Constant(true)); // Usersテーブルの全データ削除
      batch.deleteWhere(contents, (row) => Constant(true)); // Usersテーブルの全データ削除
      debugPrint('消した');
      // 他のテーブルがあれば同様に追加
    });
  }

  //テーブルの初期化
  Future<void> resetDatabase() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_database.sqlite'));
    if (await file.exists()) {
      await file.delete(); // データベースファイルを削除
      print('Database has been reset.');
    } else {
      print('Database file does not exist.');
    }
  }

  //
  // データベース操作の関数
  //ユーザ編

  // データ挿入
  Future<int> insertUser(UsersCompanion user) async {
    return await into(users).insert(user);
  }

  // 全ユーザー取得
  Future<List<User>> getAllUsers() async {
    return await select(users).get();
  }

  // ID指定でユーザーを取得
  Future<User?> getUserById(int id) async {
    return await (select(users)..where((tbl) => tbl.usersNum.equals(id)))
        .getSingleOrNull();
  }

  // ユーザー削除
  Future<int> deleteUserById(int id) async {
    return await (delete(users)..where((tbl) => tbl.usersNum.equals(id))).go();
  }

  //
  // カラム操作関数（getter/setter）
  //

  // studentId
  Future<int?> getStudentId(int id) async {
    final user = await (select(users)..where((tbl) => tbl.usersNum.equals(id)))
        .getSingleOrNull();
    return user?.studentId;
  }

  Future<int> setStudentId(int id, int newStudentId) async {
    return await (update(users)..where((tbl) => tbl.usersNum.equals(id)))
        .write(UsersCompanion(studentId: Value(newStudentId)));
  }

  // password
  Future<String?> getPassword(int id) async {
    final user = await (select(users)..where((tbl) => tbl.usersNum.equals(id)))
        .getSingleOrNull();
    return user?.password;
  }

  Future<int> setPassword(int id, String newPassword) async {
    return await (update(users)..where((tbl) => tbl.usersNum.equals(id)))
        .write(UsersCompanion(password: Value(newPassword)));
  }

  // year
  Future<int?> getYear(int id) async {
    final user = await (select(users)..where((tbl) => tbl.usersNum.equals(id)))
        .getSingleOrNull();
    return user?.year;
  }

  Future<int> setYear(int id, int newYear) async {
    return await (update(users)..where((tbl) => tbl.usersNum.equals(id)))
        .write(UsersCompanion(year: Value(newYear)));
  }

  // period
  Future<int?> getPeriod(int id) async {
    final user = await (select(users)..where((tbl) => tbl.usersNum.equals(id)))
        .getSingleOrNull();
    return user?.period;
  }

  Future<int> setPeriod(int id, int newPeriod) async {
    return await (update(users)..where((tbl) => tbl.usersNum.equals(id)))
        .write(UsersCompanion(period: Value(newPeriod)));
  }

  //
  // データベース操作の関数
  //科目編
  // データ挿入
  Future<int> insertSubject(SubjectsCompanion subject) async {
    return await into(subjects).insert(subject);
  }

// 全科目取得
  Future<List<Subject>> getAllSubjects() async {
    return await select(subjects).get();
  }

// ID指定で科目を取得
  Future<Subject?> getSubjectById(int id) async {
    return await (select(subjects)..where((tbl) => tbl.subjectsNum.equals(id)))
        .getSingleOrNull();
  }

// 科目削除
  Future<int> deleteSubjectById(int id) async {
    return await (delete(subjects)..where((tbl) => tbl.subjectsNum.equals(id)))
        .go();
  }

// subjectIdの取得
  Future<int?> getSubjectId(int subjectId) async {
    final subject = await (select(subjects)
          ..where((tbl) => tbl.subjectsNum.equals(subjectId)))
        .getSingleOrNull();
    return subject?.subjectId;
  }

// subjectIdの更新
  Future<int> setSubjectId(int subjectId, int newSubjectId) async {
    return await (update(subjects)
          ..where((tbl) => tbl.subjectsNum.equals(subjectId)))
        .write(SubjectsCompanion(subjectId: Value(newSubjectId)));
  }

// subjectNameの取得
  Future<String?> getSubjectName(int subjectId) async {
    final subject = await (select(subjects)
          ..where((tbl) => tbl.subjectsNum.equals(subjectId)))
        .getSingleOrNull();
    return subject?.subjectName;
  }

// subjectNameの更新
  Future<int> setSubjectName(int subjectId, String newSubjectName) async {
    return await (update(subjects)
          ..where((tbl) => tbl.subjectsNum.equals(subjectId)))
        .write(SubjectsCompanion(subjectName: Value(newSubjectName)));
  }

// dayOfweekの取得
  Future<int?> getDayOfweek(int subjectId) async {
    final subject = await (select(subjects)
          ..where((tbl) => tbl.subjectsNum.equals(subjectId)))
        .getSingleOrNull();
    return subject?.dayOfweek;
  }

// dayOfweekの更新
  Future<int> setDayOfweek(int subjectId, int newDayOfweek) async {
    return await (update(subjects)
          ..where((tbl) => tbl.subjectsNum.equals(subjectId)))
        .write(SubjectsCompanion(dayOfweek: Value(newDayOfweek)));
  }

// periodの取得
  Future<int?> getPeriodForSubject(int subjectId) async {
    final subject = await (select(subjects)
          ..where((tbl) => tbl.subjectsNum.equals(subjectId)))
        .getSingleOrNull();
    return subject?.period;
  }

// periodの更新
  Future<int> setPeriodForSubject(int subjectId, int newPeriod) async {
    return await (update(subjects)
          ..where((tbl) => tbl.subjectsNum.equals(subjectId)))
        .write(SubjectsCompanion(period: Value(newPeriod)));
  }

  //
  // データベース操作の関数
  //カテゴリ編
  // データ挿入
  Future<int> insertCategory(CategoriesCompanion category) async {
    return await into(categories).insert(category);
  }

// 全カテゴリ取得
  Future<List<Category>> getAllCategories() async {
    return await select(categories).get();
  }

// ID指定でカテゴリを取得
  Future<Category?> getCategoryById(int id) async {
    return await (select(categories)
          ..where((tbl) => tbl.categoriesNum.equals(id)))
        .getSingleOrNull();
  }

// カテゴリ削除
  Future<int> deleteCategoryById(int id) async {
    return await (delete(categories)
          ..where((tbl) => tbl.categoriesNum.equals(id)))
        .go();
  }

// categoryNameの取得
  Future<String?> getCategoryName(int categoryId) async {
    final category = await (select(categories)
          ..where((tbl) => tbl.categoriesNum.equals(categoryId)))
        .getSingleOrNull();
    return category?.categoryName;
  }

// categoryNameの更新
  Future<int> setCategoryName(int categoryId, String newCategoryName) async {
    return await (update(categories)
          ..where((tbl) => tbl.categoriesNum.equals(categoryId)))
        .write(CategoriesCompanion(categoryName: Value(newCategoryName)));
  }

  //
  // データベース操作の関数
  //コンテナ編
  // データ挿入
  Future<int> insertContainer(ContainersCompanion container) async {
    return await into(containers).insert(container);
  }

// 全コンテナ取得
  Future<List<Container>> getAllContainers() async {
    return await select(containers).get();
  }

// ID指定でコンテナを取得
  Future<Container?> getContainerById(int id) async {
    return await (select(containers)
          ..where((tbl) => tbl.containersNum.equals(id)))
        .getSingleOrNull();
  }

// コンテナ削除
  Future<int> deleteContainerById(int id) async {
    return await (delete(containers)
          ..where((tbl) => tbl.containersNum.equals(id)))
        .go();
  }

// containerIdの取得
  Future<String?> getContainerId(int containerId) async {
    final container = await (select(containers)
          ..where((tbl) => tbl.containersNum.equals(containerId)))
        .getSingleOrNull();
    return container?.containerId;
  }

// containerIdの更新
  Future<int> setContainerId(int containerId, String newContainerId) async {
    return await (update(containers)
          ..where((tbl) => tbl.containersNum.equals(containerId)))
        .write(ContainersCompanion(containerId: Value(newContainerId)));
  }

// titleの取得
  Future<String?> getTitle(int containerId) async {
    final container = await (select(containers)
          ..where((tbl) => tbl.containersNum.equals(containerId)))
        .getSingleOrNull();
    return container?.title;
  }

// titleの更新
  Future<int> setTitle(int containerId, String newTitle) async {
    return await (update(containers)
          ..where((tbl) => tbl.containersNum.equals(containerId)))
        .write(ContainersCompanion(title: Value(newTitle)));
  }

// availableの取得
  Future<DateTime?> getAvailable(int containerId) async {
    final container = await (select(containers)
          ..where((tbl) => tbl.containersNum.equals(containerId)))
        .getSingleOrNull();
    return container?.available;
  }

// availableの更新
  Future<int> setAvailable(int containerId, DateTime newAvailable) async {
    return await (update(containers)
          ..where((tbl) => tbl.containersNum.equals(containerId)))
        .write(ContainersCompanion(available: Value(newAvailable)));
  }

  //
  // データベース操作の関数
  // コンテンツ編

// // データ挿入
  Future<int> insertContent(ContentsCompanion content) async {
    return await into(contents).insert(content);
  }

// 全コンテンツ取得
  Future<List<Content>> getAllContent() async {
    return await select(contents).get();
  }

// ID指定でコンテンツを取得
  Future<Content?> getContentById(int id) async {
    return await (select(contents)..where((tbl) => tbl.contentsNum.equals(id)))
        .getSingleOrNull();
  }

// コンテンツ削除
  Future<int> deleteContentById(int id) async {
    return await (delete(contents)..where((tbl) => tbl.contentsNum.equals(id)))
        .go();
  }

// contentIdの取得
  Future<String?> getContentId(int contentId) async {
    final contentRecord = await (select(contents)
          ..where((tbl) => tbl.contentsNum.equals(contentId)))
        .getSingleOrNull();
    return contentRecord?.contentId;
  }

// contentIdの更新
  Future<int> setContentId(int contentId, String newContentId) async {
    return await (update(contents)
          ..where((tbl) => tbl.contentsNum.equals(contentId)))
        .write(ContentsCompanion(contentId: Value(newContentId)));
  }

// 結合
  Future<List<Tuple4<Subject, Category, Container, Content>>>
      fetchAllData() async {
    final query = select(subjects).join(
      [
        // Categories を Subjects に結合
        innerJoin(
          categories,
          categories.subjectId.equalsExp(subjects.subjectId),
        ),
        // Containers を Categories に結合
        innerJoin(
          containers,
          containers.categoryName.equalsExp(categories.categoryName),
        ),
        // Contents を Containers に結合
        innerJoin(
          contents,
          contents.containerId.equalsExp(containers.containerId),
        ),
      ],
    );

    // クエリ結果をマッピングして返す
    final result = await query.map((row) {
      return Tuple4(
        row.readTable(subjects), // Subjects テーブルのデータ
        row.readTable(categories), // Categories テーブルのデータ
        row.readTable(containers), // Containers テーブルのデータ
        row.readTable(contents), // Contents テーブルのデータ
      );
    }).get();

    return result;
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_database.sqlite'));
    return NativeDatabase(file);
  });
}
