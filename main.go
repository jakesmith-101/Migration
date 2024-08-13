package main

import (
	"fmt"
	"io"
	"bytes"
	"net/http"
	"encoding/json"
	"github.com/gin-gonic/gin"
)

var coldboxPort = 8080
var nodePort = 8888
var proxyPort = 3333
var host = "http://localhost:" // append corresponding port

func ping(context *gin.Context) {
	context.JSON(200, gin.H{
		"message": "pong",
	})
}

type data struct {
    orderID    string     `json:"orderID,omitempty"`
    items    []string     `json:"items"`
}

func relay(context *gin.Context, path string, port int, method string) {
	var newData data
    // Call BindJSON to bind the received JSON to newData.
    if err := context.BindJSON(&newData); err != nil {
		context.IndentedJSON(http.StatusBadRequest, gin.H{"message": "Bind JSON Failed."})
        return
    }

	//check nonce with cache before executing these
	newBody, err := json.Marshal(newData)
	//return/log error
	if err != nil {
		context.IndentedJSON(http.StatusBadRequest, gin.H{"message": "Encode JSON Failed."})
		return
	}
	req, err := http.NewRequest(method, fmt.Sprintf("http://localhost:%s%s", port, path), bytes.NewBuffer(newBody))
	//return/log error
	if err != nil {
		context.IndentedJSON(http.StatusBadRequest, gin.H{"message": "Request Creation Failed."})
		return
	}

	//send request and receive response
	resp, err := http.DefaultClient.Do(req)
	//return/log error
	if err != nil {
		context.IndentedJSON(http.StatusBadRequest, gin.H{"message": "Request Sent Failed."})
		return
	}
	defer resp.Body.Close()
	//get string
	b, err := io.ReadAll(resp.Body)
	//return/log error
	if err != nil {
		context.IndentedJSON(http.StatusBadRequest, gin.H{"message": "Read Response Failed."})
		return
	}

	context.JSON(200, b)
}

func setupRouter() *gin.Engine {
	// Disable Console Color
	// gin.DisableConsoleColor()
	router := gin.Default()

	// Ping test
	router.GET("/api/ping", ping)

	// get all orders
	router.GET("/api/order", func (c *gin.Context) {
		relay(c,"/api/order", nodePort, "GET") // decide port here
	})
	// create an order
	router.PUT("/api/order", func (c *gin.Context) {
		relay(c,"/api/order", nodePort, "PUT") // decide port here
	})
	router.POST("/api/order", func (c *gin.Context) {
		relay(c,"/api/order", nodePort, "POST") // decide port here
	})
	// get an order
	router.GET("/api/order/:orderID", func (c *gin.Context) {
		relay(c,"/api/order/:orderID", nodePort, "GET") // decide port here
	})
	// edit an order
	router.PUT("/api/order/:orderID", func (c *gin.Context) {
		relay(c,"/api/order/:orderID", nodePort, "PUT") // decide port here
	})
	router.POST("/api/order/:orderID", func (c *gin.Context) {
		relay(c,"/api/order/:orderID", nodePort, "POST") // decide port here
	})
	// delete an order
	router.DELETE("/api/order/:orderID", func (c *gin.Context) {
		relay(c,"/api/order/:orderID", nodePort, "DELETE") // decide port here
	})

	return router
}



func main() {
	router := setupRouter()
	// Listen and Server in 0.0.0.0:3333 or localhost:3333
	router.Run(fmt.Sprintf("%s%s", ":", proxyPort))
}