# emacs的主要快捷键
　　C-f 前进一个字符
　　C-b 后退一个字符
　　C-p 上一行
　　C-n 下一行
　　M-f 前进一个单词
　　M-b 后退一个单词
　　C-a 行首
　　C-e 行尾
　　C-v 下翻一页
　　M-v 上翻一页
　　M-< 文件头
　　M-> 文件尾

可以看到, emacs主要的光标操作,用到了大量的ctrl或者alt键, 是通过联想单词来实现的.
语义的联想(让其它键盘布局的人很难适应)
快捷键容易冲突.

# vim的快捷键

模式
怎么生成一个随机字符串       把vim打开,让新手退出vim
只定义了文本编辑领域, 对窗口的管理未涉及, 而且有些快捷键逻辑不一致.
例如undo, redo  u是undo, U是undo-all, ctrl-r是redo, 为啥redo不是r呢?
<ctrl+o>是goto last, <tab>是go回来 <ctrl+i> 
hjkl只能用于标准布局,要用于其它布局, 则很麻烦, 如果映射成其它布局的类似键, 则其它接口需要对应调整会丧失语义
 
# sui的快捷键
- spaceFn解决上下左右, Home,End,PageUp,PageDown的问题
- 定义了一套增删改查接口,不管是模式编辑器还是非模式编辑器都可以使用,甚至其它软件也可以使用
- 补充了vim的对象范围, 增加对象左边, 对象右边, 对象两边的范围.
- 优化了vim中逻辑不太好的部分
- 分层解决了快捷键冲突的问题
C:\Users\soluty\vm\exports\sui\why not emacs and vim.md
file:///C:/Users/soluty/vm/config/surfingkeys/setting.js
file:///C:/Users/soluty/vm/exports/sui/surfingkeys/index.js