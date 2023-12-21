Shortcut User Interface    SUI
Command Line Interface     CLI  ShortCut
Graphic User Interface     GUI  
Terminal User Interface    TUI
Touch,   
API, SDk, Http, Api
Prompt ChatUi

learn once, use everywhere.

一套"通用"的跨操作系统的快捷键操作电脑的接口, 主要应用场景是写代码, 也包含其它场景

## 键盘语言的进化

- 上下左右, PageUp, PageDown, Home, End
- tab, alt
- vim  hjkl  rino
- sui  分层


## 面向人群
- 在windows上希望用快捷键提高工作效率的
- 双手不愿意离开主键盘的
- 有鼠标手等疾病,希望尽可能少或者不使用鼠标就能完成绝大部分电脑上工作的
- 觉得全键盘操作很酷,希望用来装b的

## 为什么要使用sui

- ctrl+alt+shift+win+meta+super + a
- 快捷键容易冲突(对比鼠标)
- 每个软件快捷键的逻辑都不一样

## 设计目标
- 使用最通用的ansi键盘
- 跨操作系统, 跨机器
- 解决快捷键冲突问题, 包括和远程机器上的冲突
- 易于记忆,易于学习

## 名词解释
资源              软件所管理内容的最小单元
window(窗口)      屏幕上的一块地方,进行操作的最小单元   pane
tab(标签)         window的集合                          workspace
session(持久化)   tab和window的集合                     layout

## 软件分类

| 软件类型                                       | 功能键         |
| --------------                                 | -------------- |
| 窗口管理器 i3wm                                | ctrl           |
| gui中普通软件(除了有vim模式的文本编辑器)       | alt            |
| 可以连接ssh管理终端的软件(主要包括终端,浏览器) | ctrl+alt       |
| 终端多路复用器(cli)  tmux, screen, zellij      | alt            |
| cli中普通软件                                  | ,或者无功能键  |
| vim模式的文本编辑器                            | ,              |

## 按键介绍和联想

| 按键意义              | norman              | 联想        | qwerty | 联想        |
| --------------        | ------              | -------     | ------ | ------      |
| 不用                  | hjk                 |             | typ    |             |
| 保留原有意义          | zxcv                | cv大法      | zxcv   | cv大法      |
r| 小上 小下 小左 小右   | rino                | 右手        | ikjl   | 右手        |
| 大上 大下 大左 大右   | dest                | 左手        | edsf   | 左手        |
| 编辑                  | e                   | edit        | e      | edit        |
| 新增                  | l                   | launch      | o      | open        |
| 删, 退, 叉掉          | q/x/esc             | quit, x掉   | q      | quit, x掉   |
| 改(大小), 搜索        | s                   | size,search | s      | size,search |
| 改(位置)/移动         | m                   | move        | m      | move        |
| 改(把window移动到tab) | a                   | arrive      | a      | arrive      |
| 复制                  | y                   | yank        | y      | yank        |
| 查(到某些特定的位置)  | g                   | goto        | g      | goto        |
| 查tab                 | t                   | tab         | f      | find tab    |
| 查window              | w                   | window      | w      | window      |
| 进入鼠标模式          | p                   | 硬记        | n      | 硬记        |
| 备用的操作            | b                   | backup      | b      | backup      |
| 直通车                | f                   | fallthrough | r      | retain      |
| 辅助上下              | ud                  | up down     | ud     | ud          |
| 任意键,查找按键       | .                   | 正则        | .      | 正则        |
| leader键              | , ctrl ctrl+alt alt |             |        |             |

