package main

import (
    "fmt"
    "html"
    "log"
    "net/http"
)

func main() {

    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintf(w, "Hello, %q", html.EscapeString(r.URL.Path))
    })

    http.HandleFunc("/hi", func(w http.ResponseWriter, r *http.Request){
        fmt.Fprintf(w, "Hi")
    })

    // healthz is a liveness probe.
    http.HandleFunc("/healthz", func(w http.ResponseWriter, _ *http.Request){
        w.WriteHeader(http.StatusOK)
    })

    log.Fatal(http.ListenAndServe(":8081", nil))

}