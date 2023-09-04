package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/mygo", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello from Go Web App at /mygo!")
	})

	http.ListenAndServe(":8080", nil)
}