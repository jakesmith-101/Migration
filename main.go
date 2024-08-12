package main

import (
	"errors"
	"fmt"
	"io"
	"net/http"
	"os"
)

coldboxPort := 8080
nodePort := 8888
proxyPort := 3333

func getRoot(w http.ResponseWriter, r *http.Request) {
	fmt.Printf("got / request\n")
	io.WriteString(w, "This is the proxy!\n")
}
func getorders(w http.ResponseWriter, r *http.Request) {
	fmt.Printf("got /order request\n")
	io.WriteString(w, "Hello, HTTP!\n")
}
func createorder(w http.ResponseWriter, r *http.Request) {
	fmt.Printf("got /order request\n")
	io.WriteString(w, "Hello, HTTP!\n")
}
func deleteorder(w http.ResponseWriter, r *http.Request) {
	fmt.Printf("got /order request\n")
	io.WriteString(w, "Hello, HTTP!\n")
}
func purchaseorder(w http.ResponseWriter, r *http.Request) {
	fmt.Printf("got /order request\n")
	io.WriteString(w, "Hello, HTTP!\n")
}

func main() {
	http.HandleFunc("/", getRoot)
	http.HandleFunc("/order", getorders)
	http.HandleFunc("/order/create", createorder)
	http.HandleFunc("/order/delete", deleteorder)
	http.HandleFunc("/order/purchase", purchaseorder)

	err := http.ListenAndServe(fmt.Sprintf("%s%s", ":", proxyPort), nil)
	if errors.Is(err, http.ErrServerClosed) {
		fmt.Printf("server closed\n")
	} else if err != nil {
		fmt.Printf("error starting server: %s\n", err)
		os.Exit(1)
	}
}
