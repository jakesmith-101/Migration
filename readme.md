# RESTful api migration example

Each branch is supposed to be ran simultaneously to show how Migration through strangle pattern works.<br />
How the proxy delegates requests to legacy/new depending on if those endpoints exist on new, or new cannot handle specfic requests. etc

## Coldbox (ColdFusion)

Ports:
- 8080(api)
- 8443(unused)

## Express (Node)

Ports:
- 8888

## Proxy (Golang)

Ports:
- 3333