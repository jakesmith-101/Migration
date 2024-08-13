package main

import (
	"errors"
	"fmt"
	"io"
	"net/http"
	"os"
	"github.com/gin-gonic/gin"
)

coldboxPort := 8080
nodePort := 8888
proxyPort := 3333
host := "http://localhost:" // append corresponding port

func getRoot(w http.ResponseWriter, r *http.Request) {
	fmt.Printf("got / request\n")
	io.WriteString(w, "This is the proxy!\n")
}
func getorders(w http.ResponseWriter, r *http.Request) {
	fmt.Printf("got /order request\n")
	http.Request()

}
func createorder(w http.ResponseWriter, r *http.Request) {
	fmt.Printf("got /order/create request\n")
	http.Request()

}
func deleteorder(w http.ResponseWriter, r *http.Request) {
	fmt.Printf("got /order/delete request\n")
	http.Request()

}
func purchaseorder(w http.ResponseWriter, r *http.Request) {
	fmt.Printf("got /order/purchase request\n")
	http.Request()

}

func main() {
	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
	  c.JSON(http.StatusOK, gin.H{
		"message": "pong",
	  })
	})
	r.Run() // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
  }