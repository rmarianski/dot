package main

import (
	"flag"
	"log"
)

type flags struct{}

func main() {
	var flags flags
	flag.Parse()
	if err := run(&flags); err != nil {
		log.Fatalf("Error: %s", err)
	}
}

func run(flags *flags) error {
	return nil
}
