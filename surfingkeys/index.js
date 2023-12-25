const {
  getBrowserName,

  map,
  mapkey,
  vmap,
  vmapkey,
  cmap,
  cmapkey,
  imap,
  imapkey,

  unmap,
  iunmap,
  vunmap,

  RUNTIME,
  Clipboard,
  Hints,
  Visual,
  Front,

  insertJS,
  addSearchAlias,

  aceVimMap,
  addVimMapKcey,
  getClickableElements,
  getFormData,
  unmapAllExcept,
  readText,
  removeSearchAlias,
  searchSelectedWith,
  tabOpenLink,
} = api
// cmapkey 不存在
const registerKey = (domain, mapObj, siteleader) => {
  const {
    alias,
    callback,
    leader = domain === "global" ? "" : siteleader,
    category = "misc",
    description = "",
    path = "(/.*)?",
  } = mapObj
  const opts = {}

  const key = `${leader}${alias}`

  if (domain !== "global") {
    const d = domain.replace(".", "\\.")
    opts.domain = new RegExp(`^http(s)?://(([a-zA-Z0-9-_]+\\.)*)(${d})${path}`)
  }

  const fullDescription = `#${category} ${description}`

  if (mapObj.mode === undefined) {
    if (typeof mapObj.map !== "undefined") {
      map(key, mapObj.map)
    } else {
      mapkey(key, fullDescription, callback, opts)
    }
  } else if (typeof mapObj.mode == "string") {
    for (let i = 0; i < mapObj.mode.length; i++) {
      const mode = mapObj.mode[i];
      if (mode == "i") {
        if (typeof mapObj.map !== "undefined") {
          imap(key, mapObj.map)
        } else {
          imapkey(key, fullDescription, callback, opts)
        }
      } else if (mode == "v") {
        if (typeof mapObj.map !== "undefined") {
          vmap(key, mapObj.map)
        } else {
          vmapkey(key, fullDescription, callback, opts)
        }
      } else if (mode == "c") {
        if (typeof mapObj.map !== "undefined") {
          cmap(key, mapObj.map)
        } else {
          cmapkey(key, fullDescription, callback, opts)
        }
      } else if (mode == "n") {
        if (typeof mapObj.map !== "undefined") {
          map(key, mapObj.map)
        } else {
          mapkey(key, fullDescription, callback, opts)
        }
      }
    }
  }
}

const registerKeys = (maps, aliases, siteleader) => {
  const hydratedAliases = Object.entries(
    aliases
  ).flatMap(([baseDomain, aliasDomains]) =>
    aliasDomains.flatMap((a) => ({ [a]: maps[baseDomain] }))
  )

  const mapsAndAliases = Object.assign({}, maps, ...hydratedAliases)

  Object.entries(mapsAndAliases).forEach(([domain, domainMaps]) => {
    console.log("domain=", domain)
    console.log("domainMaps=", domainMaps)
    domainMaps.forEach((mapObj) => registerKey(domain, mapObj, siteleader))
  })
}

const util = {}

util.isDevToolsOpen = () => {
  const threshold = 300;
  let devtoolsWidth = window.outerWidth - window.innerWidth;
  if (devtoolsWidth > threshold) {
    return true
  } else {
    return false
  }
}

const actions = {
  quitCurrentTab: function () {
    RUNTIME("closeTab")
  },
}

actions.moveTabNextToTab = (targetId, nextTo, leftOf = false) =>
  browser.tabs.move(targetId, {
    windowId: nextTo.windowId,
    index: nextTo.index - (leftOf ? 1 : 0),
  })

// TODO
// actions.cutTab = async () =>
//   browser.storage.local.set({
//     cutTabEvent: {
//       tabId:     (await browser.tabs.query({ currentWindow: true, active: true }))[0].id,
//       timestamp: new Date(),
//     },
//   })

// actions.pasteTab = async (leftOf = false) => {
//   const { cutTabEvent = null } = await browser.storage.local.get("cutTabEvent")
//   if (!cutTabEvent || (new Date() - cutTabEvent.timestamp) > 60000) return
//   const curTab = (await browser.tabs.query({ currentWindow: true, active: true }))[0]
//   await actions.moveTabNextToTab(cutTabEvent.tabId, curTab, leftOf)
// }

actions.dispatchEvents = (type, node, ...eventTypes) =>
  eventTypes.forEach((t) => {
    const e = document.createEvent(type)
    e.initEvent(t, true, true)
    node.dispatchEvent(e)
  })

actions.dispatchMouseEvents = actions.dispatchEvents.bind(undefined, [
  "MouseEvents",
])

actions.scrollToHash = (hash = null) => {
  const h = (hash || document.location.hash).replace("#", "")
  const e =
    document.getElementById(h) || document.querySelector(`[name="${h}"]`)
  if (!e) {
    return
  }
  e.scrollIntoView({ behavior: "smooth" })
}

// URL Manipulation/querying
// -------------------------
actions.vimEditURL = () =>
  Front.showEditor(
    window.location.href,
    (url) => {
      actions.openLink(url)
    },
    "url"
  )

actions.getOrgLink = () => `[[${window.location.href}][${document.title}]]`

actions.getMarkdownLink = ({
  title = document.title,
  href = window.location.href,
} = {}) => `[${title}](${href})`

// Site/Page Information
// ---------------------

const ddossierUrl = "http://centralops.net/co/DomainDossier.aspx"

actions.getWhoisUrl = ({ hostname = window.location.hostname } = {}) =>
  `${ddossierUrl}?dom_whois=true&addr=${hostname}`

actions.getDnsInfoUrl = ({
  hostname = window.location.hostname,
  all = false,
} = {}) =>
  `${ddossierUrl}?dom_dns=true&addr=${hostname}${all
    ? "?dom_whois=true&dom_dns=true&traceroute=true&net_whois=true&svc_scan=true"
    : ""
  }`

actions.getGoogleCacheUrl = ({ href = window.location.href } = {}) =>
  `https://webcache.googleusercontent.com/search?q=cache:${href}`

actions.getWaybackUrl = ({ href = window.location.href } = {}) =>
  `https://web.archive.org/web/*/${href}`

actions.getOutlineUrl = ({ href = window.location.href } = {}) =>
  `https://outline.com/${href}`

actions.getAlexaUrl = ({ hostname = window.location.hostname } = {}) =>
  `https://www.alexa.com/siteinfo/${hostname}`

actions.getBuiltWithUrl = ({ href = window.location.href } = {}) =>
  `https://www.builtwith.com/?${href}`

actions.getWappalyzerUrl = ({ hostname = window.location.hostname } = {}) =>
  `https://www.wappalyzer.com/lookup/${hostname}`

actions.getDiscussionsUrl = ({ href = window.location.href } = {}) =>
  `https://discussions.xojoc.pw/?${new URLSearchParams({ url: href })}`

// Surfingkeys-specific actions
// ----------------------------
actions.openAnchor = ({
  newTab = false,
  active = true,
  prop = "href",
} = {}) => (a) => actions.openLink(a[prop], { newTab, active })

actions.openLink = (url, { newTab = false, active = true } = {}) => {
  if (newTab) {
    RUNTIME("openLink", {
      tab: { tabbed: true, active },
      url: url instanceof URL ? url.href : url,
    })
    return
  }
  window.location.assign(url)
}

actions.editSettings = () =>
  tabOpenLink(chrome.extension.getURL("/pages/options.html"))

actions.togglePdfViewer = () =>
  chrome.storage.local.get("noPdfViewer", (resp) => {
    if (!resp.noPdfViewer) {
      chrome.storage.local.set({ noPdfViewer: 1 }, () => {
        Front.showBanner("PDF viewer disabled.")
      })
    } else {
      chrome.storage.local.remove("noPdfViewer", () => {
        Front.showBanner("PDF viewer enabled.")
      })
    }
  })

actions.previewLink = () =>
  util.createHints("a[href]", (a) =>
    Front.showEditor(a.href, (url) => actions.openLink(url), "url")
  )

actions.scrollElement = (el, dir) => {
  actions.dispatchMouseEvents(el, "mousedown")
  Normal.scroll(dir)
}

// FakeSpot
// --------
actions.fakeSpot = (url = window.location.href) =>
  actions.openLink(`https://fakespot.com/analyze?ra=true&url=${url}`, {
    newTab: true,
    active: false,
  })

actions.viewGodoc = () =>
  actions.openLink(
    `https://godoc.org/${getURLPath({ count: 2, domain: true })}`,
    { newTab: true }
  )

const unmaps = {
  mappings: [
    "q",
    "k",
    "j",
    "h",
    "l",
    "m",
    // "e",
    // "d",
    // "E",
    // "sb",
    // "sw",
    // "ob",
    // "oe",
    // "ow",
    // "oy",
    // "cp",
    // ";cp",
    // ";ap",
    // "spa",
    // "spb",
    // "spd",
    // "sps",
    // "spc",
    // "spi",
    // "sfr",
    // "zQ",
    // "zz",
    // "zR",
    // "ab",
    // "Q",
    // "q",
    // "ag",
    // "af",
    // ";s",
    // "yp",
    // "p",
    // "<Ctrl-j>",
    // "<Ctrl-h>",
    // "<Alt-s>"
  ],
  searchAliases: {
    // s: ["g", "d", "b", "e", "w", "s", "h", "y"],
  },
}
const maps = {}
iunmap('<Ctrl-e>')
// unmap('q')
// map('l', "e")
// alias 是你要所定义的快捷键
// map 是surfingkeys原本的操作
// callback 是你的快捷键按下所执行的函数, 和map不一起出现
maps.global = [
  {
    mode: "nv",
    alias: "<ArrowUp>",
    map: "k",
    description: "Scroll up",
  },
  {
    mode: "nv",
    alias: "<ArrowDown>",
    map: "j",
    description: "Scroll down",
  },
  {
    mode: "nv",
    alias: "<ArrowLeft>",
    map: "h",
  },
  {
    mode: "nv",
    alias: "<ArrowRight>",
    map: "l",
  },
  {
    mode: "v",
    alias: "<Home>",
    map: "0",
  },
  {
    mode: "v",
    alias: "<End>",
    map: "$",
  },
  {
    alias: "r",
    map: "e",
    description: "Scroll half page up",
  },
  {
    alias: "i",
    map: "d",
    description: "Scroll half page down",
  },
  {
    alias: "n",
    map: "E",
    description: "focus tab left",
  },
  {
    alias: "o",
    map: "R",
    description: "focus tab right",
  },
  // quit interface
  {
    mode: "niv",
    alias: "<Ctrl-Alt-q>q",
    callback: actions.quitCurrentTab,
    description: "quit current tab",
  },
  {
    mode: "niv",
    alias: "<Ctrl-Alt-q>t",
    callback: actions.quitCurrentTab,
    description: "quit current tab",
  },
  {
    mode: "niv",
    alias: "<Ctrl-Alt-q>w",
    callback: actions.quitCurrentTab,
    description: "quit current tab",
  },
  {
    mode: "niv",
    alias: "<Ctrl-Alt-q>o",
    map: "gxx",
    description: "quit all except current tab",
  },
  {
    mode: "niv",
    alias: "<Ctrl-Alt-q>n",
    map: "gxx",
    description: "quit all except current tab",
  },
  // fallback
  {
    mode: "niv",
    alias: "<Ctrl-Alt-f>",
    map: "<Alt-s>",
    description: "quit current tab",
  },
  // goto interface
  {
    mode: "niv",
    aliais: "<Ctrl-Alt-g>n",
    map: "S",
    description: "go back",
  },
  {
    mode: "niv",
    alias: "<Ctrl-Alt-g>o",
    map: "D",
    description: "launch dev tools",
  },
  {
    mode: "niv",
    alias: "<Ctrl-Alt-g>.",
    map: "H",
    description: "launch dev tools",
  },
  {
    alias: "gn",
    mode: "nv",
    map: "S",
    description: "go back",
  },
  {
    mode: "nv",
    alias: "go",
    map: "D",
    description: "launch dev tools",
  },
  {
    mode: "nv",
    alias: "g.",
    map: "H",
    description: "launch dev tools",
  },
  // launch interface
  {
    mode: "niv",
    alias: "<Ctrl-Alt-l>l",
    callback: actions.vimEditURL,
    description: "launch dev tools",
  },
  {
    mode: "niv",
    alias: "<Ctrl-Alt-l>t",
    callback: function () {
      tabOpenLink("www.baidu.com")
    },
  },
  {
    alias: "ll",
    category: "aa",
    callback: actions.vimEditURL,
    description: "vim edit"
  },
  {
    alias: "lt",
    callback: function () {
      tabOpenLink("www.baidu.com")
    },
  },
  // focus interface
  {
    mode: "niv",
    alias: "<Ctrl-Alt-n>",
    map: "E",
  },
  {
    mode: "niv",
    alias: "<Ctrl-Alt-o>",
    map: "R",
  },
  {
    mode: "niv",
    alias: "<Ctrl-Alt-m>n",
    map: "<<",
  },
  {
    mode: "niv",
    alias: "<Ctrl-Alt-m>o",
    map: ">>",
  },
  {
    mode: "niv",
    alias: "<Ctrl-Alt-m><ArrowLeft>",
    map: "<<",
  },
  {
    mode: "niv",
    alias: "<Ctrl-Alt-m><ArrowRight>",
    map: ">>",
  },
  {
    mode: "nv",
    alias: "mn",
    map: "<<",
  },
  {
    mode: "nv",
    alias: "mo",
    map: ">>",
  },
  {
    mode: "nv",
    alias: "m<ArrowLeft>",
    map: "<<",
  },
  {
    mode: "nv",
    alias: "m<ArrowRight>",
    map: ">>",
  },
  
]

cmap('<ArrowLeft>', '<Ctrl-,>')
cmap('<ArrowRight>', '<Ctrl-.>')
cmap('<Home>', '<Ctrl-,>')
cmap('<End>', '<Ctrl-.>')
cmap('<PageUp>', '<Ctrl-,>')
cmap('<PageDown>', '<Ctrl-.>')

settings.omnibarMaxResults = 15
settings.omnibarHistoryCacheSize = 10000

maps["bilibili"] = [
  {
    alias: "q",
    map: "x",
    description: "launch dev tools",
  },
]

const keys = {
  maps,
  unmaps,
}

const conf = {
  siteleader: ',',
  keys,
}

const main = async () => {
  window.surfingKeys = api
  console.log("start map keys...")

  if (conf.keys && conf.keys.unmaps) {
    const { unmaps } = conf.keys
    if (unmaps.mappings) {
      unmaps.mappings.forEach((m) => unmap(m))
    }
    if (unmaps.searchAliases) {
      Object.entries(unmaps.searchAliases).forEach(([leader, items]) => {
        items.forEach((v) => removeSearchAlias(v, leader))
      })
    }
  }

  if (conf.keys && conf.keys.maps) {
    const { keys } = conf
    const { maps, aliases = {} } = keys
    registerKeys(maps, aliases, conf.siteleader)
  }
}

if (typeof window !== "undefined") {
  main()
}
