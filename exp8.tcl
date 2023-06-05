set ns [new Simulator]

set file1 [open out1.nam w]
$ns namtrace-all $file1

set file2 [open out1.tr w]
$ns trace-all $file2

proc finish {} {
	global ns file1 file2
	$ns flush-trace
	close $file1
	close $file2
	exec nam out1.nam & 
	exit 0
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]

$ns duplex-link $n0 $n1 0.3Mb 10ms DropTail
$ns duplex-link $n0 $n2 0.3Mb 10ms DropTail
$ns duplex-link $n1 $n3 0.3Mb 10ms DropTail
$ns duplex-link $n2 $n3 0.3Mb 10ms DropTail
$ns duplex-link $n3 $n4 0.3Mb 10ms DropTail
$ns duplex-link $n4 $n5 0.3Mb 10ms DropTail

$ns duplex-link-op $n0 $n1 orient right-up
$ns duplex-link-op $n0 $n2 orient right-down
$ns duplex-link-op $n1 $n3 orient right-down
$ns duplex-link-op $n2 $n3 orient up-right
$ns duplex-link-op $n3 $n4 orient right
$ns duplex-link-op $n4 $n5 orient right

set udp [new Agent/UDP]
$ns attach-agent $n0 $udp

set sink [new Agent/Null]
$ns attach-agent $n5 $sink
$ns connect $udp $sink

set ftp [new Application/Traffic/CBR]
$ftp attach-agent $udp

$ns at 0.1 "$ftp start"
$ns at 5.0 "$ftp stop"
$ns at 6.0 "finish"
$ns run
