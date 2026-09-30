# Neovim + Apache Artemis 学习指南

这套配置以 LazyVim 为底座，`<leader>` 表示空格键。遇到忘记的快捷键，先按空格并停一下，WhichKey 会显示可用操作。

## 0. 打开与退出

在新的 Windows Terminal 中运行：

```powershell
nvim
```

打开一个已经确认身份正确的项目：

```powershell
cd D:\Github\artemis
git remote -v
nvim .
```

在本地 Apache Artemis 尚未替换当前 Google Artemis checkout 前，不要在这个目录运行 Java 构建。

退出与保存：

| 按键 | 作用 |
| --- | --- |
| `Esc` | 返回普通模式 |
| `:w` | 保存 |
| `:q` | 关闭当前窗口 |
| `:wq` | 保存并退出 |
| `:qa` | 退出全部 |
| `:qa!` | 放弃未保存修改并退出全部，谨慎使用 |

## 1. 第一周只记这些 Vim 基础

### 模式

| 按键 | 作用 |
| --- | --- |
| `i` | 在光标前进入插入模式 |
| `a` | 在光标后进入插入模式 |
| `o` | 下一行新建并进入插入模式 |
| `v` | 字符可视选择 |
| `V` | 整行选择 |
| `Esc` | 回到普通模式 |

### 移动

| 按键 | 作用 |
| --- | --- |
| `h j k l` | 左、下、上、右 |
| `w / b` | 下一个词 / 上一个词 |
| `0 / $` | 行首 / 行尾 |
| `gg / G` | 文件开头 / 文件结尾 |
| `{ / }` | 上一段 / 下一段 |
| `%` | 配对括号之间跳转 |
| `f字符` | 跳到本行下一个字符 |
| `/文本` | 文件内搜索；`n/N` 切换结果 |

### 修改

| 按键 | 作用 |
| --- | --- |
| `x` | 删除一个字符 |
| `dd` | 删除一行 |
| `yy` | 复制一行 |
| `p` | 粘贴 |
| `u` | 撤销 |
| `Ctrl-r` | 重做 |
| `ciw` | 修改当前单词 |
| `di(` | 删除括号内部内容 |
| `.` | 重复上一次修改 |

先运行 `:Tutor`，每天练 15 分钟；不要第一天强迫自己完全不用方向键。

## 2. 找文件、找代码、切窗口

| 按键 | 作用 |
| --- | --- |
| `Space Space` | 按名称找项目文件 |
| `Space /` | 全项目搜索文本 |
| `Space e` | 打开/关闭文件树 |
| `Space s g` | 全项目 grep |
| `Space s s` | 当前文件符号 |
| `Space s S` | 工作区符号 |
| `H / L` | 上一个 / 下一个缓冲区 |
| `Space b d` | 关闭当前缓冲区 |
| `Ctrl-w h/j/k/l` | 在分屏之间移动 |
| `Ctrl-/` | 打开/关闭终端 |
| `Space g g` | 打开 LazyGit |

提示：`Space` 后停顿即可看提示，不必死记完整表格。

## 3. Java 源码阅读

把光标放在类、方法或字段上：

| 按键 | 作用 |
| --- | --- |
| `gd` | 跳到定义 |
| `gr` | 查找引用 |
| `gI` | 跳到实现 |
| `gy` | 跳到类型定义 |
| `K` | 显示类型/Javadoc |
| `Ctrl-o` | 返回上一个位置 |
| `Ctrl-i` | 前进到下一个位置 |
| `[d / ]d` | 上一个 / 下一个诊断 |
| `Space c a` | Code Action |
| `Space c r` | 重命名符号 |
| `Space c o` | Java 整理 imports |
| `Space j h` | 检查 LSP 健康状态 |

打开 Java 文件后，等待右下角索引完成。用 `:LspInfo` 检查 `jdtls` 是否已附加。

## 4. 测试与调试

Java 文件中：

| 按键 | 作用 |
| --- | --- |
| `Space t r` | 运行光标附近的测试方法 |
| `Space t t` | 运行当前测试类 |
| `Space t T` | 选择一个 Java 测试运行 |
| `F9` | 设置/取消断点 |
| `F5` | 开始或继续调试 |
| `F10` | 单步越过 |
| `F11` | 单步进入 |
| `Shift-F11` | 单步跳出 |
| `Space d u` | 打开/关闭调试界面 |

第一次不要直接调试整个 Artemis。只调试一个测试方法。

## 5. Artemis 源码学习路线

### 阶段一：只理解测试故事

打开：

```text
artemis-cli/src/test/java/org/apache/activemq/cli/test/MessageSerializerTest.java
```

找到 `testTextMessageImportExport`，只回答：

1. 消息在哪里创建？
2. 消息发送到了哪个 Destination？
3. 谁把消息导出到 XML？
4. 谁把 XML 导回 Broker？
5. 最后验证了什么？

建议操作：

```text
/testTextMessageImportExport
gd
Ctrl-o
gr
K
```

### 阶段二：顺着调用链阅读

按顺序打开：

```text
MessageSerializerTest
Consumer
MessageSerializer
XMLMessageSerializer
Producer
DestAbstract
CliTestBase
```

每读一个文件，只记录三件事：输入是什么、输出是什么、它创建了哪些需要释放的资源。

### 阶段三：跟一次调试

在这些位置设置断点：

```text
MessageSerializerTest.importMessages
Producer.execute
XMLMessageSerializer.setInput
XMLMessageSerializer.start
XMLMessageSerializer.read
XMLMessageSerializer.stop
```

此时目标不是修复，而是画出真实调用顺序，并观察 `InputStream`、serializer、Session 和 JMS Producer 的生命周期。

### 阶段四：再读 ARTEMIS-6233

只有当你能用自己的话讲清“十条消息如何导出成 XML，又如何导回 Broker”，才开始回答：

```text
Windows 在哪里失败？
谁创建了文件流？
谁承诺关闭它？
正常路径和异常路径分别如何清理？
```

在此之前，不修改生产代码，也不认领 JIRA。

## 6. 健康检查和维护

| 命令 | 作用 |
| --- | --- |
| `:Lazy` | 查看和更新插件 |
| `:Mason` | 查看 JDT LS、调试器和测试适配器 |
| `:LazyHealth` | 检查 LazyVim 环境 |
| `:checkhealth` | Neovim 总体健康检查 |
| `:LspInfo` | 当前语言服务器状态 |

配置目录：

```powershell
$env:LOCALAPPDATA\nvim
```

JDK 17 被保留；Neovim 内部使用 JDK 25，并能让 JDT LS 识别 Java 17 与 Java 25。Maven 只注入 Neovim 进程，不改变其他项目的全局 Java 环境。
