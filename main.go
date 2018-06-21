package main

import (
	"net/http"
	"fmt"
	"log"
)

var version = "v0"

func main() {
	http.HandleFunc("/", func(writer http.ResponseWriter, request *http.Request) {
		fmt.Fprintf(writer, "Welcome to my website! Version %s", version)
	})
	fmt.Printf("App is starting, version: %s \n", version)
	log.Fatal(http.ListenAndServe(":8500", nil))
}
