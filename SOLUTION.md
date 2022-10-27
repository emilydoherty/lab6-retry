You should measure the basic latency  using the `ping` command - this can be construed to be the latency without any RPC or python overhead.

You should examine your results and provide a short paragraph with your observations of the performance difference between REST and gRPC. You should explicitly comment on the role that network latency plays -- it's useful to know that REST makes a new TCP connection for each query while gRPC makes a single TCP connection that is used for all the queries.

|  Method 	        | Local  	| Same-Zone  	|  Different Region |
|---	            |---	    |---	        |---	            |
|   REST add	    | 5.808  | 2.504         | 287.781           |
|   gRPC add	    | 1.111     | 0.674         | 146.255           |
|   REST rawimg	    | 6.303 	| 3.958         | 1182.131          |
|   gRPC rawimg	    | 9.488     | 10.270         | 197.411  	        |
|   REST dotproduct	| 3.252     | 2.808  	    | 288.343           |
|   gRPC dotproduct	| 1.507     | 0.758         | 145.961  	        |
|   REST jsonimg	| 39.025    | 33.929        | 1323.061          |
|   gRPC jsonimg	| 40.856    | 31.974        | 490.451           |
|   PING            | 0.042     | 0.378         | 141.352           |


gRPC's took less time for all cases except for the REST rawimg in local and same-zone calls. It came close to gRPC across local and same-zone calls for the jsonimg as well. gRPC clearly saves time because it only makes the TCP connection once compared to REST but the difference is small when data is small. 
For same-zone and local cases the difference was vairable but mostly very small, but connecting to the Europe server consistently REST call times were twice as big or more. Using the ping as an indicator, we could venture that latency was a main reason for the drastic difference in times for the Europe server call.
