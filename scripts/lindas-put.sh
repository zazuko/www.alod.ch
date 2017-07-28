#!/bin/sh
curl -n \
     -X PUT \
     -H Content-Type:application/n-triples \
     -T target/bs.nt \
     -G https://test.lindas-data.ch:8443/alod \
     --data-urlencode graph=http://data.alod.ch/graph/bs
curl -n \
     -X PUT \
     -H Content-Type:application/n-triples \
     -T target/inference-relation.nt \
     -G https://test.lindas-data.ch:8443/alod \
     --data-urlencode graph=http://data.alod.ch/graph/inference-relation
curl -n \
     -X PUT \
     -H Content-Type:application/n-triples \
     -T target/inference-supertitle.nt \
     -G https://test.lindas-data.ch:8443/alod \
     --data-urlencode graph=http://data.alod.ch/graph/inference-supertitle
curl -n \
     -X PUT \
     -H Content-Type:application/n-triples \
     -T target/generic.nt \
     -G https://test.lindas-data.ch:8443/alod \
     --data-urlencode graph=http://data.alod.ch/graph/generic
curl -n \
     -X PUT \
     -H Content-Type:application/n-triples \
     -T target/bar.nt \
     -G https://test.lindas-data.ch:8443/alod \
     --data-urlencode graph=http://data.alod.ch/graph/bar
curl -n \
     -X PUT \
     -H Content-Type:application/n-triples \
     -T target/ne.nt \
     -G https://test.lindas-data.ch:8443/alod \
     --data-urlencode graph=http://data.alod.ch/graph/ne
curl -n \
     -X PUT \
     -H Content-Type:application/n-triples \
     -T target/ge.nt \
     -G https://test.lindas-data.ch:8443/alod \
     --data-urlencode graph=http://data.alod.ch/graph/ge
curl -n \
     -X PUT \
     -H Content-Type:application/n-triples \
     -T target/vs.nt \
     -G https://test.lindas-data.ch:8443/alod \
     --data-urlencode graph=http://data.alod.ch/graph/vs
curl -n \
     -X PUT \
     -H Content-Type:application/n-triples \
     -T target/isil.nt \
     -G https://test.lindas-data.ch:8443/alod \
     --data-urlencode graph=http://data.alod.ch/graph/isil
curl -n \
     -X PUT \
     -H Content-Type:application/n-triples \
     -T target/meta.nt \
     -G https://test.lindas-data.ch:8443/alod \
     --data-urlencode graph=http://data.alod.ch/graph/meta