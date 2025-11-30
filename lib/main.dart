import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // このウィジェットはアプリケーションのルートです。
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Flutter Demo',
      theme: ThemeData(
        // これはアプリケーションのテーマです。
        //
        // お試しください: 「flutter run」でアプリケーションを実行してみてください。
        // 紫色のツールバーが表示されます。アプリを終了せずに、以下のcolorSchemeの
        // seedColorをColors.greenに変更してから「ホットリロード」を実行してください
        // （変更を保存するか、Flutter対応のIDEで「ホットリロード」ボタンを押すか、
        // コマンドラインから起動した場合は「r」を押します）。
        //
        // カウンターがゼロにリセットされないことに注目してください。
        // ホットリロード中はアプリケーションの状態が保持されます。
        // 状態をリセットするには、代わりにホットリスタートを使用してください。
        //
        // これは値だけでなくコードでも同様に動作します：ほとんどのコード変更は
        // ホットリロードだけでテストできます。
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Hello Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // このウィジェットはアプリケーションのホームページです。ステートフルなので、
  // 見た目に影響を与えるフィールドを含むStateオブジェクト（以下で定義）を持ちます。

  // このクラスはstateの設定です。親（この場合はAppウィジェット）から提供された
  // 値（この場合はtitle）を保持し、Stateのbuildメソッドで使用されます。
  // Widgetサブクラスのフィールドは常に「final」でマークされます。

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // このsetStateの呼び出しは、Flutterフレームワークに対してこのStateで
      // 何かが変更されたことを伝えます。これにより、以下のbuildメソッドが
      // 再実行され、表示が更新された値を反映できるようになります。
      // setState()を呼び出さずに_counterを変更した場合、buildメソッドは
      // 再度呼び出されず、何も起こらないように見えます。
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // このメソッドはsetStateが呼び出されるたびに再実行されます。
    // 例えば上記の_incrementCounterメソッドによって行われます。
    //
    // Flutterフレームワークは、buildメソッドの再実行を高速化するよう最適化されており、
    // ウィジェットのインスタンスを個別に変更する必要なく、
    // 更新が必要なものを再構築できます。
    return Scaffold(
      appBar: AppBar(
        // お試しください: ここの色を特定の色（例えばColors.amber）に変更して
        // ホットリロードを実行し、AppBarの色だけが変わって
        // 他の色はそのままになることを確認してください。
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // ここではApp.buildメソッドによって作成されたMyHomePageオブジェクトから
        // 値を取得し、アプリバーのタイトルを設定しています。
        title: Text(widget.title),
      ),
      body: Center(
        // Centerはレイアウトウィジェットです。単一の子を取り、
        // 親の中央に配置します。
        child: Column(
          // Columnもレイアウトウィジェットです。子のリストを取り、
          // それらを縦に配置します。デフォルトでは、水平方向では子に合わせて
          // サイズを調整し、垂直方向では親と同じ高さになろうとします。
          //
          // Columnには、自身のサイズと子の配置を制御するための様々なプロパティがあります。
          // ここではmainAxisAlignmentを使って子を垂直方向に中央揃えしています。
          // Columnsは縦方向なので、ここでのメインアクシスは垂直軸です
          // （クロスアクシスは水平軸になります）。
          //
          // お試しください: 「デバッグペインティング」を有効にしてください
          // （IDEで「Toggle Debug Paint」アクションを選択するか、コンソールで「p」を押す）。
          // 各ウィジェットのワイヤーフレームを見ることができます。
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('ボタンを押した回数:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
