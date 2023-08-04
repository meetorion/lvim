# My Lunarvim Config

## 安装说明
- 备份原lvim配置文件
```
mv ~/.config/lvim ~/.config/lvim.bak
```
- clone本仓库的lvim配置文件
```
git clone https://github.com/meetorion/lvim.git
```
## 功能说明

### C++ Debugging
- 安装cpptools
```
:MasonInstll cpptools
```
- 添加-g选项来生成调试信息(必须添加-g)
```
g++ -g main.cpp -o main
```

### Go
```
:MasonInstall gopls golangci-lint-langserver delve goimports gofumpt gomodifytags gotests impl
```



