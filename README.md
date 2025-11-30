# Hello Flutter

Flutter と Dart を学習するためのプロジェクトです。

## プロジェクトについて

このプロジェクトは Flutter のデフォルトアプリケーションテンプレートから始まりました。シンプルなカウンターアプリケーションで、ボタンをタップすると数値が増加します。

## はじめに

このプロジェクトを実行するための前提条件：

- [Flutter SDK](https://flutter.dev/docs/get-started/install) がインストールされていること
- 開発環境（VSCode、Android Studio など）がセットアップされていること

### 実行方法

```bash
# 依存関係のインストール
flutter pub get

# アプリケーションの実行
flutter run
```

## 機能

- カウンターの表示
- フローティングアクションボタンをタップしてカウンターを増加
- ホットリロード対応（開発中にリアルタイムで変更を確認可能）

## プロジェクト構成

```
lib/
└── main.dart    # アプリケーションのメインファイル
```

### main.dart の構成

- `MyApp`: アプリケーションのルートウィジェット
- `MyHomePage`: ホーム画面のステートフルウィジェット
- `_MyHomePageState`: ホーム画面の状態管理クラス

## 学習ポイント

このプロジェクトで学べる Flutter の基本：

1. **ウィジェット**: Flutter の基本的な構成要素
2. **ステート管理**: StatefulWidget と setState の使い方
3. **レイアウト**: Center、Column などのレイアウトウィジェット
4. **テーマ**: Material Design のテーマシステム
5. **ホットリロード**: 開発効率を上げる機能

## カスタマイズのヒント

- `ColorScheme.fromSeed` の `seedColor` を変更してテーマカラーを変更
- `AppBar` の `backgroundColor` を変更してヘッダーの色を変更
- カウンター表示のテキストスタイルをカスタマイズ

## 参考資料

- [Flutter 公式ドキュメント](https://docs.flutter.dev/)
- [Dart 言語ツアー](https://dart.dev/guides/language/language-tour)
- [Flutter ウィジェットカタログ](https://docs.flutter.dev/development/ui/widgets)
