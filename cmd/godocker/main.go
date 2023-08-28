package main

import (
	"godocker/internal/godocker"
	"log"
)

func main() {
	log.SetFlags(log.Flags() | log.LUTC | log.Lshortfile)

	log.Println("Hello from main!")
	godocker.Println("Hello from godocker!")
}
