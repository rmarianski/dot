package main

import (
	"flag"
	"log"
)

// Flags captures the command line flags
type Flags struct{}

func main() {
	var flags Flags
	flag.Parse()
	if err := run(&flags); err != nil {
		log.Fatalf("Error: %s", err)
	}
}

func run(flags *Flags) error {
	return nil
}
