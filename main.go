package main

import (
    "fmt"
    "net/http"
    "os"
    "github.com/gin-gonic/gin"
)

func main() {
    // Get version from environment variable (will be "blue" or "green")
    version := os.Getenv("VERSION")
    if version == "" {
        version = "unknown"
    }

    // Create Gin router
    router := gin.Default()

    // Health check endpoint (for ALB health checks)
    router.GET("/health", func(c *gin.Context) {
        c.JSON(http.StatusOK, gin.H{
            "status": "healthy",
            "version": version,
        })
    })

    // Main endpoint
    router.GET("/", func(c *gin.Context) {
        c.JSON(http.StatusOK, gin.H{
            "message": fmt.Sprintf("Hello from %s environment!", version),
            "version": version,
            "hostname": getHostname(),
        })
    })

    // Version endpoint
    router.GET("/version", func(c *gin.Context) {
        c.JSON(http.StatusOK, gin.H{
            "version": version,
            "environment": version,
        })
    })

    // Start server on port 8080
    router.Run(":8080")
}

func getHostname() string {
    hostname, err := os.Hostname()
    if err != nil {
        return "unknown"
    }
    return hostname
}
