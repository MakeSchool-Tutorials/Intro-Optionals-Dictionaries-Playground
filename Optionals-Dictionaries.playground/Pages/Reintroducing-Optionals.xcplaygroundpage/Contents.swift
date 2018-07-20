/*:
 ![Make School Banner](./swift_banner.png)
 # Swiftのオプショナル
 
 ## Swiftのオプショナルとは
 
 プログラミングでは、変数が値を含むことも含まないこともあるという事実を表現できると便利な場合があります。 Swiftでは、**オプショナル**を使用してこれを実現できます。 オプショナルは値**または**`nil`(「値なし」を意味する) の**いずれか**を格納します。 オプショナルは箱のようなもので、中に何かが入っていることもあれば、何も入っていないこともあります。
 
 Objective-C、Python、Javaなど一部の言語は、値がない可能性を型が明示していなくても変数を`nil`または`null`に設定できます。 Swiftは「変数がいつ値を持たなくてもいいか」についてかなり厳格なので、値があると思っていたのに実際はないというバグを回避するのに非常に役立ちます。 関数は処理が失敗したか、返す値がない場合にnilを返すことができます。
 
 値がオプショナル型であることを示すには、型の名前の最後に疑問符 (`?`) を追加します。 例えば、`Int?`(「オプショナルの`Int`と読みます」) 型の変数は次のように宣言します。
 */
var maybeAnInt: Int? = 15
//: ここでは、15の変数値を明確に設定しましたが、それと同じぐらい簡単に`nil`を割り当てることもできました:
maybeAnInt = nil
//: ここで`maybeAnInt`が`nil`（_値がない状態_）です。 `maybeAnInt`がちょうどInt型であった場合、それを` nil`に設定することはできませんでした。
/*:
 ## Optionalのアンラップ
 
 オプショナルから値を取得することを「アンラップする」と言います。 これは、箱を開けて中に何か入っているか確かめるのに相当します。 `nil`と比較することでOptionalに値があるかどうかを確かめられます。 `nil`と等しくなければ値が格納されていることになります。 実に簡単です！
 これで**強制アンラップ**を安全に使用してその値を取得できます。 強制アンラッピングを行うには、アンラップしたい変数名の後に感嘆符（`!`）を付けます。 これによりSwiftではOptionalは必ず値が格納されるので、安全に読み取れます。 間違えていたらコードはクラッシュします。 ここでは`maybeAnInt`が値を持つか検証し、値がある場合は箱を開けて (強制アンラップ) その値を出力します。
 */
if maybeAnInt != nil {
    print("maybeAnInt contains a value, and it is \(maybeAnInt!)")
} else {
    print("maybeAnInt does not contain a value")
}
/*:
 - experiment:
 （実験）`maybeAnInt`の値を`nil`から何か具体的な数値に変更します。 値に応じてどのメッセージが出力されるか注意してください。
 */
/*:
 ## オプショナルバインディング
 
 オプショナルの値を検証するもっとコンパクトな方法が**オプショナル バインディング**です。オブジェクトの存在を検証し、存在する場合はこのオブジェクト用の新しい変数をより狭いスコープで作成します。 ここでは、`maybeAnInt`(存在する場合) の値を「if/else」ブロック内のみに存在する`definitelyAnInt`という新しい定数に「バインド」し、出力します。
 */
if let definitelyAnInt = maybeAnInt {
    print("maybeAnInt contains a value, and it is \(definitelyAnInt)")
} else {
    print("maybeAnInt does not contain a value")
}
/*:
 - experiment:
 （実験)
 `maybeAnInt`の値を再度変更して、値を格納している場合はこれを示すメッセージが表示され、ローカル変数`definitelyAnInt`が同じ値になることに注意してください。 値を格納していない場合は、`definitelyAnInt`は作成されません。
 */
/*:
 ## 暗黙的にアンラップされたオプション
 
 「値を読み取る必要があるときにはいつでも、オプショナルは値を持つのだ」と示したい場合もあります。 例えば、オプショナルの宣言を値の初期設定と分離する場合がこれに当たります。 Optionalを最初に宣言した時点では、これは値を持ちませんが、使用する前に値を設定します。 こうしたシナリオに対応するために、変数を**Implicitly Unwrapped Optional**（暗黙的にアンラップされたOptional）として宣言できます。 Implicitly Unwrapped Optionalを宣言するには、`nil`を格納できるが読み取るときは常に値がなければならないことを示す感嘆符 (`!`) を、該当する型の後に付加します。
 */
var alwaysAString: String! = nil
/*:
 最初に`nil`をこのImplicitly Unwrapped Optional`String`に代入することに注意してください。 この時点で使おうとするとランタイムエラーが発生します。
 */
//let stringLength = alwaysAString.characters.count
/*:
 上の行のコメントを外すとどうなるか試してみてください。 Playgroundの残りが評価されなくなることに気付くかもしれません。 これは変数にアクセスしようとする際に根底のプロセスが異常終了するからです。 そのため、値を設定する前にはImplicitly Unwrapped Optionalを絶対に読み取らないようにしなければなりません。
 */
/*:値を代入して変数を`nil`ではなくしましょう。
 */
alwaysAString = "Now I have a value!"
//: さて、この文字列をプリントするときに、含まれている`String`値に対してImplicit Unwrappingが行われています。
print(alwaysAString)
/*:
 ここでの重要なポイントは、変数をImplicitly Unwrappedと宣言すると、Swiftは _自動的に_ 使用された値をアンラップできるようになることです。 これは通常の状況の反対です。 通常は、値を格納していることがはっきりしたら`!`を使って値を強制アンラップします。 Implicitly Unwrapped のオプショナルでは、変数を宣言した時点から使用時に`nil`になることは _決してありません_ 。 そのため頻繁に利用する変数に関して、入力の手間や（見苦しさ！）を 省くことができるようになります。 ですが、初めて変数を読み取る前に、100%確実に値が代入されているようにするのが重要です。そうでないと異常終了してしまいます。
 */
/*:
 ## Optionalsのメソッドを呼び出し
 
 オプショナルに対してメソッドを呼び出すには、まずSwiftに対してImplicitly Unwrapped Optionalまたはメソッドが呼び出されたオプショナルの強制アンラッピングのいずれかを通じて非オプショナルを与えます。 オプショナルでメソッドを直接呼び出すとコンパイル時エラーとなります。 次の行のコメントを外してみてください。
 */
//let intDescription = maybeAnInt.description // Value of optional type 'Int?' not unwrapped!
/*:
 ですが私たちはプログラマー。ルールにどうにか対処できないかと取り組むのが好きです。 **オプショナルチェイニング**という手法を使えばSwiftに非オプショナルを与える必要がなくなります。 チェイニングは、オプショナルでメソッドをコールするためのテクニックで、オプショナルに値が含まれる場合はメソッドをコールし、含まれない場合は何も実行しません。 チェイニングを実行するには、変数名とドット、括弧、またはそれに続くブラケットの間に疑問符を置きます。
 */
let optionalArray: [Int]? = [ 1, 2, 3, 4 ]
let arrayLength = optionalArray?.count
let firstElement = optionalArray?[0]
/*:
 `optionalArray`という名前の後に`?`を付加すると、Swiftは`count`を呼び出したり、配列にアクセスしたりする前に、変数が`nil`かどうかを確認します。 こうした式の型はメソッドの戻り値の型と同じ型のOptionalsです (通常`Int`を返す`count`の呼び出しは`Int?`となります)。 ふぅ！ まだ大丈夫ですか？
 
 - experiment:（実験) `optionalArray`を`nil`に設定して、出力変数がどのように変化するか観察します。
 */
/*:
 ## Nil Coalescing Operator
 //:
 オプショナルが`nil`の場合、既定の値を使いたいこともあるでしょう。 例えば、独自の`name`プロパティが`nil`のときは、オブジェクトのプレースホルダー名を用意したり、integerが`nil`のときは0を使用したいかもしれません。
 //: (Javaをご存知なら、「conditional」や「ternary」演算子に似ていることにお気づきかもしれません。)
 
 Swiftにはこれを非常にコンパクトに行う手段が用意されています。Nil Coalescing Operator（`??`）です。 演算子の左側のOptionalが値を持つ場合、その値が式の値となります。 Optionalが`nil`の場合は、式の値は演算子の右側の値となります。 例を見てみましょう。
 */
let optionalString: String? = nil
let petName = optionalString ?? "Fido"

//: `optionalString`がnilでない場合は`petName`に`optionalString`の値を設定します。 nilなら`petName`に`Fido`を設定します。
/*:
 ## おさらい
 
 このPlaygroundでは、Swiftのオプショナルの機能をいくつか見てきました。 オプショナルはSwiftの欠かせない一部で、変数がいつ値を格納し、いつ格納しないかを非常に明確にすることができます。 Optionalsに関するルールはどれも最初は頭を混乱させるかもしれませんが、知識を実践に移すことですぐに直感的に理解できます。 その過程でコンパイラが間違いを知らせて、あなたを助けてくれるでしょう。
 */




/*:
 
 ## 課題
 
 オプショナルは、値を持ったり持たなかったりできる変数です。 これは想像しているよりも頻繁に起こります！ アプリがインターネットにアクセスすると、期待している結果が得られるとは確信できない場合があります。 この値は常にオプショナルになります。
 
 このセクションで取り上げた概念を使用して知識をテストし、スキルを広げましょう。
 
 - callout(課題): インターネットから取得したユーザー名を使用するアプリを作成しています。
 
 1. ユーザー名がある場合はこれを表示するアプリを想像してください。 サインインしているユーザーがいない場合は、その名前を表示できます。 これにはオプショナルが適しているかもしれません。 `username`という名前の変数を定義し、`String?`型 (オプショナル) にします。
 
 2. `username`の値を出力します。 `nil`と表示されるはずです。
 
 3. `username`の値を任意の名前に設定します。
 
 4. `username`を再度出力します。 `Optional("Joe")`のように表示されます。
 
 5. `username`には値があるので`!`でアンラップできます。 強制アンラップされたユーザー名を出力します。
 
 6. 強制アンラップは良い習慣です！ 代わりにオプショナル バインディング (`if let`)で`username`を出力します。
 
 7. nil 結合演算子を使用して変数の値を`username`の値、または`username`が`nil`の場合は`"Anonymous"`に設定します。
 
 */


// ここにあなたの答えを書いてください：









/*:
 
 ## Answers
 
 */
// あなたの答えはこのように見えるはずです
/*
 var username: String?   // 1
 print(username)         // 2
 username = "Joe"        // 3
 print(username)         // 4
 print(username!)        // 5
 
 if let username = username { // 6
 print(username)
 }
 
 let message = username ?? "Anonymous" // 7
 */

 
/*:
 [次へ](@next)
 */
