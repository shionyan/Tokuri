import 'package:flutter/material.dart';
import 'package:flutter_app/pages/startpage.dart';
import 'package:flutter_app/database/database.dart';
import 'package:drift/drift.dart' as drift;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppDatabase db; // データベースのインスタンス

  @override
  void initState() {
    super.initState();
    _initDatabase(); // データベース初期化
  }

  // データベースの初期化
  Future<void> _initDatabase() async {
    print('データベース初期化開始');
    db = AppDatabase();
    await _insertSampleData(); // サンプルデータの挿入
  }

  // サンプルデータの挿入
  Future<void> _insertSampleData() async {
    final subjectId = await db.insertSubject(SubjectsCompanion(
      subjectId: drift.Value(642809), // 学生ID
      subjectName: drift.Value("言語・オートマトン"), // パスワード
      dayOfweek: drift.Value(2), // 学年
      period: drift.Value(4), // 学期
    ));
    print("Inserted user with auto-generated ID: $subjectId");
    final categorytId = await db.insertCategory(CategoriesCompanion(
      categoryName: drift.Value("講義スライド"), // 学生ID
      subjectId: drift.Value(642809), // パスワード
    ));
    final categorytId1 = await db.insertCategory(CategoriesCompanion(
      categoryName: drift.Value("課題提出先"), // 学生ID
      subjectId: drift.Value(642809), // パスワード
    ));
    final categorytId2 = await db.insertCategory(CategoriesCompanion(
      categoryName: drift.Value("課題問題"), // 学生ID
      subjectId: drift.Value(642809), // パスワード
    ));
    final categorytId3 = await db.insertCategory(CategoriesCompanion(
      categoryName: drift.Value("課題解答例"), // 学生ID
      subjectId: drift.Value(642809), // パスワード
    ));
    print("Inserted user with auto-generated ID: $categorytId");
    final containerId = await db.insertContainer(ContainersCompanion(
      containerId: drift.Value("3b2c478b04778de9eff75a97acfa695c"), // 学生ID
      subjectId: drift.Value(642809), // パスワード
      title: drift.Value("第一章"), // 学年
      available: drift.Value(DateTime(2024, 1, 1, 0, 0)), // 学期
      categoryName: drift.Value("講義スライド"), // 学生ID
    ));
    print("Inserted user with auto-generated ID: $containerId");
    final containerId1 = await db.insertContainer(ContainersCompanion(
      containerId: drift.Value("8bf83839953d5b3387cd75c6801084cf"), // 学生ID
      subjectId: drift.Value(642809), // パスワード
      title: drift.Value("第二章"), // 学年
      available: drift.Value(DateTime(2024, 1, 1, 0, 0)), // 学期
      categoryName: drift.Value("講義スライド"), // 学生ID
    ));
    print("Inserted user with auto-generated ID: $containerId1");
    final containerId2 = await db.insertContainer(ContainersCompanion(
      containerId: drift.Value("7dc3b2036b23490ba2afddd6a9d598fe"), // 学生ID
      subjectId: drift.Value(642809), // パスワード
      title: drift.Value("第三章"), // 学年
      available: drift.Value(DateTime(2024, 1, 1, 0, 0)), // 学期
      categoryName: drift.Value("講義スライド"), // 学生ID
    ));
    print("Inserted user with auto-generated ID: $containerId2");
    final containerId3 = await db.insertContainer(ContainersCompanion(
      containerId: drift.Value("80cb9ec712a73e4e2aca843badfea007"), // 学生ID
      subjectId: drift.Value(642809), // パスワード
      title: drift.Value("第四章"), // 学年
      available: drift.Value(DateTime(2024, 1, 1, 0, 0)), // 学期
      categoryName: drift.Value("講義スライド"), // 学生ID
    ));
    print("Inserted user with auto-generated ID: $containerId3");
    final containerId4 = await db.insertContainer(ContainersCompanion(
      containerId: drift.Value("cb9981e55f600d7bddd4a328be12bc00"), // 学生ID
      subjectId: drift.Value(642809), // パスワード
      title: drift.Value("第五章"), // 学年
      available: drift.Value(DateTime(2024, 1, 1, 0, 0)), // 学期
      categoryName: drift.Value("講義スライド"), // 学生ID
    ));
    print("Inserted user with auto-generated ID: $containerId4");
    final containerId5 = await db.insertContainer(ContainersCompanion(
      containerId: drift.Value("0307ec41f28a7110f0ca05fc68b3a844"), // 学生ID
      subjectId: drift.Value(642809), // パスワード
      title: drift.Value("第六章"), // 学年
      available: drift.Value(DateTime(2024, 1, 1, 0, 0)), // 学期
      categoryName: drift.Value("講義スライド"), // 学生ID
    ));
    print("Inserted user with auto-generated ID: $containerId5");
    final containerId6 = await db.insertContainer(ContainersCompanion(
      containerId: drift.Value("c45ad724d63156194e1f1973aaa22b56"), // 学生ID
      subjectId: drift.Value(642809), // パスワード
      title: drift.Value("第七章"), // 学年
      available: drift.Value(DateTime(2024, 1, 1, 0, 0)), // 学期
      categoryName: drift.Value("講義スライド"), // 学生ID
    ));
    print("Inserted user with auto-generated ID: $containerId6");
    final contentId = await db.insertContent(ContentsCompanion(
      contentId: drift.Value("df3495f0f7274833fcbb6c8dbd1820f8"), // 学生ID
      containerId: drift.Value("3b2c478b04778de9eff75a97acfa695c"), // パスワード
      file: drift.Value("pdf"), // 学年
      content: drift.Value(
          "https://rpwebcls.meijo-u.ac.jp/webclass/text/20/2024026428100/f1d88a1dea3efcda955a0cf0e646c263/955a0cf0e646c263.pdf"), // 学期
    ));
    print("Inserted user with auto-generated ID: $contentId");
    final contentId1 = await db.insertContent(ContentsCompanion(
      contentId: drift.Value("d213060b85c2be6a6ac81b33a861e6e8"), // 学生ID
      containerId: drift.Value("8bf83839953d5b3387cd75c6801084cf"), // パスワード
      file: drift.Value("pdf"), // 学年
      content: drift.Value(
          "https://rpwebcls.meijo-u.ac.jp/webclass/text/20/2024026428100/f1d88a1dea3efcda955a0cf0e646c263/955a0cf0e646c263.pdf"), // 学期
    ));
    print("Inserted user with auto-generated ID: $contentId1");
    final contentId2 = await db.insertContent(ContentsCompanion(
      contentId: drift.Value("b064c35f5ad2b39744272f14b6a8e98b"), // 学生ID
      containerId: drift.Value("7dc3b2036b23490ba2afddd6a9d598fe"), // パスワード
      file: drift.Value("pdf"), // 学年
      content: drift.Value(
          "https://rpwebcls.meijo-u.ac.jp/webclass/text/20/2024026428100/f1d88a1dea3efcda955a0cf0e646c263/955a0cf0e646c263.pdf"), // 学期
    ));
    print("Inserted user with auto-generated ID: $contentId2");
    final contentId3 = await db.insertContent(ContentsCompanion(
      contentId: drift.Value("e92cfd19656120d9e8f579bd6502e0ae"), // 学生ID
      containerId: drift.Value("80cb9ec712a73e4e2aca843badfea007"), // パスワード
      file: drift.Value("pdf"), // 学年
      content: drift.Value(
          "https://rpwebcls.meijo-u.ac.jp/webclass/text/20/2024026428100/f1d88a1dea3efcda955a0cf0e646c263/955a0cf0e646c263.pdf"), // 学期
    ));
    print("Inserted user with auto-generated ID: $contentId3");
    final contentId4 = await db.insertContent(ContentsCompanion(
      contentId: drift.Value("edc310ace78266227616f993d61d035e"), // 学生ID
      containerId: drift.Value("cb9981e55f600d7bddd4a328be12bc00"), // パスワード
      file: drift.Value("pdf"), // 学年
      content: drift.Value(
          "https://rpwebcls.meijo-u.ac.jp/webclass/text/20/2024026428100/f1d88a1dea3efcda955a0cf0e646c263/955a0cf0e646c263.pdf"), // 学期
    ));
    print("Inserted user with auto-generated ID: $contentId4");
    final contentId5 = await db.insertContent(ContentsCompanion(
      contentId: drift.Value("add626ed5ff20ded80eeaa2f1f59d929"), // 学生ID
      containerId: drift.Value("0307ec41f28a7110f0ca05fc68b3a844"), // パスワード
      file: drift.Value("pdf"), // 学年
      content: drift.Value(
          "https://rpwebcls.meijo-u.ac.jp/webclass/text/20/2024026428100/f1d88a1dea3efcda955a0cf0e646c263/955a0cf0e646c263.pdf"), // 学期
    ));
    print("Inserted user with auto-generated ID: $contentId5");
    final contentId6 = await db.insertContent(ContentsCompanion(
      contentId: drift.Value("2084bd6a7cf671143da447e8b50cc136"), // 学生ID
      containerId: drift.Value("c45ad724d63156194e1f1973aaa22b56"), // パスワード
      file: drift.Value("pdf"), // 学年
      content: drift.Value(
          "https://rpwebcls.meijo-u.ac.jp/webclass/text/20/2024026428100/f1d88a1dea3efcda955a0cf0e646c263/955a0cf0e646c263.pdf"), // 学期
    ));

    // print("Inserted user with auto-generated ID: $contentId6");
    // final containerId10 = await db.insertContainer(ContainersCompanion(
    //   containerId: drift.Value("47fb56cfd4afa071b79176d600317418"), // 学生ID
    //   subjectId: drift.Value(642809), // パスワード
    //   title: drift.Value("1-1"), // 学年
    //   available: drift.Value(DateTime(2024, 1, 1, 0, 0)), // 学期
    //   categoryName: drift.Value("課題問題"), // 学生ID
    // ));
    // print("Inserted user with auto-generated ID: $containerId10");
    // final containerId11 = await db.insertContainer(ContainersCompanion(
    //   containerId: drift.Value("8bf83839953d5b3387cd75c6801084cf"), // 学生ID
    //   subjectId: drift.Value(642809), // パスワード
    //   title: drift.Value("1-2"), // 学年
    //   available: drift.Value(DateTime(2024, 1, 1, 0, 0)), // 学期
    //   categoryName: drift.Value("課題問題"), // 学生ID
    // ));
    // print("Inserted user with auto-generated ID: $containerId11");
    // final containerId12 = await db.insertContainer(ContainersCompanion(
    //   containerId: drift.Value("152ba362716243724cb54b5430717dad"), // 学生ID
    //   subjectId: drift.Value(642809), // パスワード
    //   title: drift.Value("1-3"), // 学年
    //   available: drift.Value(DateTime(2024, 1, 1, 0, 0)), // 学期
    //   categoryName: drift.Value("課題問題"), // 学生ID
    // ));
    // print("Inserted user with auto-generated ID: $containerId12");
    // final contentId10 = await db.insertContent(ContentsCompanion(
    //   contentId: drift.Value(""), // 学生ID
    //   containerId: drift.Value("47fb56cfd4afa071b79176d600317418"), // パスワード
    //   file: drift.Value("pdf"), // 学年
    //   content: drift.Value(
    //       "https://rpwebcls.meijo-u.ac.jp/webclass/text/20/2024026428100/f1d88a1dea3efcda955a0cf0e646c263/955a0cf0e646c263.pdf"), // 学期
    // ));
    // print("Inserted user with auto-generated ID: $contentId10");
    // final contentId11 = await db.insertContent(ContentsCompanion(
    //   contentId: drift.Value(""), // 学生ID
    //   containerId: drift.Value("8bf83839953d5b3387cd75c6801084cf"), // パスワード
    //   file: drift.Value("pdf"), // 学年
    //   content: drift.Value(
    //       "https://rpwebcls.meijo-u.ac.jp/webclass/text/20/2024026428100/f1d88a1dea3efcda955a0cf0e646c263/955a0cf0e646c263.pdf"), // 学期
    // ));
    // print("Inserted user with auto-generated ID: $contentId11");
    // final contentId12 = await db.insertContent(ContentsCompanion(
    //   contentId: drift.Value(""), // 学生ID
    //   containerId: drift.Value("152ba362716243724cb54b5430717dad"), // パスワード
    //   file: drift.Value("pdf"), // 学年
    //   content: drift.Value(
    //       "https://rpwebcls.meijo-u.ac.jp/webclass/text/20/2024026428100/f1d88a1dea3efcda955a0cf0e646c263/955a0cf0e646c263.pdf"), // 学期
    // ));
    // print("Inserted user with auto-generated ID: $contentId12");
    print('サンプルデータの挿入完了');
  }

  @override
  void dispose() {
    db.close(); // データベース接続の終了
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Startpage(),
    );
  }
}
