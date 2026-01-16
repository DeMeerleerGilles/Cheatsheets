# Cheat sheet CCNA 4

## OSPFv3

We beginnen met IPv6 routing in te schakelen op alle routers:

```
enable
configure terminal
ipv6 unicast-routing
exit
```

Hierna maken we een OSPFv3 proces aan op elke router:

### Router 1

```
configure terminal
ipv6 router ospf 10
router-id 1.1.1.1
exit
```

### Router 2

```
configure terminal
ipv6 router ospf 10
router-id 2.2.2.2
exit
```

### Router 3

```
configure terminal
ipv6 router ospf 10
router-id 3.3.3.3
exit
```

Op alle routers moeten we nu de interfaces toevoegen aan het OSPFv3 proces:

### Router 1

```
configure terminal

interface g0/0
ipv6 ospf 10 area 0
exit

interface s0/0/0
ipv6 ospf 10 area 0
exit

interface s0/0/1
ipv6 ospf 10 area 0
exit
```

### Router 2

```
configure terminal

interface g0/0
ipv6 ospf 10 area 0
exit

interface s0/0/0
ipv6 ospf 10 area 0
exit

interface s0/0/1
ipv6 ospf 10 area 0
exit
```

### Router 3

```
configure terminal

interface g0/0
ipv6 ospf 10 area 0
exit

interface s0/0/0
ipv6 ospf 10 area 0
exit

interface s0/0/1
ipv6 ospf 10 area 0
exit
```

We contoleren of OSPFv3 correct is geconfigureerd met het volgende commando:

```
show ipv6 ospf neighbor
show ipv6 route ospf
```

## OSPFv3 met multi-area

### RA

We beginnen met IPv6 routing in te schakelen

```
enable
configure terminal
ipv6 unicast-routing
exit
```

OSPFv3 configureren we als volgt:

```
ipv6 router ospf 1
router-id 1.1.1.1
exit
```

Interfaces koppelen aan juiste area:

```
configure terminal

interface g0/0
ipv6 ospf 1 area 1
exit

interface g0/1
ipv6 ospf 1 area 1
exit

interface s0/0/0
ipv6 ospf 1 area 0
exit
```

### RB

```
enable
configure terminal
ipv6 unicast-routing

ipv6 router ospf 1
router-id 2.2.2.2
exit
```

```
configure terminal

interface g0/0
ipv6 ospf 1 area 0
exit

interface s0/0/0
ipv6 ospf 1 area 0
exit

interface s0/0/1
ipv6 ospf 1 area 0
exit
```

### RC

```
enable
configure terminal
ipv6 unicast-routing

ipv6 router ospf 1
router-id 3.3.3.3
exit
```

```
configure terminal

interface g0/0
ipv6 ospf 1 area 2
exit

interface g0/1
ipv6 ospf 1 area 2
exit

interface s0/0/1
ipv6 ospf 1 area 0
exit
```

Ten slotte controleren we de configuratie:

```
show ipv6 ospf
show ipv6 ospf neighbor
show ipv6 route ospf
```

## Dynamic NAT

We beginnen met het toelaten van al het verkeer van de hosts uit het interne netwerk 172.16.0.0/16.

Hiervoor maken we op R2 een ACL aan:

```
R2> enable
R2# configure terminal
R2(config)# access-list 1 permit 172.16.0.0 0.0.255.255
R2(config)# exit
```

Vervolgens configureren we een NAT pool met 2 publieke IP-adressen:

```
R2(config)# ip nat pool NAT_POOL 209.165.200.229 209.165.200.230 netmask 255.255.255.252
R2(config)# exit
```

ACL koppelen aan de NAT pool:

```
R2(config)# ip nat inside source list 1 pool NAT_POOL
R2(config)# exit
```
Nu moeten we de inside en outside interfaces definiëren:

```
R2(config)# interface s0/0/1
R2(config-if)# ip nat inside
R2(config-if)# exit

R2(config)# interface s0/0/0
R2(config-if)# ip nat outside
R2(config-if)# exit
R2(config)# end
```

## PAT

nog aan te vullen

## ACLs

Op router 2

```
R2> enable
R2# configure terminal
# Maak de ACL aan (ontzeg 11.0 netwerk, sta de rest toe)
R2(config)# access-list 1 deny 192.168.11.0 0.0.0.255
R2(config)# access-list 1 permit any
# Pas de ACL toe op de interface naar de WebServer
R2(config)# interface GigabitEthernet0/0
R2(config-if)# ip access-group 1 out
R2(config-if)# end
R2# write  # Sla de configuratie op
```

Op router 3

```
R3> enable
R3# configure terminal
# Maak de ACL aan (ontzeg 10.0 netwerk, sta de rest toe)
R3(config)# access-list 1 deny 192.168.10.0 0.0.0.255
R3(config)# access-list 1 permit any
# Pas de ACL toe op de interface naar PC3
R3(config)# interface GigabitEthernet0/0
R3(config-if)# ip access-group 1 out
R3(config-if)# end
R3# write
```