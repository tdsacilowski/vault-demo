// main.go
package main

import (
	"log"

	"github.com/aws/aws-lambda-go/lambda"
	"github.com/hashicorp/vault/api"
)

func hello() (string, error) {
	pathArg := "sys/health"

	vaultCFG := api.DefaultConfig()
	vaultCFG.Address = "http://34.238.82.32:8200"

	var err error
	vClient, err := api.NewClient(vaultCFG)
	if err != nil {
		log.Fatal(err)
	}

	vault := vClient.Logical()

	s, err := vault.Read(pathArg)

	return s.Data, nil
}

func main() {
	// Make the handler available for Remote Procedure Call by AWS Lambda
	lambda.Start(hello)
}
