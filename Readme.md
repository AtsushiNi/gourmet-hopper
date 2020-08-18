# アプリケーション利用ガイド


## アプリケーション実行
 - ソースコードを作成したら、ビルド、アプリケーションサーバへの配置が必要
 - Command(左上の「>I-」のようなマーク)から「App Deploy」をクリック
 - 右上の「RUN」→「dev-machine」をクリックし、「BUILD SUCCESSFUL」が出ればOK
 
## DB接続
 - Command(左上の「>I-」のようなマーク)から「Connect Database」をクリック
 - 右上の「RUN」→「dev-machine」をクリックし、Successが出ればOK
 - 既に実行済みの場合失敗する

## DB,テーブル作成,データ挿入
 - 画面下の「Machines」→「db」を右クリックし、「Terminal」を選択
 - Terminalが表示されたら、以下実行しMysqlに接続
   mysql -uroot -ppassword
 - java_training_ddl.sqlの全文をコピーし、ターミナルに貼り付けて実行

## アプリケーションログの確認
 - 画面下の「Machines」→「dev-machine」を右クリックし、「Terminal」を選択
 - Terminalが表示されたら、以下実行。ログをリアルタイムで出力してくれる
 - tail -f /opt/payara5/glassfish/domains/domain1/logs/server.log
 - 抜けたい場合はCtrl+Cをおす


## 本アプリケーションの注意事項

 - ユーザパスワードの制約
    - ユーザパスワードに簡単な文字列を設定すると、GoogleChrome側で脆弱性のあるパスワードと認識されてしまい「パスワードが漏洩されました」というポップアップが出力される
    - その後他の画面に遷移すると「セッションが切断されました」となりログイン画面に戻されてしまう
    - 対応方法としては、複雑なパスワードにするか、GoogleChromeのシークレットウインドウでアプリケーションを実行することで回避できる

 - フォームに入力可能な文字列
    - APサーバの設定上、入力フォームに日本語を入れようとすると文字化けしてしまう(書籍情報入力部分)
    - 入力フォームには英数字のみ入力をお願いします
  