# ウィジェットツリー図解

このドキュメントでは、main.dartのウィジェットツリーを視覚的に理解できるよう、様々な角度から図解します。

## 1. 基本的なウィジェットツリー構造

```
MyApp
 └─ MaterialApp
     └─ MyHomePage
         └─ Scaffold
             ├─ AppBar
             │   └─ Text("Hello Flutter Demo Home Page")
             ├─ Center (body)
             │   └─ Column
             │       ├─ Text("ボタンを押した回数:")
             │       └─ Text("0")  // _counter値
             └─ FloatingActionButton
                 └─ Icon(Icons.add)
```

## 2. 詳細なウィジェットツリー（プロパティ付き）

```
MyApp [StatelessWidget]
 │
 └─ MaterialApp
     ├─ title: "Hello Flutter Demo"
     ├─ theme: ThemeData
     │   └─ colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
     └─ home: MyHomePage
         ├─ title: "Hello Flutter Demo Home Page"
         │
         └─ _MyHomePageState [State<MyHomePage>]
             ├─ _counter: 0
             ├─ _incrementCounter(): void
             │
             └─ Scaffold
                 ├─ appBar: AppBar
                 │   ├─ backgroundColor: Theme.of(context).colorScheme.inversePrimary
                 │   └─ title: Text(widget.title)
                 │
                 ├─ body: Center
                 │   └─ child: Column
                 │       ├─ mainAxisAlignment: MainAxisAlignment.center
                 │       └─ children: [
                 │           ├─ Text("ボタンを押した回数:")
                 │           └─ Text(
                 │               ├─ "$_counter"
                 │               └─ style: Theme.of(context).textTheme.headlineMedium
                 │              )
                 │          ]
                 │
                 └─ floatingActionButton: FloatingActionButton
                     ├─ onPressed: _incrementCounter
                     ├─ tooltip: "Increment"
                     └─ child: Icon(Icons.add)
```

## 3. レイアウトの視覚的表現

### 画面レイアウト図

```
┌─────────────────────────────────────┐
│          AppBar                     │
│  Hello Flutter Demo Home Page       │
├─────────────────────────────────────┤
│                                     │
│                                     │
│                                     │
│         ボタンを押した回数:         │
│              0                      │
│            (中央配置)               │
│                                     │
│                                     │
│                                     │
│                               [+]   │ ← FloatingActionButton
└─────────────────────────────────────┘
```

## 4. ウィジェットの親子関係と責任範囲

### レイヤー構造

```
アプリケーションレイヤー
┌─────────────────────────────────────────┐
│ MyApp (アプリ全体の設定)                │
│ ┌───────────────────────────────────┐   │
│ │ MaterialApp (Material Design)     │   │
│ │ ┌─────────────────────────────┐   │   │
│ │ │ MyHomePage (画面定義)       │   │   │
│ │ │ ┌───────────────────────┐   │   │   │
│ │ │ │ Scaffold (レイアウト) │   │   │   │
│ │ │ └───────────────────────┘   │   │   │
│ │ └─────────────────────────────┘   │   │
│ └───────────────────────────────────┘   │
└─────────────────────────────────────────┘
```

## 5. データフロー図

```
ユーザーアクション
       ↓
FloatingActionButton (タップ)
       ↓
onPressed: _incrementCounter
       ↓
setState(() {
  _counter++;  ← 状態の更新
})
       ↓
build()メソッド再実行
       ↓
新しいウィジェットツリー生成
       ↓
画面の更新 (Text("1"))
```

## 6. BuildContextの階層

```
BuildContext階層:

MyApp.build(context)
    ↓
MaterialApp
    ↓ (新しいcontext)
MyHomePage
    ↓ 
_MyHomePageState.build(context)
    ↓
Scaffold
    ↓ (各子ウィジェットで利用可能)
    ├─ AppBar → Theme.of(context)
    ├─ Center
    └─ FloatingActionButton
```

## 7. ウィジェットタイプ別分類

### StatelessWidget
```
MyApp
 └─ MaterialApp
     └─ Text (各種)
         └─ Icon
```

### StatefulWidget
```
MyHomePage
 └─ _MyHomePageState (State管理)
```

### レイアウトウィジェット
```
Scaffold (基本構造)
 ├─ AppBar (上部)
 ├─ Center (中央配置)
 │   └─ Column (縦並び)
 └─ FloatingActionButton (浮動ボタン)
```

## 8. 状態管理の流れ

```
初期状態:
MyHomePage → _MyHomePageState
              ├─ _counter = 0
              └─ build() → UI表示

ボタンタップ後:
FloatingActionButton.onPressed
    ↓
_incrementCounter()
    ↓
setState(() => _counter++)
    ↓
_MyHomePageState.build() 再実行
    ↓
Text("$_counter") // 新しい値で更新
```

## 9. レスポンシブ構造

```
MaterialApp (テーマ提供)
    ↓
Theme.of(context) で参照可能
    ├─ colorScheme.inversePrimary → AppBar背景色
    └─ textTheme.headlineMedium → カウンターテキストスタイル
```

## 10. ウィジェットの再利用性

```
共通ウィジェット:
├─ Text (3箇所で使用)
│   ├─ AppBarのタイトル
│   ├─ 説明テキスト
│   └─ カウンター表示
│
├─ Icon (1箇所)
│   └─ FloatingActionButtonの中
│
└─ Theme.of(context) (2箇所で参照)
    ├─ AppBarの背景色
    └─ カウンターのテキストスタイル
```

## まとめ

このウィジェットツリー構造により：

1. **明確な階層**: 各ウィジェットの役割が明確
2. **データの流れ**: 上から下へ、イベントは下から上へ
3. **状態管理**: StatefulWidgetで局所的に管理
4. **再利用性**: 同じウィジェットを複数箇所で使用
5. **テーマ統一**: MaterialAppで全体のデザイン統一

この構造を理解することで、Flutterアプリケーションの拡張や修正が容易になります。