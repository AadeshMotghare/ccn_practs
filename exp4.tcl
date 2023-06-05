set ns [new Simulator]
set mynam [open out.nam w]
$ns namtrace-all $mynam
proc finish {} {
        global ns mynam
        $ns flush-trace
	close $mynam
	exec nam out.nam &	
	exit 0
}
set n0 [$ns node]
set n1 [$ns node]
$ns duplex-link $n0 $n1 2Mb 10ms DropTail
$ns duplex-link-op $n0 $n1 orient right
$ns at 5.0 "finish"
$ns run
