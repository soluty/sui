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
| 删除光标前单词                                    | 是                | (ctrl+e)小左         |                |
| 删除光标后单词                                    | 是                | (ctrl+e)小右         |                |
| 删除光标前所有内容                                | 是                | (ctrl+e)大左         |                |
| 删除光标后所有内容                                | 是                | (ctrl+e)大右         |                |
| 光标左移一个单词                                  | 是                | (ctrl+e)左           |                |
| 光标右移一个单词                                  | 是                | (ctrl+e)右           |                |
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

| 功能描述                                 | 软件的类型 | 是否必须 | norman布局(rinodest)                | qwert布局      |
| --------------                           | ---------- | -------- | --------------                      | -------------- |
| 打开最常见的资源                         | all        | 是       | (leader+l)l or (leader+l)(leader+l) |                |
| 新建垂直窗口打开资源(vertical)           | all        | 是       | (leader+l)v                         |                |
| 新建水平窗口打开资源(horizontal)         | all        | 是       | (leader+l)h                         |                |
| 新建浮动窗口打开资源(float)              | all        | 是       | (leader+l)f                         |                |
| 新建窗口打开资源(可以输入要打开什么资源) | all        | 是       | (leader+l)w                         |                |
| 新建tab打开资源(可以输入要打开什么资源)  | all        | 是       | (leader+l)t                         |                |
| 刷新当前窗口(重新加载窗口)               | all        | 是       | (leader+l)r                         |                |
| 强制重新加载窗口(无需确认)               | all        | 否       | (leader+l)R                         |                |
| 重新加载配置(config)                     | all        | 是       | (leader+l)c                         |                |
| 打开命令菜单                             | all        | 是       | (leader+.)                          |                |
| 创建新的资源                             | all        | 否       | (leader+l)n(字母键)                 |                |
| 其它快捷操作(自己定义的一些操作)         | all        | 是       | (leader+l).(字母键)                 |                |
| 加载session                              | all        | 否       | (leader+l)s                         |                |


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

