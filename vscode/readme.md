## 如何查找vscode的快捷键绑定的when
在vscode的仓库
搜索 new RawContextKey
可以查到所有的暴露出来的条件

## 如何查找vscode的快捷键绑定的command

- registerCommand
- editorCommands.ts
- coreCommand.ts    // vs/editor/browser
- export const enum TerminalCommandId
- id: '
- 这个[网页](https://gist.github.com/skfarhat/4e88ef386c93b9dceb98121d9457edbf)搜集了一些command
- 通过window的output, 设置log level 为trace, 进行动作会打印出command的id