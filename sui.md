## spaceFn接口

| 功能描述(模拟按键)   | 是否必须 | norman布局(rino dest)        | qwert布局(ikjl edsf) |
| --------------       | -------- | --------------               | --------------       |
| (up)                 | 是       | (space+r)                    | (space+i)            |
| (down)               | 是       | (space+i)                    | (space+k)            |
| (left)               | 是       | (space+n)                    | (space+j)            |
| (right)              | 是       | (space+o)                    | (space+l)            |
| (pageup)             | 是       | (space+d)                    | (space+e)            |
| (pagedown)           | 是       | (space+e)                    | (space+d)            |
| (home)               | 是       | (space+s)                    | (space+s)            |
| (end)                | 是       | (space+t)                    | (space+f)            |
| (esc)                | 是       | (capslock)                   | (capslock)           |
| (enter)              | 最好     | (space+y)                    | (space+h)            |
| (backspace)          | 最好     | (space+l)                    | (space+o)            |
| (ctrl+alt)           | 最好     | (rightctrl/menu)             | (rightctrl/menu)     |
| :    command palette | 最好     | (space+p)                    | (space+n)            |
| %    match           | 最好     | (space+m)                    | (space+m)            |
| =    gg              | 否       | (space+g)                    | (space+h)            |
| _    underline       | 否       | (space+u)                    |                      |
| +    add             | 否       | (space+a)                    |                      |
| (delete)             | 否       | (space+.)                    |                      |
| (space)              | 否       | (space+b)                    |                      |
| [    大上左边        | 否       | (space+w)                    |                      |
| {    大上右边        | 否       | (space+f)                    |                      |
| ~    c               | 否       | (space+c)                    |                      |
| `    v               | 否       | (space+v)                    |                      |
| \    硬记            | 否       | (space+,)                    |                      |
| "                    | 否       | (space+')                    |                      |
| (shift+1234567890-=) | 否       | (space+1234567890<F11><F12>) |                      |

## 鼠标模拟接口

| 功能描述         | 是否必须 | norman布局(rino dest) | qwert布局         |
| --------------   | -------- | --------------        | --------------    |
| 进入鼠标控制模式 | 是       | (ctrl+p)              | (ctrl+n)          |
| 退出鼠标控制模式 | 是       | (esc or q)            | (esc or q)        |
| 鼠标上移         | 是       | 小上                  | 小上              |
| 鼠标下移         | 是       | 小下                  | 小下              |
| 鼠标左移         | 是       | 小左                  | 小左              |
| 鼠标右移         | 是       | 小右                  | 小右              |
| 鼠标左键点击     | 是       | 大左                  | 大左              |
| 鼠标右键点击     | 是       | 大右                  | 大右              |
| 鼠标中键点击     | 是       | (大左+大右) or x      | (大左+t大右) or x |
| 鼠标滚轮上       | 是       | 大上                  | 大上              |
| 鼠标滚轮下       | 是       | 大下                  | 大下              |
| 鼠标慢速模式     | 是       | 按住Ctrl              | 按住Ctrl          |

## 备用接口(backup)

| 功能描述         | 是否必须 | norman布局     | qwert布局      |
| --------------   | -------- | -------------- | -------------- |
| 关闭当前窗口     | 是       | (ctrl+b)q      |                |
| 重新加载当前窗口 | 是       | (ctrl+b)r      |                |
| 弹出命令的菜单   | 是       | (ctrl+b).      |                |

## 直通车接口(fallthrough)

leader键

| 功能描述                                                         | 是否必须 | norman布局     | qwert布局      |
| --------------                                                   | -------- | -------------- | -------------- |
| 让当前的应用程序(短暂或者长期的)不再响应停止(leader+F)以外的按键 | 是       | (leader+f)     |                |

## 行编辑接口(edit)

| 功能描述                                          | 是否必须          | norman布局(rinodest) | qwert布局      |
| --------------                                    | --------          | --------------       | -------------- |
| 移动到行首                                        | 是                | (home)               |                |
| 移动到行尾                                        | 是                | (end)                |                |
| 在弹出的列表中上移一页                            | 是                | (pageup)             |                |
| 在弹出的列表中下移一页                            | 是                | (pagedown)           |                |
| 删除一行                                          | 是                | (ctrl+e)d            |                |
| 删除光标前单词                                    | 是                | (ctrl+e)大写小左     |                |
| 删除光标后单词                                    | 是                | (ctrl+e)大写小右     |                |
| 删除光标前所有内容                                | 是                | (ctrl+e)大左         |                |
| 删除光标后所有内容                                | 是                | (ctrl+e)大右         |                |
| 光标左移一个单词                                  | 是                | (ctrl+e)小左         |                |
| 光标右移一个单词                                  | 是                | (ctrl+e)小右         |                |
| 拷贝整行(yank)                                    | 是                | (ctrl+e)y            |                |
| 粘贴内容(paste)                                   | 是                | (ctrl+e)p            |                |
| 查找内容(find)                                    | 否(最好在shell中) | (ctrl+e)f            |                |
| 向前查找内容                                      | 否(最好在shell中) | (ctrl+e)F            |                |
| 撤销刚才的操作(undo)                              | 否(最好在shell中) | (ctrl+e)u            |                |
| 取消撤销刚才的操作                                | 否(最好在shell中) | (ctrl+e)U            |                |
| 内容补全                                          | 否                | (tab)                |                |
| 查找历史记录                                      | 否(最好在shell中) | (ctrl+e)小上         |                |
| 查找文件                                          | 否(最好在shell中) | (ctrl+e)小下         |                |
| 其它shell快捷键功能(前面全都加一个ctrl+e作为前缀) | 否(最好在shell中) | (ctrl+e)(任意键)     |                |

## 打开资源接口(launch/open)

| 功能描述                                     | 软件的类型 | 是否必须 | norman布局(rinodest)    | qwert布局      |
| --------------                               | ---------- | -------- | --------------          | -------------- |
| 打开最常见的资源                             | all        | 是       | (leader+l)l +(leader+l) |                |
| 新建垂直窗口打开资源(vertical)               | all        | 是       | (leader+l)v             |                |
| 新建水平窗口打开资源(horizontal)             | all        | 是       | (leader+l)h             |                |
| 新建浮动窗口打开资源(float)                  | all        | 是       | (leader+l)f             |                |
| 新建窗口打开资源(可以输入要打开什么资源)     | all        | 是       | (leader+l)w             |                |
| 新建tab打开资源(可以输入要打开什么资源)      | all        | 是       | (leader+l)t             |                |
| 刷新当前窗口(重新加载窗口)                   | all        | 是       | (leader+l)r             |                |
| 强制重新加载窗口(无需确认)                   | all        | 否       | (leader+l)R             |                |
| 重新加载配置(config)                         | all        | 是       | (leader+l)c             |                |
| 打开配置页面(用文本编辑器或者软件自带的设置) | all        | 是       | (leader+l)C             |                |
| 打开帮助手册页面(man)                        | all        | 是       | (leader+l)(m or ?)      |                |
| 打开命令菜单                                 | all        | 是       | (leader+.)              |                |
| 创建新的资源                                 | all        | 否       | (leader+l)n(字母键)     |                |
| 其它快捷操作(自己定义的一些操作)             | all        | 是       | (leader+l).(字母键)     |                |
| 加载session                                  | all        | 否       | (leader+l)s             |                |


## 关闭资源接口(quit)

| 功能描述                                                           | 是否必须 | norman布局(rinodest)                | qwert布局      |
| --------------                                                     | -------- | --------------                      | -------------- |
| 关闭光标所在窗口(这个最常见,所以安排一个最容易按的)                | 是       | (leader+q)q or (leader+q)(leader+q) |                |
| 关闭光标所在窗口                                                   | 是       | (leader+q)w                         |                |
| 关闭光标所在 tab                                                   | 是       | (leader+q)t                         |                |
| 关闭除了光标所在的窗口以外的窗口(only)                             | 是       | (leader+q)o                         |                |
| 关闭除了光标所在的 tab 以外的 tab (only第二个字符)                 | 是       | (leader+q)n                         |                |
| 关闭所有,退出程序                                                  | 是       | (leader+q)a                         |                |
| 和对应的小写字母的功能一样, 只不过即使后台有未完成的工作也不用确认 | 是       | (leader+q)(QWTONA)                  |                |
| 可搜索的关闭窗口                                                   | 是       | (leader+q).                         |                |

## 切换已经打开的资源的接口


| 功能描述                                                                  | 是否必须 | norman布局(rinodest)           | qwert布局      |
| --------------                                                            | -------- | --------------                 | -------------- |
| 焦点移动到上边窗口(有些情况切换窗口无法用leader键做到,比如vscode中有时候) | 是       | (leader+小上) or (shift+上)    |                |
| 焦点移动到下边窗口                                                        | 是       | (leader+小下) or (shift+下)    |                |
| 焦点移动到左边窗口                                                        | 是       | (leader+小左) or (shift+左)    |                |
| 焦点移动到右边窗口                                                        | 是       | (leader+小右) or (shift+右)    |                |
| 焦点移动到上边(浮动窗口)                                                  | 是       | (leader+上)                    |                |
| 焦点移动到下边(平铺窗口)                                                  | 是       | (leader+下)                    |                |
| 焦点移动到左边tab                                                         | 是       | (leader+左)                    |                |
| 焦点移动到右边tab                                                         | 是       | (leader+右)                    |                |
| 弹出所有tab的列表                                                         | 是       | (leader+t).                    |                |
| 访问特定名字的tab                                                         | 是       | (leader+t)(字母键)             |                |
| 访问特定编号的tab                                                         | 是       | (leader+t)(数字键,0代表最后的) |                |
| 弹出所有window的列表(当前tab或者所有tab这个看自己兴趣和不同的软件不同)    | 是       | (leader+w).                    |                |
| 访问特定名字的window                                                      | 是       | (leader+w)(字母键)             |                |

## 拷贝粘贴资源接口

| 功能描述                   | 软件类型   | 是否必须 | norman布局(rinodest) | qwert布局      |
| --------------             | --------   | -------- | --------------       | -------------- |
| 开启拷贝资源模式           | all        | 是       | (leader+y)           |                |
| 粘贴刚刚拷贝的资源         | all        | 是       | (leader+p)           |                |
| 资源的名字                 | all        | 是       | (leader+y)n          |                |
| 资源的全路径               | all        | 是       | (leader+y)N          |                |
| 资源的其它信息             | all        | 是       | (leader+y)i          |                |
| 你最常见的应用场景         | 窗口管理器 | 否       | (ctrl+y)y            |                |
| 截图(矩形)rectangle        | 窗口管理器 | 是       | (ctrl+y)r            |                |
| 截图(窗口)                 | 窗口管理器 | 是       | (ctrl+y)w            |                |
| 截图(选择窗口)             | 窗口管理器 | 是       | (ctrl+y)W            |                |
| 截图(屏幕)all              | 窗口管理器 | 是       | (ctrl+y)a            |                |
| 截图(鼠标画出任意区域)     | 窗口管理器 | 是       | (ctrl+y).            |                |
| 截图(长截图)long           | 窗口管理器 | 否       | (ctrl+y)l            |                |
| 截图(gif)                  | 窗口管理器 | 否       | (ctrl+y)g            |                |
| 录制视频(video)            | 窗口管理器 | 否       | (ctrl+y)v            |                |
| 窗口所属的exe名字(name)    | 窗口管理器 | 否       | (ctrl+y)n            |                |
| 窗口所属的exe路径(Name)    | 窗口管理器 | 否       | (ctrl+y)N            |                |
| 窗口的所有信息(info)       | 窗口管理器 | 否       | (ctrl+y)i            |                |
| 文字ocr识别(text)          | 窗口管理器 | 否       | (ctrl+y)pt           |                |
| 拷贝成文件到临时目录(file) | 窗口管理器 | 否       | (ctrl+y)pf           |                |

## goto接口

goto一般是直达特定的资源,那些资源可以没有打开,用当前的窗口把它打开并呈现出来

| 功能描述                 | 软件类型 | 是否必须 | norman布局(rinodest)           | qwert布局      |
| --------------           | -------- | -------- | --------------                 | -------------- |
| 焦点移动到上一个历史位置 | all      | 是       | (leader+g)小左                 |                |
| 焦点移动到下一个历史位置 | all      | 是       | (leader+g)小右                 |                |
| 搜索历史焦点位置         | all      | 是       | (leader+g).                    |                |
| 焦点移动到自定义的位置   | all      | 是       | (leader+g)(t 或者不按t )(字母) |                |

## 窗口和tab的size接口

在文件编辑器中, 如果需要, 可以用 leader+S, 或者干脆不要这个功能

| 功能描述                       | 软件类型 | 是否必须 | norman布局(rinodest) | qwert布局      |
| --------------                 | -------- | -------- | --------------       | -------------- |
| 修改窗口大小(上移变大)         | all      | 是       | (leader+s)小上       |                |
| 修改窗口大小(下移变小)         | all      | 是       | (leader+s)小下       |                |
| 修改窗口大小(左移变小)         | all      | 是       | (leader+s)小左       |                |
| 修改窗口大小(右移变大)         | all      | 是       | (leader+s)小右       |                |
| 修改窗口大小(最大化)(maxmize)  | all      | 是       | (leader+s)m          |                |
| 修改窗口大小(占满)(zenmode)    | all      | 是       | (leader+s)z          |                |
| 修改窗口大小(最小化)(hidden)   | all      | 是       | (leader+s)h          |                |
| 修改窗口名字                   | all      | 否       | (leader+s)w          |                |
| 修改tab名字                    | all      | 否       | (leader+s)t          |                |
| 常用的修改大小(大) 字体,声音等 | all      | 否       | (leader+s)u          |                |
| 常用的修改大小(小)             | all      | 否       | (leader+s)d          |                |
| 常用的修改大小(设置回来)       | all      | 否       | (leader+s)s          |                |

## 窗口的move接口

| 功能描述                       | 软件类型 | 是否必须 | norman布局(rinodest) | qwert布局      |
| --------------                 | -------- | -------- | --------------       | -------------- |
| 修改窗口位置(上移)             | all      | 是       | (leader+m)小上       |                |
| 修改窗口位置(下移)             | all      | 是       | (leader+m)小下       |                |
| 修改窗口位置(左移)             | all      | 是       | (leader+m)小左       |                |
| 修改窗口位置(右移)             | all      | 是       | (leader+m)小右       |                |
| 修改tab位置(左移)              | all      | 是       | (leader+m)左         |                |
| 修改tab位置(右移)              | all      | 是       | (leader+m)右         |                |
| 切换窗口浮动状态               | all      | 是       | (leader+m)f          |                |
| 强制窗口浮动                   | all      | 是       | (leader+m)F          |                |

## 窗口在tab中移动的接口arrive

| 功能描述                                 | 软件类型 | 是否必须 | norman布局(rinodest)   | qwert布局      |
| --------------                           | -------- | -------- | --------------         | -------------- |
| 窗口移动到特定tab(左边的tab)             | all      | 是       | (leader+a)左           |                |
| 窗口移动到特定tab(右边的tab)             | all      | 是       | (leader+a)右           |                |
| 窗口移动到特定tab并且焦点不变(左边的tab) | all      | 是       | (leader+a)(home)       |                |
| 窗口移动到特定tab并且焦点不变(右边的tab) | all      | 是       | (leader+a)(end)        |                |
| 窗口移动到特定tab(按tab名字)             | all      | 是       | (leader+a)(字母键)     |                |
| 窗口移动到特定tab并且焦点不变(按tab名字) | all      | 是       | (leader+a)(大写字母键) |                |
| 窗口移动到特定tab(按tab编号)             | all      | 是       | (leader+a)(数字键)     |                |
| 窗口移动到tab(通过查找tab名字)           | all      | 是       | (leader+a).            |                |


## 文本编辑器接口

### 文本编辑器接口之编辑篇

编辑的接口有很多, 总体来说, 主要的目的是快速查找,或者选取到所需要的文本.然后对文本进行一些操作.
dw  是   动作+对象  (省略范围是对象的默认范围)
daw 是   动作+范围+对象
vawy 是  选择对象 + 动作 (等价于daw)

0. sui中在选中一段文本以后光标可以进行的操作.

alt+小上,alt+小下 行列的选择切换.
alt+小左,alt+小右 选中状态中光标位置的切换.
在选中的状态中, 移动的命令和选择的命令一样, 移动到哪里, 就选择到哪里.

1. 需要对对象进行的操作

| 描述            | 对应字母                |
| --------------  | --------------          |
| 跳转(to)        | t                       |
| 选择(visual)    | v                       |
| 删除(delete)    | d                       |
| 复制(yank)      | y                       |
| 注释(comment)   | gc                      |
| 对齐(align)     | ga                      |
| 其它操作(other) | z()或者co()             |

ga, gs, gu, gU

2. sui中常见的对象

| 描述               | 对应字母 |
| --------------     | -------- |
| word               | w        |
| Word               | W        |
| line               | l        |
| paragragh          | p        |
| 引号               | q        |
| 括号               | b        |
| tag                | t        |
| (整个文档)(entire) | e        |
| function           | f        |
| search             | s        |
| treesitter         | m        |

3. sui中对象的范围

| 描述           | 对应字母 |
| -------------- | -------- |
| 左边           | 小左     |
| 右边           | 小右     |
| 两边   round   | 小上/小下|
| 对象所在的行   | v        |
| 内部   in      | i        |
| 外部   all     | a        |

sui中的重复操作  leader+.

### 文本编辑器接口之查找/替换篇

leader+m 作为查找的起手势,  然后加上范围, 最后是(对象范围+对象)
范围可以省略(省略范围是你用的最经常的范围).
leader+mr 作为替换的起手势(replace)

1. 查找的范围层级

| 描述                      | 对应字母 |
| --------------            | -------- |
| 关标选中的范围(selection) | s        |
| 当前的函数(function)      | f        |
| 段落(paragragh)           | p        |
| 当前文件(entirefile)      | e        |
| 当前目录(dir)             | d        |
| 当前工程(root)            | r        |
| 整个电脑(vm)              | v        |

2. 查找的对象(范围)

| 描述                      | 对应字母 |
| --------------            | -------- |
| 光标所在单词              | w        |
| 光标所在大单词            | W        |
| 引号内容                  | q        |
| 括号内容                  | b        |
| 行内内容(不知道查什么)    | l        |
| 符号(symbol)(func, const) | s        |
| 文件(file)                | f        |
| other                     | o(字母)  |
### 文本编辑器接口之跳转篇

| 描述                       | 快捷键   |
| --------------             | -------- |
| 你最常用的操作             | gg       |
| 历史记录前一个             | g小左    |
| 历史记录后一个             | g小右    |
| 搜索历史记录               | g.       |
| 跳转到定义(defination)     | gd       |
| 跳转到引用(reference)      | gr       |
| 跳转到实现(implementation) | gi       |
| 跳转到接口(interface)      | gI       |

### 文本编辑器接口之对code的操作

| 描述                          | 快捷键   |
| --------------                | -------- |
| 对code的建议操作(code action) | ca       |
| 格式化(code format)           | cf       |
| 重命名(code rename)           | cr       |
| 抽取方法(extract method)      | ce       |

