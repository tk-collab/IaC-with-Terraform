# IaC-with-Terraform
## CFnとの違い  
### 1. ベンダーフリー
  - AWS以外でも使える
### 2. スタックがない
  - なのでリソース削除するときはひと手間必要
### 3. terraform fmt→validate→plan→applyの順に実行
### 4. 複数環境の構築
  - modules
  - workspaces
### 5. tfstateファイルはディレクトリとは別に管理するのが基本（リソースごと消えてしまうことを防ぐためやチームで共有するため）
