set ns [new Simulator]
$ns color 1 Black
$ns color 2 Blue
$ns color 3 Yellow
$ns color 4 Red

set nf [open out.nam w]
$ns namtrace-all $nf
proc finish {} {
        global ns nf
        $ns flush-trace
	close $nf
	exec nam out.nam &	
	exit 0
}
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
$ns duplex-link $n0 $n1 2Mb 20ms DropTail
$ns duplex-link $n0 $n2 2Mb 20ms DropTail
$ns duplex-link $n0 $n3 2Mb 20ms DropTail
$ns duplex-link $n0 $n4 2Mb 20ms DropTail
$ns duplex-link-op $n0 $n1 orient left
$ns duplex-link-op $n0 $n2 orient up
$ns duplex-link-op $n0 $n3 orient right
$ns duplex-link-op $n0 $n4 orient down
$ns at 5.0 "finish"
$ns run
