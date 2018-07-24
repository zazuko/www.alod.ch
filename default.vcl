#
# See the VCL chapters in the Users Guide at https://www.varnish-cache.org/docs/
# and https://www.varnish-cache.org/trac/wiki/VCLExamples for more examples.

# Marker to tell the VCL compiler that this VCL has been adapted to the
# new 4.0 format.
vcl 4.0;

#import std;
#import bodyaccess;

backend alod {
    .host = "alod_web";
    .port = "8080";
}

sub vcl_recv {
    # Happens before we check if we have this in cache already.
    #
    # Typically you clean up the request here, removing cookies you don't need,
    # rewriting the request, etc.
#    unset req.http.X-Body-Len;

    set req.http.X-Forwarded-Port = "80";

    set req.backend_hint = alod;

#  if (req.method == "POST" && req.url ~ "/query$") {
#      std.log("Will cache POST for: " + req.host + req.url);
#      std.cache_req_body(500KB);
#      set req.http.X-Body-Len = bodyaccess.len_req_body();
#      if (req.http.X-Body-Len == "-1") {
#          return(pass);
#      }
#      return (hash);
#  }

}

sub vcl_backend_response {
    # Happens after we have read the response headers from the backend.
    #
    # Here you clean the response headers, removing silly Set-Cookie headers
    # and other mistakes your backend does.
}

sub vcl_deliver {
    # Happens when we have all the pieces we need, and are about to send the
    # response to the client.
    #
    # You can do accounting or modifying the final object here.
}

sub vcl_synth {
    if (resp.status == 301 || resp.status == 302) {
        set resp.http.location = resp.reason;
        set resp.reason = "Moved";
        return (deliver);
    }
}

#sub vcl_hash {
#    # To cache POST and PUT requests
#    if (req.http.X-Body-Len) {
#        bodyaccess.hash_req_body();
#    } else {
#        hash_data("");
#    }
#}
#
#sub vcl_backend_fetch {
#    if (bereq.http.X-Body-Len) {
#        set bereq.method = "POST";
#    }
#}
