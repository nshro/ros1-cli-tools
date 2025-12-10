# ros1-cli-tools
Minimal one-liner CLI tools for ROS 1 tasks — no ROS installation required.

## rosbag 専用 Docker コンテナ

rosbag（reindexを含む）専用の最小Dockerコンテナです。ROS coreやrvizなどの不要なパッケージを含まない、約200MB前後の軽量イメージです。

### ビルド

```bash
docker compose build
```

### 使い方

#### ファイルパスについて

ホスト側のファイルにアクセスするには、以下のいずれかの方法を使用してください：

1. **プロジェクトディレクトリ内のファイル**: プロジェクトディレクトリ（`./`）にファイルを配置し、ファイル名のみを指定
   ```bash
   docker compose run --rm rosbag reindex XXX.bag
   ```

2. **ホスト側のホームディレクトリ内のファイル**: `/host`プレフィックスを使用
   ```bash
   docker compose run --rm rosbag reindex /host/Downloads/XXX.bag
   ```

#### reindex 実行

```bash
# プロジェクトディレクトリ内のファイル
docker compose run --rm rosbag reindex XXX.bag

# ホスト側のホームディレクトリ内のファイル
docker compose run --rm rosbag reindex /host/Downloads/XXX.bag
```

#### その他のコマンド

```bash
# info
docker compose run --rm rosbag info XXX.bag
docker compose run --rm rosbag info /host/Downloads/XXX.bag

# fix
docker compose run --rm rosbag fix broken.bag fixed.bag
docker compose run --rm rosbag fix /host/Downloads/broken.bag /host/Downloads/fixed.bag

# help
docker compose run --rm rosbag --help
```

### 構成

- **Dockerfile**: Ubuntu 20.04 + ros-noetic-rosbag のみの最小構成
- **docker-compose.yml**: rosbagコマンドを直接実行できる設定

### ポイント

- ROS core / rviz / roscore / tf などは一切入らない
- rosbag コマンドのみ
- rosbag reindex が動くのに必要な最小依存だけ
