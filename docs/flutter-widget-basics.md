# Flutter ウィジェットの基本概念

## ウィジェットとは？

Flutterにおけるウィジェット（Widget）は、アプリケーションのUIを構成する基本単位です。すべてのUI要素（テキスト、ボタン、レイアウトなど）はウィジェットです。

### ウィジェットの特徴

1. **イミュータブル（不変）**: ウィジェット自体は変更できません
2. **宣言的**: UIの状態を記述するだけで、Flutterが実際の描画を処理します
3. **コンポジション**: 小さなウィジェットを組み合わせて複雑なUIを構築します

## ウィジェットの2つのタイプ

### 1. StatelessWidget（ステートレスウィジェット）

状態を持たないウィジェットです。一度作成されると、その内容は変更されません。

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}
```

**特徴:**
- 状態が変わらない静的なUI要素に適している
- `build`メソッドが一度だけ呼ばれる
- パフォーマンスが良い

### 2. StatefulWidget（ステートフルウィジェット）

状態を持ち、その状態が変化することでUIも更新されるウィジェットです。

```dart
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('$_counter'),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
      ),
    );
  }
}
```

**特徴:**
- 動的なUI要素（ユーザー入力、アニメーションなど）に適している
- `setState()`を呼ぶことでUIを再構築
- Widgetクラスと対応するStateクラスの2つが必要

## 主要なウィジェットの種類

### 1. レイアウトウィジェット

UIの配置を制御するウィジェット：

- **Container**: 単一の子を持ち、パディング、マージン、装飾を追加できる
- **Row**: 子を水平方向に配置
- **Column**: 子を垂直方向に配置
- **Stack**: 子を重ねて配置
- **Center**: 子を中央に配置
- **Padding**: 子の周りに余白を追加
- **Align**: 子を特定の位置に配置

### 2. 構造ウィジェット

アプリの基本構造を提供：

- **MaterialApp**: Material Designアプリケーションのルート
- **Scaffold**: 基本的な画面レイアウト（AppBar、Body、FloatingActionButtonなど）
- **AppBar**: 画面上部のアプリバー

### 3. 表示ウィジェット

コンテンツを表示：

- **Text**: テキストを表示
- **Icon**: アイコンを表示
- **Image**: 画像を表示

### 4. インタラクションウィジェット

ユーザーとのインタラクションを処理：

- **GestureDetector**: タップ、ドラッグなどのジェスチャーを検出
- **InkWell**: タップ時にリップルエフェクトを表示
- **Button系**: ElevatedButton, TextButton, IconButton など

## ウィジェットツリー

Flutterアプリケーションは、ウィジェットのツリー構造で構成されています：

```
MaterialApp
└── Scaffold
    ├── AppBar
    │   └── Text
    └── Center
        └── Column
            ├── Text
            └── ElevatedButton
                └── Text
```

### 親子関係

- **親ウィジェット**: 他のウィジェットを含む
- **子ウィジェット**: 親ウィジェットに含まれる
- 親は子のサイズや位置を制御できる

## BuildContext

`BuildContext`は、ウィジェットツリー内でのウィジェットの位置を表します：

```dart
@override
Widget build(BuildContext context) {
  // contextを使って親ウィジェットの情報にアクセス
  final theme = Theme.of(context);
  return Container(color: theme.primaryColor);
}
```

### 主な用途

1. **テーマへのアクセス**: `Theme.of(context)`
2. **メディア情報の取得**: `MediaQuery.of(context)`
3. **ナビゲーション**: `Navigator.of(context)`
4. **継承ウィジェットへのアクセス**: `*.of(context)`パターン

## ライフサイクル

### StatelessWidget

1. **コンストラクタ**: ウィジェットが作成される
2. **build**: UIを構築

### StatefulWidget

1. **createState**: Stateオブジェクトを作成
2. **initState**: 初期化処理（一度だけ実行）
3. **build**: UIを構築
4. **setState**: 状態を更新してUIを再構築
5. **dispose**: クリーンアップ処理

## ベストプラクティス

### 1. ウィジェットの分割

大きなウィジェットは小さな部品に分割：

```dart
// 良い例
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ContentBody(),
    );
  }
}
```

### 2. const コンストラクタの使用

可能な限り`const`を使用してパフォーマンスを向上：

```dart
// 良い例
const Text('固定テキスト');
const Padding(padding: EdgeInsets.all(8.0));
```

### 3. キーの適切な使用

リスト内のウィジェットなど、同じタイプの複数のウィジェットがある場合：

```dart
ListView.builder(
  itemBuilder: (context, index) {
    return ListTile(
      key: ValueKey(items[index].id),
      title: Text(items[index].name),
    );
  },
);
```

## まとめ

Flutterのウィジェットシステムは：

1. **すべてがウィジェット**という統一的な概念
2. **宣言的UI**により、コードが読みやすく保守しやすい
3. **コンポジション**により、複雑なUIも簡単に構築可能
4. **状態管理**により、動的なUIを効率的に実現

これらの基本概念を理解することで、Flutterアプリケーションの開発がスムーズになります。