在vscode的仓库
搜索 new RawContextKey
可以查到所有的暴露出来的条件

n o r i a
j l k i a

// 查找命令
registerCommand
editorCommands.ts
coreCommand.ts    // vs/editor/browser
export const enum TerminalCommandId
id: '
设置快捷键 a a

https://gist.github.com/skfarhat/4e88ef386c93b9dceb98121d9457edbf

https://github.com/metaseed/metaGo/issues/112

When a keydown is not matched by any keybinding rule, it might produce a character. This is dispatched to the type command.
It is, therefore, possible for an extension to overwrite the type command and handle characters instead of the VS Code editor.
There is a default:type command that maps to the VS Code editor's type handler in case an extension wishes to delegate back typing to VS Code.

*v_META* *v_ALT*
		ALT (|META|) may act like <Esc> if the chord is not mapped.
		For example <A-x> acts like <Esc>x if <A-x> does not have a
		visual-mode mapping.

metaGo.addCursorSmart

  //// 
  {
    "key": "alt+s",
    "command": "metaGo.gotoSmartActive",
    "when": "editorTextFocus",
  },
  {
    "key": "alt+v s",
  "command": "metaGo.selectSmart",
    "when": "editorTextFocus",
  },
  {
    "key": "alt+y",
    "command": "editor.action.clipboardCopyAction",
    "when": "editorHasSelection && editorTextFocus",
  },
  {
    "key": "alt+y p",
    "command": "editor.action.clipboardPasteAction",
    "when": "editorTextFocus",
  },
  {
    "key": "alt+y w",
    "command": "extension.multiCommand.execute",
    "args": {
      "sequence": [
        "cursorWordLeft",
        "cursorWordEndRightSelect",
        "editor.action.clipboardCopyAction",
        "cursorWordLeft",
      ],
    },
    "when": "editorTextFocus && !editorHasSelection",
  },
  {
    "key": "alt+d s",
    "command": "metaGo.metaJump.deleteToSmart",
  },
  {
    "key": "alt+l alt+l",
    "command": "metaGo.gotoSmartActive",
    // "command": "metaGo.selectSmart",
    // "command": "metaGo.selectSmart",
  },
  // {
  //   "key": "alt+y w",
  //   "command": ["cursorWordLeft", "cursorWordEndRightSelect" ],
  //   "when": "editorTextFocus"
  // },
  {
    "key": "alt+v b",
    "command": "editor.action.selectToBracket",
  },
  {
    "key": "alt+l n f",
    "command": "explorer.newFile"
  },
  {
    "key": "alt+l n d",
    "command": "explorer.newFolder"
  },
  {
    "key": "alt+shift+s .",
    "command": "workbench.action.quickOpen",
  },
  {
    "key": "alt+m f",
    "command": "workbench.action.quickOpen",
    "args": "",
  },
  {
    "key": "alt+m l",
    "command": "workbench.action.findInFiles",
    "args": {
      "query": "",
      "isRegex": true,
      "filesToInclude": "${fileDirname}/**",
      "filesToExclude": "*.exe,*.zip,*.msi,*.appimage,*.meta",
    },
  },
  {
    "key": "alt+m w",
    "command": "workbench.action.findInFiles",
    "args": {
      "isRegex": true,
      "filesToInclude": "${fileDirname}/**",
      "filesToExclude": "*.exe,*.zip,*.msi,*.appimage,*.meta",
    },
  },
  {
    "key": "alt+m r f",
    "command": "workbench.action.quickOpen",
    "args": "",
    "when": "editorTextFocus && vim.active && vim.mode == 'Normal' || vim.mode == 'Visual'",
  },
  {
    "key": "alt+m r l",
    "command": "workbench.action.findInFiles",
    "args": {
      "query": "",
      "isRegex": true,
      "filesToInclude": "",
      "filesToExclude": "*.exe,*.zip,*.msi,*.appimage,*.meta",
    },
    "when": "editorTextFocus && vim.active && vim.mode == 'Normal' || vim.mode == 'Visual'",
  },
  {
    "key": "alt+m r w",
    "command": "workbench.action.findInFiles",
    "args": {
      "isRegex": true,
      "filesToInclude": "",
      "filesToExclude": "*.exe,*.zip,*.msi,*.appimage,*.meta",
    },
    "when": "editorTextFocus && vim.active && vim.mode == 'Normal' || vim.mode == 'Visual'",
  },


export const enum Parts {
	TITLEBAR_PART = 'workbench.parts.titlebar',
	BANNER_PART = 'workbench.parts.banner',
	ACTIVITYBAR_PART = 'workbench.parts.activitybar',
	SIDEBAR_PART = 'workbench.parts.sidebar',
	PANEL_PART = 'workbench.parts.panel',
	AUXILIARYBAR_PART = 'workbench.parts.auxiliarybar',
	EDITOR_PART = 'workbench.parts.editor',
	STATUSBAR_PART = 'workbench.parts.statusbar'
}
