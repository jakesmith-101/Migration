package main

import (
	"fmt"
	"io"
	"net/http"
	"encoding/json"
	"github.com/gin-gonic/gin"
)

coldboxPort := 8080
nodePort := 8888
proxyPort := 3333
host := "http://localhost:" // append corresponding port

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
    if err := c.BindJSON(&newData); err != nil {
		http.Error(w, "Bind JSON Failed.", http.StatusBadRequest)
        return
    }

	//check nonce with cache before executing these
	newBody, err := json.Marshal(newData)
	//return/log error
	if err != nil {
		http.Error(w, "Encode JSON Failed.", http.StatusBadRequest)
		return
	}
	req, err := http.NewRequest(method, fmt.Sprintf("http://localhost:%s%s", port, path), bytes.NewBuffer(newBody))
	//return/log error
	if err != nil {
		http.Error(w, "Request Creation Failed.", http.StatusBadRequest)
		return
	}

	//send request and receive response
	resp, err := http.DefaultClient.Do(req)
	//return/log error
	if err != nil {
		http.Error(w, "Request Sent Failed.", http.StatusBadRequest)
		return
	}
	defer resp.Body.Close()
	//get string
	b, err := io.ReadAll(resp.Body)
	//return/log error
	if err != nil {
		http.Error(w, "Read Response Failed.", http.StatusBadRequest)
		return
	}

	c.JSON(200, b)
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