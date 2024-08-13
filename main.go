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

func setupRouter() *gin.Engine {
	// Disable Console Color
	// gin.DisableConsoleColor()
	router := gin.Default()

	// Ping test
	router.GET("/api/ping", func(c *gin.Context) {
		c.String(http.StatusOK, "pong")
	})

	router.GET("/api/order", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})

	return router
}



func main() {
	router := setupRouter()
	// Listen and Server in 0.0.0.0:3333 or localhost:3333
	router.Run(fmt.Sprintf("%s%s", ":", proxyPort))
}