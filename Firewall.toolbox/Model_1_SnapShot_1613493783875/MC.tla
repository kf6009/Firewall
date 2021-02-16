---- MODULE MC ----
EXTENDS Firewall, TLC

\* CONSTANT definitions @modelParameterConstants:0Protocols
const_1613493778805277000 == 
{"http", "ftp", "smtp"}
----

\* CONSTANT definitions @modelParameterConstants:1AcceptList
const_1613493778805278000 == 
{
[p \in Packet |-> p.protocol = "http"],
[p \in Packet |-> p.dest.port = 4],
[p \in Packet |-> p.source.ip \in 1..2]
}
----

\* CONSTANT definitions @modelParameterConstants:2RejectList
const_1613493778805279000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:3Ports
const_1613493778805280000 == 
1..5
----

\* CONSTANT definitions @modelParameterConstants:4IPs
const_1613493778805281000 == 
1..10
----

\* CONSTANT definition @modelParameterDefinitions:0
def_ov_1613493778805282000 ==
1..4
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1613493778805283000 ==
\A p \in forwarded : Accept(p) /\ \lnot Reject(p)
----
=============================================================================
\* Modification History
\* Created Tue Feb 16 16:42:58 GMT 2021 by alunm
