package main

import (
	"fmt"
	"os"
)

var TEMPLATE_PATH = "/Obsidian/NotesBackup/Templates/Project Template.md"
var OBSIDEAN_PATH = "/Obsidian/NotesBackup/Projects/Life/"

func main() {
  dirname, err := os.UserHomeDir()
  if err != nil {
    panic(err)
  }

  TEMPLATE_PATH = dirname + TEMPLATE_PATH
  OBSIDEAN_PATH = dirname + OBSIDEAN_PATH

  args := os.Args

  if len(args) < 2 {
    panic("Command incorrect, expected: `go run script.go taskName` at least")
  }

  name := args[1]
  description := ""

  for i := 2; i < len(args); i++ {
    description += args[i] + " "
  }
  description = description[:len(description) - 1]
    
  CreateTask(name, description)
}

func CreateTask(name string, description string) {
  templateContent, err := os.ReadFile(TEMPLATE_PATH)
  if err != nil {
    panic(err)
  }

  fileContent := fmt.Sprintf("%s\n%s", string(templateContent), description)

  err = os.WriteFile(OBSIDEAN_PATH + name + ".md", []byte(fileContent), 0644)
  if err != nil {
    panic(err)
  }
}
