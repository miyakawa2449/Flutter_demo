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
hello_flutter/
├── lib/
│   └── main.dart    # アプリケーションのメインファイル
└── docs/           # プロジェクトドキュメント
    ├── flutter-widget-basics.md         # Flutterウィジェットの基本概念
    ├── main-dart-detailed-guide.md      # main.dartの詳細解説
    ├── widget-tree-visualization.md     # ウィジェットツリーの図解
    └── button-event-handling-guide.md   # ボタンイベント処理ガイド
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

## ドキュメント

このプロジェクトの詳細な技術ドキュメント：

### 基本概念
- [Flutterウィジェットの基本概念](./docs/flutter-widget-basics.md) - ウィジェットの種類、ライフサイクル、ベストプラクティス

### コード解説
- [main.dartの詳細解説ガイド](./docs/main-dart-detailed-guide.md) - ファイル構成、各クラスの役割、データフローの詳細
- [ウィジェットツリーの図解](./docs/widget-tree-visualization.md) - アプリケーションの構造を視覚的に理解

### 実装ガイド
- [FloatingActionButtonイベント処理ガイド](./docs/button-event-handling-guide.md) - ボタンのタップ検知から画面更新までの詳細な流れ

## 参考資料

- [Flutter 公式ドキュメント](https://docs.flutter.dev/)
- [Dart 言語ツアー](https://dart.dev/guides/language/language-tour)
- [Flutter ウィジェットカタログ](https://docs.flutter.dev/development/ui/widgets)
