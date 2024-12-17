import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter_app/database/database.dart' as driftDb; //driftに別名をつける
import 'package:tuple/tuple.dart';
import 'package:url_launcher/link.dart';

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
            TaskListContent2(),
            // ListContent(title: '追加'),
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
  late driftDb.AppDatabase db;
  List<String> items = []; // データを保存するリスト
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    db = driftDb.AppDatabase(); //シングルトンインスタンスを使用
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
      1: "[返信不可] レポートを受け取りました [642809 言語・オートマトン (2024-後期-水4) / 第12回（12月4日） / 言語オートマトンノート 6.pdf / 299.58 KB]",
      2: "[返信不可] レポートを受け取りました [642809 言語・オートマトン (2024-後期-水4) / 第12回（12月4日） / 言語オートマトンノート 6.pdf / 299.58 KB]",
      3: "[返信不可] レポートを受け取りました [642809 言語・オートマトン (2024-後期-水4) / 第12回（12月4日） / 言語オートマトンノート 6.pdf / 299.58 KB]",
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

//
//データベースからデータを取得して、リストにする関数
//
class TaskListContent2 extends StatefulWidget {
  @override
  _TaskListContentState2 createState() => _TaskListContentState2();
}

class _TaskListContentState2 extends State<TaskListContent2> {
  late driftDb.AppDatabase db;
  List<
      Tuple4<driftDb.Subject, driftDb.Category, driftDb.Container,
          driftDb.Content>> items = []; // 結合結果を保存
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    db = driftDb.AppDatabase(); // db の初期化
    _fetchTasks(); // データを取得
  }

  // データベースからデータを取得
  Future<void> _fetchTasks() async {
    setState(() {
      isLoading = true;
    });

    try {
      items = await db.fetchAllData();
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      debugPrint('データ取得に失敗しました。');
    }
  }

  @override
  Widget build(BuildContext context) {
    String? prevCategory = ''; // 前回のカテゴリを追跡する変数
    return isLoading
        ? Center(child: CircularProgressIndicator()) // データ取得中はローディングを表示
        : ListView.builder(
            itemCount: items.length, // データの数に基づいてリストを作成
            itemBuilder: (context, index) {
              // final subject = items[index].item1;
              print(items);

              final category = items[index].item2.categoryName;
              // カテゴリ名がnullまたは空の場合はウィジェット自体をスキップ
              if (category == prevCategory) {
                return SizedBox.shrink(); // 空のウィジェットを返して表示しない
              }

              prevCategory = category; // 現在のカテゴリを記録

              return Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Color(0xFF669bbc),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category ?? 'No Date',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, counter) {
                          final container = items[counter].item3.title;
                          final content = items[counter].item4.content;

                          return ListTile(
                            title: Text(container ?? 'No Data'),
                            subtitle: Link(
                              uri: Uri.parse('$content'),
                              target: LinkTarget.blank,
                              builder:
                                  (BuildContext ctx, FollowLink? openLink) {
                                return TextButton(
                                  onPressed: openLink,
                                  child: const Text(
                                    'リンク',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  style: ButtonStyle(
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                );
                              },
                            ),
                            // tileColor: Colors.white,
                          );
                        },
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                      ),
                    ]),
              );
            },
          );
  }
}

class ReportPage extends StatelessWidget {
  final driftDb.AppDatabase db;

  ReportPage() : db = driftDb.AppDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('レポート')),
      body: Column(
        children: [
          Center(child: Text('レポート画面')),
          ElevatedButton(
              onPressed: () async {
                await db.clearAllTables(); // データベースのクリーンアップ
              },
              child: const Text('削除'))
        ],
      ),
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
