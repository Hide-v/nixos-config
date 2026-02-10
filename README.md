# NixOS Flake Configuration

## 项目结构

```
/home/sweet/project/nixos
├── flake.nix                    # Flake 入口文件
├── hosts/
│   └── nixos/
│       ├── default.nix           # 主机配置入口
│       ├── configuration.nix     # 系统配置
│       └── hardware-configuration.nix  # 硬件配置
└── home/
    └── sweet/
        └── default.nix           # Home Manager 配置
```

## 快速开始

### 1. 首次设置

```bash
# 进入项目目录
cd /home/sweet/project/nixos

# 锁定 Flake 依赖
nix flake lock

# 预览配置（不应用）
sudo nixos-rebuild dry-build --flake .#nixos

# 应用配置
sudo nixos-rebuild switch --flake .#nixos
```

### 2. 更新 Flake

```bash
# 更新依赖
nix flake update

# 重新构建
sudo nixos-rebuild switch --flake .#nixos
```

## 配置说明

### hosts/nixos/configuration.nix
- 系统级配置
- 用户账户
- 系统服务
- 启动加载器

### home/sweet/default.nix
- 用户级配置
- Home Manager 程序和包
- Shell 别名
- 编辑器配置

### hosts/nixos/hardware-configuration.nix
- **重要**: 需要根据实际硬件调整
- 文件系统挂载点
- 引导加载器设备
- 内核模块

## 常用命令

```bash
# 构建并切换配置
sudo nixos-rebuild switch --flake .#nixos

# 构建但不切换（用于测试）
sudo nixos-rebuild build --flake .#nixos

# 查看差异
sudo nixos-rebuild dry-build --flake .#nixos

# 回滚到上一配置
sudo nixos-rebuild rollback

# 切换到指定代次
sudo nixos-rebuild switch --rollback
```

## 添加新主机

1. 在 `hosts/` 目录下创建新主机目录
2. 在 `flake.nix` 的 `nixosConfigurations` 中添加新条目
3. 参考 `nixos` 配置进行修改

## 添加新用户

1. 在 `home/` 目录下创建用户目录
2. 添加用户配置
3. 在 `flake.nix` 中配置 `home-manager.users`

## 故障排除

### Flake 锁定问题
```bash
nix flake lock --update-input nixpkgs
```

### 构建失败
```bash
# 清理构建缓存
sudo nix-collect-garbage -d

# 重新构建
sudo nixos-rebuild switch --flake .#nixos --install
```

### Home Manager 独立使用
```bash
# 生成 Home Manager 配置
home-manager switch --flake .#nixos
```

## 参考资料

- [NixOS 官方文档](https://nixos.org/manual/nixos/stable/)
- [Home Manager 文档](https://nix-community.github.io/home-manager/)
- [Nix Flakes](https://nixos.wiki/wiki/Flakes)
