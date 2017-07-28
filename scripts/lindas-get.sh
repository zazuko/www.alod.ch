#!/bin/sh
curl -n -G -H "Accept: application/n-triples" -o target/bs.nt http://data.zazuko.com/alod --data-urlencode graph=http://data.alod.ch/graph/bs
curl -n -G -H "Accept: application/n-triples" -o target/inference-relation.nt http://data.zazuko.com/alod --data-urlencode graph=http://data.alod.ch/graph/inference-relation
curl -n -G -H "Accept: application/n-triples" -o target/inference-supertitle.nt http://data.zazuko.com/alod --data-urlencode graph=http://data.alod.ch/graph/inference-supertitle
curl -n -G -H "Accept: application/n-triples" -o target/generic.nt http://data.zazuko.com/alod --data-urlencode graph=http://data.alod.ch/graph/generic
curl -n -G -H "Accept: application/n-triples" -o target/bar.nt http://data.zazuko.com/alod --data-urlencode graph=http://data.alod.ch/graph/bar
curl -n -G -H "Accept: application/n-triples" -o target/ne.nt http://data.zazuko.com/alod --data-urlencode graph=http://data.alod.ch/graph/ne
curl -n -G -H "Accept: application/n-triples" -o target/ge.nt http://data.zazuko.com/alod --data-urlencode graph=http://data.alod.ch/graph/ge
curl -n -G -H "Accept: application/n-triples" -o target/vs.nt http://data.zazuko.com/alod --data-urlencode graph=http://data.alod.ch/graph/vs
curl -n -G -H "Accept: application/n-triples" -o target/isil.nt http://data.zazuko.com/alod --data-urlencode graph=http://data.alod.ch/graph/isil
curl -n -G -H "Accept: application/n-triples" -o target/meta.nt http://data.zazuko.com/alod --data-urlencode graph=http://data.alod.ch/graph/meta
