# FloatingActionButton イベント処理ガイド

このドキュメントでは、FloatingActionButtonのタップイベント処理について詳しく解説します。

## 基本的な仕組み

### 1. ボタンの定義

```dart
floatingActionButton: FloatingActionButton(
  onPressed: _incrementCounter,  // ← タップ時に呼ばれる関数を指定
  tooltip: 'Increment',         // 長押し時のヒント表示
  child: const Icon(Icons.add), // ボタンのアイコン
),
```

### 2. イベントハンドラー関数

```dart
void _incrementCounter() {
  setState(() {
    _counter++;  // カウンターを1増やす
  });
}
```

## 動作の詳細解説

### ステップ1：タップの検知

FloatingActionButtonは内部でGestureDetectorを使用してタップを検知します。ユーザーがボタンをタップすると：

1. タッチイベントが発生
2. FloatingActionButtonがイベントを受け取る
3. `onPressed`プロパティをチェック

### ステップ2：関数の呼び出し

```dart
onPressed: _incrementCounter,  // 関数の参照を渡す
```

**重要なポイント：**
- `_incrementCounter`（括弧なし）：関数の参照を渡す
- `_incrementCounter()`（括弧あり）：関数を即座に実行してしまう（間違い）

### ステップ3：状態の更新

```dart
void _incrementCounter() {
  setState(() {
    _counter++;
  });
}
```

**setStateの役割：**

| 処理 | 説明 |
|------|------|
| `_counter++` | 変数の値を増やす |
| `setState()` | Flutterに再描画を指示 |
| `build()再実行` | 新しいUIを生成 |

## よくある間違いと解決方法

### 間違い1：setStateを使わない

```dart
// ❌ 間違い
void _incrementCounter() {
  _counter++;  // 値は変わるが画面は更新されない
}
```

**問題：** 変数の値は変更されますが、Flutterは変更を知らないため画面が更新されません。

### 間違い2：関数を即座に実行

```dart
// ❌ 間違い
floatingActionButton: FloatingActionButton(
  onPressed: _incrementCounter(),  // () があると即座に実行される
  child: const Icon(Icons.add),
),
```

**問題：** ボタンが作成される時点で関数が実行され、タップ時には何も起こりません。

### 間違い3：setStateの外で状態を変更

```dart
// ❌ 間違い
void _incrementCounter() {
  _counter++;  // setStateの外
  setState(() {
    // 空
  });
}
```

**問題：** 技術的には動作しますが、推奨されません。状態の変更はsetState内で行うべきです。

## 正しい実装パターン

### パターン1：基本的な実装

```dart
void _incrementCounter() {
  setState(() {
    _counter++;
  });
}
```

### パターン2：複数の状態を更新

```dart
void _incrementCounter() {
  setState(() {
    _counter++;
    _lastUpdated = DateTime.now();
    _message = 'カウンター更新: $_counter';
  });
}
```

### パターン3：条件付き更新

```dart
void _incrementCounter() {
  if (_counter < 10) {
    setState(() {
      _counter++;
    });
  } else {
    // 上限に達した場合の処理
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('カウンターは10が上限です')),
    );
  }
}
```

## イベント処理フロー図

```
ユーザーアクション
    │
    ├─→ ボタンをタップ
    │
    ├─→ FloatingActionButtonがタップを検知
    │
    ├─→ onPressedプロパティを確認
    │
    ├─→ _incrementCounter関数を見つける
    │
    ├─→ _incrementCounter()を実行
    │      │
    │      ├─→ setState()を呼び出し
    │      │
    │      ├─→ クロージャ内で_counter++を実行
    │      │
    │      └─→ 状態変更をFlutterに通知
    │
    ├─→ Flutterがbuild()メソッドを再実行
    │
    ├─→ 新しいウィジェットツリーを生成
    │      │
    │      └─→ Text('$_counter')が新しい値で作成
    │
    └─→ 画面を再描画（新しいカウンター値を表示）
```

## 他のボタンウィジェットでの実装

### ElevatedButton

```dart
ElevatedButton(
  onPressed: _incrementCounter,
  child: Text('カウントアップ'),
)
```

### IconButton

```dart
IconButton(
  onPressed: _incrementCounter,
  icon: Icon(Icons.add),
)
```

### TextButton

```dart
TextButton(
  onPressed: _incrementCounter,
  child: Text('増やす'),
)
```

## 高度なイベント処理

### 非同期処理

```dart
void _incrementCounterAsync() async {
  // APIコールなどの非同期処理
  await Future.delayed(Duration(seconds: 1));
  
  // setStateは非同期処理の後でも呼べる
  setState(() {
    _counter++;
  });
}
```

### ボタンの無効化

```dart
floatingActionButton: FloatingActionButton(
  onPressed: _counter >= 10 ? null : _incrementCounter,  // nullで無効化
  backgroundColor: _counter >= 10 ? Colors.grey : null,
  child: const Icon(Icons.add),
),
```

## まとめ

1. **FloatingActionButton**：タップイベントを検知するUIウィジェット
2. **onPressed**：タップ時に実行する関数を指定するプロパティ
3. **イベントハンドラー**：実際の処理を行う関数
4. **setState**：状態変更をFlutterに通知し、UIを再描画

この仕組みを理解することで、インタラクティブなFlutterアプリケーションを構築できます。