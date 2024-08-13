package main

import (
	"fmt"
	"net/http"
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

func relay(context *gin.Context) {
	var newData data
    // Call BindJSON to bind the received JSON to newData.
    if err := c.BindJSON(&newData); err != nil {
        return
    }
}

func setupRouter() *gin.Engine {
	// Disable Console Color
	// gin.DisableConsoleColor()
	router := gin.Default()

	// Ping test
	router.GET("/api/ping", ping)

	// get all orders
	router.GET("/api/order", ping)
	// create an order
	router.PUT("/api/order", ping)
	router.POST("/api/order", ping)
	// get an order
	router.GET("/api/order/:orderID", ping)
	// edit an order
	router.PUT("/api/order/:orderID", ping)
	router.POST("/api/order/:orderID", ping)
	// delete an order
	router.DELETE("/api/order/:orderID", ping)

	return router
}



func main() {
	router := setupRouter()
	// Listen and Server in 0.0.0.0:3333 or localhost:3333
	router.Run(fmt.Sprintf("%s%s", ":", proxyPort))
}