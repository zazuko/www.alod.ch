PREFIX alod: <http://data.alod.ch/alod/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

INSERT {
  ?subject a alod:CrowdTag ;
    alod:taggedResource ${taggedResource.toCanonical()} ;
    alod:concept ${concept.toCanonical()} ;
    rdfs:label ${label.toCanonical()} ;
    alod:hlsId ${hlsId.toCanonical()} .
} WHERE {
  BIND(BNODE() AS ?subject)
}
