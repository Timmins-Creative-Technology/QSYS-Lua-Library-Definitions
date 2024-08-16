---@meta

---Additional Information: [Q-SYS Help: HttpClient](https://q-syshelp.qsc.com/#Control_Scripting/Using_Lua_in_Q-Sys/HttpClient.htm?TocPath=Design%257CControl%2520Scripting%257CQ-SYS%2520Extensions%2520to%2520Lua%257C_____10)
HttpClient = {}


---@class HTTPGetParams
---@field Url string
---@field Headers? HTTPHeaders
---@field User? string Authentication username.
---@field Password? string Authentication password.
---@field Auth? HTTPAuth Authorization mode only used if User and Password are entered.
---@field Timeout? number Timeout in seconds for the HttpClient call.
---@field EventHandler fun(params:self, code:HttpStatusCodes, data:string, error:string|nil, headers:HTTPHeaders) Called upon success or failure of request.

---Execute an HTTP "GET" request.<br>Event handler will be called after the request is complete.<br>Functionally equivalent to HttpClient.Download()<br><br>Additional information: [MDN Docs: GET](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/GET)
---@param params HTTPGetParams
function HttpClient.Get(params) end


---Execute an HTTP "GET" request.<br>Event handler will be called after the request is complete.<br>Functionally equivalent to HttpClient.Get()<br><br>Additional information: [MDN Docs: GET](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/GET)
---@param params HTTPGetParams
function HttpClient.Download(params) end


---Execute an HTTP "DELETE" request.<br>Event handler will be called after the request is complete.<br><br>Additional information: [MDN Docs: DELETE](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/DELETE)
---@param params HTTPGetParams
function HttpClient.Delete(params) end


---@class HTTPPutParams: HTTPGetParams
---@field Data string Data to upload.
---@field EventHandler fun(params:self, code:HttpStatusCodes, data:string, error:string|nil, headers:HTTPHeaders) Called upon success or failure of request.

---Execute an HTTP "PUT" request.<br>Event handler will be called after the request is complete.<br><br>Alternatively, use HttpClient.Upload() and specify the "PUT" method.<br><br>Additional information: [MDN Docs: PUT](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PUT)
---@param params HTTPPutParams
function HttpClient.Put(params) end


---Execute an HTTP "POST" request.<br>Event handler will be called after the request is complete.<br><br>Alternatively, use HttpClient.Upload() and specify the "POST" method.<br><br>Additional information: [MDN Docs: POST](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST)
---@param params HTTPPutParams
function HttpClient.Post(params) end


---Execute an HTTP "PATCH" request.<br>Event handler will be called after the request is complete.<br><br>Alternatively, use HttpClient.Upload() and specify the "PATCH" method.<br><br>Additional information: [MDN Docs: PATCH](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PATCH)
---@param params HTTPPutParams
function HttpClient.Patch(params) end


---@class HTTPUploadParams: HTTPGetParams
---@field Method "POST" | "PUT" | "PATCH" Method for uploading.
---@field Data string Data to upload.
---@field EventHandler fun(params:self, code:HttpStatusCodes, data:string, error:string|nil, headers:HTTPHeaders) Called upon success or failure of request.

---Execute an HTTP "PUT", "POST", or "PATCH" request.<br>Event handler will be called after the request is complete.<br><br>Alternatively, use the individual method functions:<br>HttpClient.Put()<br>HttpClient.Post()<br>HttpClient.Patch()<br><br>Additional information: [MDN Docs: PUT](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PUT)
---@param params HTTPUploadParams
function HttpClient.Upload(params) end


---@class HTTPCreateURLParams
---@field Host string Base URL
---@field Port? IPPort
---@field Path? string URL path extension
---@field Query? {[string]: string}

---Combine URL elements to create an encoded URL string.
---@param params HTTPCreateURLParams
---@return string # Encoded URL<br>{<br> Host =  "`http://www.go.com`",<br> Path = "this/is/a/path with space",<br> Query = {["name with space"] = "blue", term = "hello | there" }<br>}<br>==> `http://www.go.com/this/is/a/path%20with%20space?term=hello%20%7c%20there&name%20with%20space=blue`
function HttpClient.CreateUrl(params) end


---@param params {[string]: string}
---@return string # Encoded string<br>{ ["name with space"] = "blue", term = "hello | there" }<br>==> term=hello%20%7c%20there&name%20with%20space=blue
function HttpClient.EncodeParams(params) end


---@param string string
---@return string # Encoded string<br>"this is | some test"<br>==> this%20is%20%7c%20some%20test
function HttpClient.EncodeString(string) end


---@param string string
---@return string # Decoded string<br>"this%20is%20%7c%20some%20test"<br>==> this is | some test
function HttpClient.DecodeString(string) end


---@alias HTTPAuth
---|"any" (default) Most secure mode is automatically selected.
---|"basic" Credentials are unencrypted.
---|"digest" Credentials are encrypted.


---@alias HttpStatusCodes
---|100 # Continue
---|101 # Switching Protocols
---|102 # Processing
---|103 # Early Hints
---|200 # OK
---|201 # Created
---|202 # Accepted
---|203 # Non-Authoritative Information
---|204 # No Content
---|205 # Reset Content
---|206 # Partial Content
---|207 # Multi-Status
---|208 # Already Reported
---|226 # IM Used
---|300 # Multiple Choices
---|301 # Moved Permanently
---|302 # Found
---|303 # See Other
---|304 # Not Modified
---|305 # Use Proxy
---|307 # Temporary Redirect
---|308 # Permanent Redirect
---|400 # Bad Request
---|401 # Unauthorized
---|402 # Payment Required
---|403 # Forbidden
---|404 # Not Found
---|405 # Method Not Allowed
---|406 # Not Acceptable
---|407 # Proxy Authentication Required
---|408 # Request Timeout
---|409 # Conflict
---|410 # Gone
---|411 # Length Required
---|412 # Precondition Failed
---|413 # Payload Too Large
---|414 # URI Too Long
---|415 # Unsupported Media Type
---|416 # Range Not Satisfiable
---|417 # Expectation Failed
---|418 # I'm a teapot
---|421 # Misdirected Request
---|422 # Unprocessable Entity
---|423 # Locked
---|424 # Failed Dependency
---|425 # Too Early
---|426 # Upgrade Required
---|428 # Precondition Required
---|429 # Too Many Requests
---|431 # Request Header Fields Too Large
---|451 # Unavailable For Legal Reasons
---|500 # Internal Server Error
---|501 # Not Implemented
---|502 # Bad Gateway
---|503 # Service Unavailable
---|504 # Gateway Timeout
---|505 # HTTP Version Not Supported
---|506 # Variant Also Negotiates
---|507 # Insufficient Storage
---|508 # Loop Detected
---|510 # Not Extended
---|511 # Network Authentication Required


---@class HTTPHeaders
---@field [string] string|string[] 													Additional header information: [MDN Docs: HTTP Headers](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers)
---@field A-IM? string|string[]                         		Specifies the version of the instance-manipulations used.
---@field Accept? string|string[]                       		Specifies the media types that are acceptable for the response.
---@field Accept-Charset? string|string[]               		Indicates what character sets are acceptable.
---@field Accept-Encoding? string|string[]              		Indicates the content-codings that are acceptable in the response.
---@field Accept-Language? string|string[]              		Indicates the preferred languages for the response.
---@field Accept-Patch? string|string[]                 		Specifies which patch document formats this server supports.
---@field Accept-Ranges? string|string[]                		Indicates that the server supports range requests.
---@field Access-Control-Allow-Credentials? string|string[] Indicates whether the response to the request can be exposed when the credentials flag is true.
---@field Access-Control-Allow-Headers? string|string[]  		Used in response to a preflight request to indicate which HTTP headers can be used when making the actual request.
---@field Access-Control-Allow-Methods? string|string[]  		Specifies the methods allowed when accessing the resource in response to a preflight request.
---@field Access-Control-Allow-Origin? string|string[]   		Specifies the origins that are allowed to access the resource.
---@field Access-Control-Expose-Headers? string|string[] 		Lists the headers that clients are allowed to access.
---@field Access-Control-Max-Age? string|string[]        		Indicates how long the results of a preflight request can be cached.
---@field Access-Control-Request-Headers? string|string[]  	Used when issuing a preflight request to let the server know which HTTP headers will be used when the actual request is made.
---@field Access-Control-Request-Method? string|string[]  	Used when issuing a preflight request to let the server know the HTTP method that will be used when the actual request is made.
---@field Age? string|string[]                           		Indicates the age of the object in a proxy cache in seconds.
---@field Allow? string|string[]                         		Lists the set of methods supported by the resource.
---@field Alt-Svc? string|string[]                       		Used to indicate that the server supports HTTP/2 for that resource.
---@field Authorization? string|string[]                 		Contains credentials to authenticate a user-agent with a server.
---@field Cache-Control? string|string[]                 		Directives for caching mechanisms in both requests and responses.
---@field Clear-Site-Data? string|string[]               		Clears browsing data (cookies, storage, cache) associated with the requesting website.
---@field Connection? string|string[]                    		Controls whether the network connection stays open after the current transaction.
---@field Content-Disposition? string|string[]           		Indicates if the content is expected to be displayed inline in the browser, or as an attachment.
---@field Content-Encoding? string|string[]              		Used to compress the media-type.
---@field Content-Language? string|string[]              		Describes the natural language(s) of the intended audience for the enclosed content.
---@field Content-Length? string|string[]                		Indicates the size of the entity-body, in bytes, sent to the recipient.
---@field Content-Location? string|string[]              		Indicates an alternate location for the returned data.
---@field Content-Range? string|string[]                 		Indicates where in the full body the partial message belongs.
---@field Content-Security-Policy? string|string[]       		Used to prevent a wide range of attacks, including XSS and data injection.
---@field Content-Type? string|string[]                  		Indicates the media type of the resource.
---@field Cookie? string|string[]                        		Sends stored HTTP cookies from the user-agent to the server.
---@field Date? string|string[]                          		The date and time at which the message was originated.
---@field ETag? string|string[]                          		A unique identifier for a specific version of a resource.
---@field Expect? string|string[]                        		Indicates that particular server behaviors are required by the client.
---@field Expect-CT? string|string[]                     		Allows sites to opt into reporting and/or enforcement of Certificate Transparency requirements.
---@field Expires? string|string[]                       		Gives the date/time after which the response is considered stale.
---@field Feature-Policy? string|string[]                		Allows a site to control which features and APIs can be used in the browser.
---@field Forwarded? string|string[]                     		Contains information from the client-facing side of proxy servers.
---@field From? string|string[]                          		Contains an Internet email address for a human user who controls the requesting user-agent.
---@field Host? string|string[]                          		Specifies the host and port number of the server to which the request is being sent.
---@field If-Match? string|string[]                      		Makes the request conditional by comparing the provided ETag with the current one.
---@field If-Modified-Since? string|string[]             		Makes the request conditional by comparing the provided date with the last modification date.
---@field If-None-Match? string|string[]                 		Makes the request conditional by accepting the request only if the ETag does not match.
---@field If-Range? string|string[]                      		Allows partial GET requests to be conditionally fulfilled.
---@field If-Unmodified-Since? string|string[]           		Makes the request conditional by accepting it only if the resource has not been modified since the specified date.
---@field Last-Modified? string|string[]                 		Indicates the date and time at which the resource was last modified.
---@field Location? string|string[]                      		Used in redirection or when a new resource has been created.
---@field Origin? string|string[]                        		Indicates the origin of the request.
---@field Pragma? string|string[]                        		Contains implementation-specific directives that might apply to any agent along the request-response chain.
---@field Proxy-Authenticate? string|string[]            		Demands authentication to access the proxy.
---@field Proxy-Authorization? string|string[]           		Contains credentials to authenticate the client with the proxy.
---@field Range? string|string[]                         		Requests only part of an entity, specified by a range of bytes.
---@field Referer? string|string[]                       		Indicates the address of the previous web page from which a link to the currently requested page was followed.
---@field Retry-After? string|string[]                   		Indicates how long the user-agent should wait before making a follow-up request.
---@field Save-Data? string|string[]                     		Allows clients to indicate they would prefer reduced data usage.
---@field Sec-Fetch-Dest? string|string[]                		Indicates the request's destination.
---@field Sec-Fetch-Mode? string|string[]                		Indicates the mode of the request.
---@field Sec-Fetch-Site? string|string[]                		Indicates the relationship between a request initiator's origin and its destination origin.
---@field Sec-Fetch-User? string|string[]                		Indicates whether the request is triggered by user activation.
---@field Sec-WebSocket-Accept? string|string[]          		Used in the WebSockets opening handshake.
---@field Server? string|string[]                        		Contains information about the software used by the origin server to handle the request.
---@field Set-Cookie? string|string[]                    		Sends cookies from the server to the user-agent.
---@field SourceMap? string|string[]                     		Links generated code to a source map.
---@field Strict-Transport-Security? string|string[]     		Enforces secure connections to the server.
---@field TE? string|string[]                            		Indicates the transfer encodings the user-agent is willing to accept.
---@field Timing-Allow-Origin? string|string[]           		Specifies origins that are allowed to see values of attributes retrieved via features of the Resource Timing API.
---@field Tk? string|string[]                            		Indicates whether the request complies with the Do Not Track (DNT) user preference.
---@field Trailer? string|string[]                       		Specifies that the indicated set of header fields is present in the trailer of a message.
---@field Transfer-Encoding? string|string[]             		Specifies the form of encoding used to safely transfer the entity to the user.
---@field Upgrade? string|string[]                       		Allows the client to specify the protocol it would like to upgrade to.
---@field User-Agent? string|string[]                    		Contains information about the user-agent originating the request.
---@field Vary? string|string[]                          		Determines how to match future request headers to decide whether a cached response can be used.
---@field Via? string|string[]                           		Informs the server of intermediate proxies through which the request was sent.
---@field Warning? string|string[]                       		Carries additional information about the status or transformation of a message.
---@field WWW-Authenticate? string|string[]              		Defines the authentication method that should be used to access a resource.
---@field X-Content-Type-Options? string|string[]        		Prevents the browser from interpreting files as a different MIME type to what is specified in the Content-Type header.
---@field X-DNS-Prefetch-Control? string|string[]        		Controls DNS prefetching, a feature that speeds up the loading of web pages by pre-resolving domain names.
---@field X-Frame-Options? string|string[]               		Provides clickjacking protection by preventing the page from being framed.
---@field X-XSS-Protection? string|string[]              		Enables cross-site scripting filtering.