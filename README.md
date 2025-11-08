# IaC-with-Terraform
## CFnとの違い  
### 1. ベンダーフリー
  - AWS以外でも使える
### 2. スタックがない
  - 一部のみ削除などが出来る
### 3. terraform fmt→validate→plan→applyの順に実行
### 4. 複数環境の構築
  - modules
  - workspaces  
    - dev,prod等に分けたいときに使う
### 5. tfstateファイルはディレクトリとは別に管理するのが基本（リソースごと消えてしまうことを防ぐためやチームで共有するため）
  - S3に保存、lock管理はDynamoDB
  
## 苦労した事
### Providerフォルダに含まれるファイルが容量オーバーでgit pushできず。→.gitignoreに書いても出来ず。→最終手段で削除してpush成功  
### 上記削除する際にgit filter-repoコマンドで行ったがChat GPTが提示したコマンドをそのまま実行したら必要なファイルがすべて消えてしまった。あとの調査によると--invert-pathsのオプションを付けなかったことが原因と判明。
