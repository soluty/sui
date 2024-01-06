# visual转换
,v           visual-block
v            visual
在v里面按v   visual-line
在v里按,v    visual-block

# 一般的操作

1. 动作
- d       delete
- c       change
- y       yank
- v       visual
- t       to
- gc      comment
- ga      align
- j/J|h/H join/unjoin
- gx      wait for swap
- zc/zo   折叠对象
- ,开头   自定义动作
- zt      trim行尾的空格

2. 范围
- i   inside
- a   around
- v   visual line
- n|j small_left
- o|l small_right
- r|k small_center

vni voa ri ra (vni)都可以省略

3. 对象
- w   word
- W   WORD
- q   quote
- b   bracket
- l|o line
- t   tag
- p   paragraph
- f   function
- e   entire
- s   search
- m   match(treesitter)
- .   空对象,一般是查询或者等待用户输入

一些例子:

gap  gcb  gml  gmf

无对象的动作  对象一般是当前的光标或者当前的文件

例如: gw, gf, gd, gr, gi, (,cr)

# 搜索和替换操作

理论上搜索和替换也可以加入, 操作范围对象的模式, 但是, 搜索的范围和其它操作的范围不太一样,
其它的操作, paragraph和function还有entire都是作为对象来看的, 而搜索和替换这3个是作为搜索的范围
来看的, 并且搜索的对象和其它操作的对象也不一样. 搜索存在file文件对象, 不存在tag对象, 因为tag通常不在一行内,
而quote和bracket有时候会在一行以内.

动作只有两个
m 搜索
M 替换

在选中状态下,m加层次, 直接会在该层搜索选中的对象

1. 搜索的范围

- s selection
- p paragraph
- f function
- e entire
- d dir
- r root
- v virtual machine
- A any 自定义层次

2. 可以被搜索的对象(可以不带)

- w word
- W WORD
- q quote
- b bracket
- l line
- f file
- c 剪切板对象(copy&paste)
- s symbol (s. sc sv ss si sp)等
- . 空对象,需要自己输入值的
- ,开头  自定义对象

# 选中一块区域的特殊操作

- ,i  copy line down
- ,I  move line down
- ,r  copy line up
- ,R  move line up


