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