package main

import(
	"log"
	"net/url"
	"net/http"
	"net/http/httputil"
)

var coldboxPort = "8080"
var nodePort = "8888"
var proxyPort = "3333"
var host = "http://localhost:" // append corresponding port


func main() {
    remote, err := url.Parse(fmt.Sprintf("%s%s", host, nodePort))
    if err != nil {
        panic(err)
    }

    handler := func(p *httputil.ReverseProxy) func(http.ResponseWriter, *http.Request) {
        return func(w http.ResponseWriter, r *http.Request) {
            log.Println(r.URL)
            r.Host = remote.Host
            w.Header().Set("X-Ben", "Rad")
            p.ServeHTTP(w, r)
        }
    }
        
    proxy := httputil.NewSingleHostReverseProxy(remote)
    http.HandleFunc("/", handler(proxy))
    err = http.ListenAndServe(fmt.Sprintf("%s%s", ":", proxyPort), nil)
    if err != nil {
        panic(err)
    }
}