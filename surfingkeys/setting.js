// basic
map('<ArrowUp>', 'k')
map('<ArrowDown>', 'j')
map('<ArrowLeft>', 'h')
map('<ArrowRight>', 'l')
vmap('<ArrowUp>', 'k')
vmap('<ArrowDown>', 'j')
vmap('<ArrowLeft>', 'h')
vmap('<ArrowRight>', 'l')
vmap('<Home>', "0")
vmap('<End>', "$")

map('r', 'e')
map('i', 'd')
mapkey('e', '', function() { })
mapkey('d', '', function() { })

// edit line interface
iunmap('<Ctrl-e>')
imap('<Ctrl-e>n', '<Alt-w>')
imap('<Ctrl-e>o', '<Alt-d>')
imap('<Ctrl-e><ArrowRight>', '<Alt-f>')
imap('<Ctrl-e><ArrowLeft>', '<Alt-b>')
imap('<Ctrl-e>s', '<Ctrl-u>')
imapkey('<Ctrl-e>d', 'Delete a line', function() {
  var element = getRealEdit();
  element.value = ''
})
imapkey('<Ctrl-e>p', 'paste', function() {
  var element = getRealEdit();
  navigator.clipboard.readText().then(function(text) {
    var clipboardContent = text;
    element.value += clipboardContent
  })
})
imapkey('<Ctrl-e>t', 'Delete to line end', function() {
  var element = getRealEdit();
  if (element.setSelectionRange !== undefined) {
    element.value = element.value.substr(0, element.selectionStart);
    element.setSelectionRange(element.value.length, element.value.length)
  } else {
    var selection = document.getSelection();
    selection.focusNode.data = selection.focusNode.data.substr(0, selection.focusOffset);
    selection.focusOffset = selection.focusNode.data.length()
  }
})

// interface launch
mapkey('<Alt-l>v', '', notImplemented)
mapkey('<Alt-l>h', '', notImplemented)
mapkey('<Alt-l>f', '', notImplemented)
mapkey('<Alt-l>w', '', notImplemented)
mapkey('<Alt-l>R', "reload path", function() {
  RUNTIME("reloadTab", { nocache: true });
})
mapkey('<Alt-l>r', "reload path", function() {
  RUNTIME("reloadTab", { nocache: true });
})
mapkey('<Alt-l>c', "reload path", function() {
  RUNTIME("reloadTab", { nocache: true });
})
mapkey('<Alt-l>s', '', notImplemented)
mapkey('<Alt-l>S', '', notImplemented)
mapkey('<Alt-l>t', "open url", function() {
  tabOpenLink("chrome://newtab");
})
mapkey('<Alt-l>l', '', function() {
  Front.showEditor('', function(data) {
    tabOpenLink(data);
  }, 'url')
})
map('<Alt-l>.', ':')
map('h', '?')
// interface quit
mapkey('<Alt-q>q', "close current tab", function() {
  RUNTIME("closeTab")
})
mapkey('<Alt-q>w', "close current tab", function() {
  RUNTIME("closeTab")
})
mapkey('<Alt-q>t', "close current tab", function() {
  RUNTIME("closeTab")
})
map('<Alt-q>o', "gxx")
map('<Alt-q>l', "gxx")
mapkey('<Alt-l>a', '', notImplemented)
map('<Alt-f>', '<Alt-s>')
unmap('<Alt-s>')

// interface resize
map('<Alt-s>t', ";U")
map('<Alt-s>w', ";U")
var isFull = false
document.addEventListener("fullscreenchange", function() {
  isFull = !isFull
})
// todo 全屏的时候Esc直接退出全屏,很烦,暂时不支持, 用F11先
function toggleFullScreen() {
  Front.showBanner('not implemented')
  // var el = document.documentElement;
  // if(isFull){
  //   el.exitFullscreen()
  // } else {
  //   el.requestFullscreen()
  // }
}
mapkey('<Alt-s>z', "", function() {
  toggleFullScreen()
})
mapkey('<Alt-s>m', '', toggleFullScreen)
mapkey('<Alt-s>f', '', notImplemented)
mapkey('<Alt-s>h', '', notImplemented)
mapkey('<Alt-s>r', '', notImplemented)
mapkey('<Alt-s>i', '', notImplemented)
mapkey('<Alt-s>n', '', notImplemented)
mapkey('<Alt-s>o', '', notImplemented)
mapkey('<Alt-s>.', '', notImplemented)

// interface focus
map('<Alt-g>n', "S")
map('<Alt-g>o', "D")
map('gn', "S")
map('go', "D")
map('<Alt-g>.', "oh")
map('g.', "oh")
map('<Alt-n>', 'E')
map('<Alt-o>', 'R')
settings.omnibarMaxResults = 15
settings.omnibarHistoryCacheSize = 10000
map('<Alt-ArrowLeft>', 'E')
map('<Alt-ArrowRight>', 'R')
cmap('<ArrowLeft>', '<Ctrl-,>')
cmap('<ArrowRight>', '<Ctrl-.>')
cmap('<Home>', '<Ctrl-,>')
cmap('<End>', '<Ctrl-.>')
cmap('<PageUp>', '<Ctrl-,>')
cmap('<PageDown>', '<Ctrl-.>')
unmap('gt')
mapkey('gtv', 'changeToVscodeUrl', function() {
  tabOpenLink("https://vscode.dev/" + window.location.href)
})
mapkey('gtV', 'changeToVscodeUrl in current tab', function() {
  window.location.href = "https://vscode.dev/" + window.location.href
})

// interface find
map('<Alt-t>.', 'T')
map('<Alt-w>.', 'T')

// interface move
mapkey('<Alt-a>.', '', notImplemented)
unmap('<Alt-m>')
map('<Alt-m>n', "<<")
map('<Alt-m>o', ">>")
mapkey('<Alt-m>r', '', notImplemented)
mapkey('<Alt-m>i', '', notImplemented)
mapkey('<Alt-m>f', '', notImplemented)
map('<Alt-m>s', "<<")
map('<Alt-m>t', ">>")
map('<Alt-m><ArrowLeft>', '<<')
map('<Alt-m><ArrowRight>', '>>')

function getRealEdit(event) {
  var rt = event ? event.target : document.activeElement;
  // on some pages like chrome://history/, input is in shadowRoot of several other recursive shadowRoots.
  while (rt && rt.shadowRoot) {
    if (rt.shadowRoot.activeElement) {
      rt = rt.shadowRoot.activeElement;
    } else if (rt.shadowRoot.querySelector('input, textarea, select')) {
      rt = rt.shadowRoot.querySelector('input, textarea, select');
      break;
    } else {
      break;
    }
  }
  if (rt === window) {
    rt = document.body;
  }
  return rt;
}

function fixGithub() {
  var el = document.getElementById("global-create-menu-overlay")
  if (el) {
    el.style.display = "none";
  }
}
// TODO: 以后新建仓库的时候就麻烦了, 这个以后再处理
setTimeout(() => {
  fixGithub()
}, 1000);
