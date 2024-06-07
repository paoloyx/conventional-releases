package main

import (
	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()

	r.GET("/", func(c *gin.Context) {
		c.String(200, "Hello, World!!")
	})

	// Custom route to greet user
	r.GET("/hello/:name", func(c *gin.Context) {
		name := c.Param("name")
		c.String(200, "Hello, %s!", name)
	})

	r.Run(":8080") // Avvia il server sulla porta 8080
}
