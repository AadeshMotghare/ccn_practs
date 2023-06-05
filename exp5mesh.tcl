set ns [new Simulator]
set mytrace [open out.tr w]
$ns trace-all $mytrace
set mynam [open out.nam w]
$ns namtrace-all $mynam

proc finish {} {
global ns mytrace mynam
$ns flush-trace 
close $mytrace
close $mynam
exec nam out.nam &
exit 0
}
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
$ns duplex-link $n0 $n1 2Mb 10ms DropTail
$ns duplex-link $n0 $n2 2Mb 10ms DropTail
$ns duplex-link $n0 $n3 2Mb 10ms DropTail
$ns duplex-link $n1 $n2 2Mb 10ms DropTail
$ns duplex-link $n1 $n3 2Mb 10ms DropTail
$ns duplex-link $n2 $n3 2Mb 10ms DropTail
$ns duplex-link-op $n0 $n1 orient right
$ns duplex-link-op $n0 $n2 orient right-down
$ns duplex-link-op $n0 $n3 orient down
$ns duplex-link-op $n1 $n2 orient down
$ns duplex-link-op $n1 $n3 orient left-down
$ns duplex-link-op $n2 $n3 orient left
$ns at 5.0 "finish"
$ns run
