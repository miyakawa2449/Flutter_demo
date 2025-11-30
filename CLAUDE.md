# Claude Code プロジェクト情報

このファイルは Claude Code がプロジェクトを理解するための情報を含んでいます。

## プロジェクト概要

- **プロジェクト名**: Hello Flutter
- **プロジェクトタイプ**: Flutter アプリケーション
- **主な言語**: Dart
- **目的**: Flutter と Dart の学習用プロジェクト

## 技術スタック

- **フレームワーク**: Flutter
- **プログラミング言語**: Dart
- **対応プラットフォーム**: iOS, Android, Web, Windows, macOS, Linux

## プロジェクト構成

```
hello_flutter/
├── lib/
│   └── main.dart          # メインアプリケーションファイル
├── test/
│   └── widget_test.dart   # ウィジェットテスト
├── android/               # Android プラットフォーム固有のコード
├── ios/                   # iOS プラットフォーム固有のコード
├── web/                   # Web プラットフォーム固有のコード
├── windows/               # Windows プラットフォーム固有のコード
├── macos/                 # macOS プラットフォーム固有のコード
├── linux/                 # Linux プラットフォーム固有のコード
├── pubspec.yaml           # 依存関係とプロジェクト設定
└── README.md              # プロジェクトドキュメント
```

## 開発環境

### 必要なツール

- Flutter SDK
- Dart SDK（Flutter に含まれる）
- エディタ（VSCode, Android Studio, IntelliJ IDEA など）

### よく使うコマンド

```bash
# 依存関係のインストール
flutter pub get

# アプリケーションの実行
flutter run

# テストの実行
flutter test

# ビルド（リリース版）
flutter build apk        # Android
flutter build ios        # iOS
flutter build web        # Web

# コードフォーマット
dart format lib/

# 静的解析
flutter analyze

# 依存関係の更新
flutter pub upgrade
```

## コーディング規約

### 命名規則

- **クラス名**: PascalCase（例: `MyHomePage`）
- **変数・関数名**: camelCase（例: `incrementCounter`）
- **定数**: camelCase（例: `defaultTimeout`）
- **ファイル名**: snake_case（例: `main_screen.dart`）

### コードスタイル

- インデント: スペース 2 つ
- 行の最大長: 80 文字（推奨）
- `const` コンストラクタを可能な限り使用
- 不要なコメントは避ける（コードが自己文書化されるように）

## 現在の実装状況

### 実装済み機能

- カウンターアプリケーション
- Material Design テーマ
- ホットリロード対応
- 日本語コメント

### 今後の拡張案

1. **状態管理の改善**
   - Provider, Riverpod, Bloc などの導入検討

2. **UI の拡張**
   - カウンターのリセットボタン
   - カウンター履歴の表示
   - ダークモード対応

3. **テストの充実**
   - ユニットテストの追加
   - インテグレーションテストの追加

4. **国際化対応**
   - 多言語サポート（日本語/英語）

## 注意事項

- `title` プロパティが "Hello Flutter Demo" から "Flutter Demo" に変更されています
- ボタンのテキストが「You have pushed the button this many times:」から「ボタンを押した回数:」に日本語化されています
- すべてのコメントが日本語に翻訳されています

## デバッグのヒント

1. **ホットリロードが効かない場合**
   - ホットリスタート（Shift + r）を試す
   - アプリを完全に再起動する

2. **ビルドエラーの場合**
   - `flutter clean` を実行
   - `flutter pub get` を再実行

3. **パフォーマンスの問題**
   - Flutter Inspector でウィジェットツリーを確認
   - DevTools でパフォーマンスプロファイリング

## リソース

- [Flutter 公式ドキュメント](https://docs.flutter.dev/)
- [Dart 言語ツアー](https://dart.dev/guides/language/language-tour)
- [Flutter ウィジェットカタログ](https://docs.flutter.dev/development/ui/widgets)
- [Flutter サンプル集](https://github.com/flutter/samples)