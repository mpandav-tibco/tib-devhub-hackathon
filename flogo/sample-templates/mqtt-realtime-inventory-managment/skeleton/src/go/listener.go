package main

import (
	"context"
	"fmt"
	"log"
	"os"
	"os/signal"
	"syscall"
	"time"

	"github.com/lib/pq"
	_ "github.com/lib/pq" // Import the PostgreSQL driver
)

func main() {
	// Get connection string and channel from environment variables or command line arguments
	// For simplicity, using environment variables here.
	connStr := os.Getenv("DATABASE_URL")
	channel := os.Getenv("NOTIFICATION_CHANNEL")

	if connStr == "" || channel == "" {
		log.Fatalf("DATABASE_URL and NOTIFICATION_CHANNEL environment variables must be set")
	}

	log.Printf("Connecting to database and listening on channel '%s'", channel)

	// Use a context for graceful shutdown
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	// Set up signal handling for graceful shutdown
	sigChan := make(chan os.Signal, 1)
	signal.Notify(sigChan, syscall.SIGINT, syscall.SIGTERM)

	// Goroutine to handle signals and cancel the context
	go func() {
		sig := <-sigChan
		log.Printf("Received signal: %v. Shutting down...", sig)
		cancel() // Cancel the context to signal the listener to stop
	}()

	// Start the listener loop
	if err := listenForNotifications(ctx, connStr, channel); err != nil {
		log.Fatalf("Listener stopped with error: %v", err)
	}

	log.Println("Program finished.")
}

// listenForNotifications establishes the connection and listens for messages.
func listenForNotifications(ctx context.Context, connStr, channel string) error {
	// Create a new listener
	// reportProblem is a callback function for listener events
	reportProblem := func(ev pq.ListenerEventType, err error) {
		if err != nil {
			log.Printf("PostgreSQL Listener encountered a problem (Type: %d): %v", ev, err)
		}
	}
	listener := pq.NewListener(connStr, 10*time.Second, 10*time.Minute, reportProblem)

	// Connect to the database and start listening
	err := listener.Listen(channel)
	if err != nil {
		return fmt.Errorf("failed to listen on channel '%s': %w", channel, err)
	}
	defer listener.Close() // Ensure the listener is closed when the function exits

	log.Printf("Successfully listening on channel '%s'", channel)

	// Main loop to process notifications or context cancellation
	for {
		select {
		case notification := <-listener.Notify:
			if notification != nil {
				log.Printf("Received notification on channel '%s': %s (Payload: %s)",
					notification.Channel, notification.Extra, notification.Extra) // notification.Extra contains the payload
				// Process the notification payload here
				// e.g., trigger some action, log the message, etc.
			}
		case <-ctx.Done():
			log.Println("Context cancelled. Stopping listener.")
			return ctx.Err() // Return the context error
			// Removed invalid listener.ConnEvent() case block as pq.Listener does not support it
		}
	}
}

// Note: This program requires the github.com/lib/pq driver.
// You can install it using: go get github.com/lib/pq
