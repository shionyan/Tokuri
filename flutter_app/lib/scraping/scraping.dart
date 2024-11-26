/*  作成者　鈴木 
    スクレイピングをするメインのライブラリ
*/

import 'package:puppeteer/puppeteer.dart';
import 'dart:io';
import 'package:flutter_app/databese/database.dart';

// Userクラスに保存された学籍番号とパスワードを使ってWebclassにログインする
Future<Page> login_webclass(User user) async {
  // ブラウザの起動
  const url = 'https://rpwebcls.meijo-u.ac.jp/webclass/login.php?auth_mode=SAML';
  final browser = await puppeteer.launch(headless: true);
  final page = await browser.newPage();
  await page.goto(url);

  // ログインされている場合
  if (page.url == 'https://rpwebcls.meijo-u.ac.jp/webclass/') {
    // ログイン後のWebclassメインページを返す
    return page;
  }

  const idToken1Value = user.get_student_id; // ID Token 1に入力する値
  const idToken2Value = user.get_password; // ID Token 2に入力する値

  // ID Token 1に値を入力
  await page.waitForSelector('#idToken1'); // 要素が表示されるのを待つ
  await page.type('#idToken1', idToken1Value); // 値を入力

  // ID Token 2に値を入力
  await page.waitForSelector('#idToken2'); // 要素が表示されるのを待つ
  await page.type('#idToken2', idToken2Value); // 値を入力

  // ログイン実行
  await page.keyboard.press("Enter");
  await page.waitForNavigation(); // ナビゲーションが完了するまで待機

  // ログインされている場合
  if (page.url == 'https://rpwebcls.meijo-u.ac.jp/webclass/') {
    // ログイン後のWebclassメインページを返す
    return page;
  } else {
    throw Exception('ログインエラー: ページが期待するURLに移動しませんでした。');
  }
}

