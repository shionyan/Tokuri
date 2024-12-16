import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter_app/database/database.dart'; //driftに別名をつける

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _selectedIndex = 1;

  //画面リスト
  final List<Widget> _pages = [
    ReportPage(),
    HomePage(),
    SettingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // 選択中の画面を表示
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'レポート',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '設定',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // タブ数
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: 'メッセージ'),
              Tab(text: '内容'),
              Tab(text: '課題'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TaskListContent(),
            ListContent(title: '内容'),
            ListContent(title: '追加'),
          ],
        ),
      ),
    );
  }
}

// スクロール可能なリストビューを作成
class ListContent extends StatelessWidget {
  final String title;

  ListContent({required this.title});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 50, // 仮に50個の項目を表示
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.note),
          title: Text('$title アイテム $index'),
          subtitle: Text('詳細情報 $index'),
        );
      },
    );
  }
}

//
//データベースからデータを取得して、リストにする関数
//
class TaskListContent extends StatefulWidget {
  @override
  _TaskListContentState createState() => _TaskListContentState();
}

class _TaskListContentState extends State<TaskListContent> {
  late AppDatabase db;
  List<String> items = []; // データを保存するリスト
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchTasks(); // データを取得
  }

  // データベースからデータを取得
  Future<void> _fetchTasks() async {
    setState(() {
      isLoading = true;
    });

    int id = 1; // 主キーの初期値
    while (true) {
      // Driftデータベースから主キーに基づいてデータを取得
      final item = await getTaskFromDatabase(id);
      // データ取得
      // final task = await db.getStudentId(id); // 主キーid = 1のユーザーの学生IDを取得
      if (item == null) break;
      items.add(item);
      id++;
    }

    setState(() {
      isLoading = false;
    });
  }

  // データベース操作（実際のDriftコードに置き換える必要あり）
  Future<String?> getTaskFromDatabase(int id) async {
    // 実際のデータベース操作に置き換えてください
    await Future.delayed(Duration(milliseconds: 100)); // 遅延を模擬
    Map<int, String> mockData = {
      1: "課題1: レポート提出",
      2: "課題2: チームプロジェクト",
      3: "課題3: プレゼン準備",
      // 主キー 4以降はデータなしと仮定
    };
    return mockData[id]; // 主キーに対応するデータを返す（データがない場合はnull）
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator()) // データ取得中はローディングを表示
        : ListView.builder(
            itemCount: items.length, // データの数に基づいてリストを作成
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.task),
                title: Text(items[index]),
              );
            },
          );
  }
}

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('レポート')),
      body: Center(child: Text('レポート画面')),
    );
  }
}

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('設定')),
      body: Center(child: Text('設定画面')),
    );
  }
}
