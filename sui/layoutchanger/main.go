package main

import (
	"bytes"
	"encoding/json"
	"flag"
	"fmt"
	"io"
	"log"
	"os"
	"path"
	"strings"

	"github.com/rwtodd/Go.Sed/sed"
)

var layout string

type Layout struct {
	Name string
	Keys []string
}
type SuiConf struct {
	Files   []string
	Keys    []string
	Layouts []*Layout
}

func main() {
	flag.StringVar(&layout, "l", "qwerty", "layout name in sui_conf.json")
	flag.Parse()
	suiRoot := os.Getenv("SUI_ROOT")
	if suiRoot == "" {
		log.Fatal("必须设置环境变量SUI_ROOT, 请运行install.bat")
	}
	confBytes, err := os.ReadFile(path.Join(suiRoot, "sui", "layoutchanger", "sui_conf.json"))
	if err != nil {
		log.Fatal("无法读取sui_conf.json")
	}
	var v SuiConf
	err = json.Unmarshal(confBytes, &v)
	if err != nil {
		log.Fatal("解析sui_conf.json错误,格式被破坏")
	}
	suiKeys := v.Keys
	allLayouts := map[string]*Layout{}
	for _, layout := range v.Layouts {
		if len(suiKeys) != len(layout.Keys) {
			log.Fatalf("layout %v 的长度不对", layout.Name)
		}
		allLayouts[layout.Name] = layout
	}
	var transKes []string
	if allLayouts[layout] == nil {
		log.Fatalf("do not support layout %v.\n", layout)
	}
	transKes = allLayouts[layout].Keys
	reg := ``
	for i, key := range suiKeys {
		reg += fmt.Sprintf(`s/%v/%v/g;`, key, transKes[i])
	}
	fmt.Println("下面是", layout, "布局的sed表达式:")
	fmt.Println(reg)
	engine, err := sed.New(strings.NewReader(reg))
	if err != nil {
		log.Fatal("sed表达式有错:", err)
	}
	for _, file := range v.Files {
		fmt.Println("sui开始处理文件", file)
		fileContent, err := os.ReadFile(path.Join(suiRoot, file))
		if err != nil {
			log.Fatalf("读取文件%v错误\n", file)
		}
		sedReader := engine.Wrap(bytes.NewReader(fileContent))
		var outbytes bytes.Buffer
		_, err = io.Copy(&outbytes, sedReader)
		if err != nil {
			log.Fatalf("sed处理文件%v错误\n", file)
		}
		os.WriteFile(path.Join(suiRoot, file), outbytes.Bytes(), os.ModePerm)
	}
	fmt.Println("sui转换布局", layout, "成功.")
}
