------------------------------ MODULE Firewall ------------------------------
EXTENDS Naturals
CONSTANT AcceptList,
         RejectList,
         Protocols,
         IPs,
         Ports

VARIABLE forwarded \* packets forwarded on through the firewall
----
Address == [ ip:IPs, port:Ports ] \* address has port and ip

(*
A Packet has a source and destination address,
and a protocol
*)
Packet  == [ source:Address,
             dest:Address,
             protocol: Protocols ]

Rule == [ Packet -> BOOLEAN ] \* A Rule maps from packets to boolean values
----
Init == forwarded = {}

Reject(p) ==
    \E rule \in RejectList   :
        /\ rule[p]

Accept(p) ==
    \E rule \in AcceptList :
        /\ rule[p]

Firewall(p) == \* Firewall acts on a packet
    IF Accept(p)/\\lnot Reject(p) 
    THEN forwarded' = forwarded \union {p}
    ELSE UNCHANGED forwarded

Next ==
    \E packet \in Packet : Firewall(packet)

=============================================================================
\* Modification History
\* Last modified Wed Feb 17 10:17:27 GMT 2021 by alunm
\* Created Sat Feb 13 18:27:34 GMT 2021 by alunm
