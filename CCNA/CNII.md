# Cheat sheet Computer Netwerken II

## Switch configuratie

### Switch basisconfiguratie

| Uitleg van het commando               | Commando                                                           |
| ------------------------------------- | ------------------------------------------------------------------ |
| Ga naar de configuratie modus         | `Switch(config)# configure terminal`                               |
| Stel het hostname in                  | `Switch(config)# hostname S1`                                      |
| DNS lookup uitschakelen               | `Switch(config)# no ip domain-lookup`                              |
| Privilege wachtwoord instellen        | `Switch(config)# enable secret class`                              |
| Wachtwoord instellen voor de console  | `Switch(config)# line console 0`                                   |
| Wachtwoord instellen voor de console  | `Switch(config-line)# password cisco`                              |
| Wachtwoord instellen voor de console  | `Switch(config-line)# login`                                       |
| Wachtwoord instellen voor de console  | `Switch(config-line)# exit`                                        |
| Wachtwoord instellen voor vty         | `Switch(config)# line vty 0 15`                                    |
| Wachtwoord instellen voor vty         | `Switch(config-line)# password cisco`                              |
| Wachtwoord instellen voor vty         | `Switch(config-line)# login`                                       |
| Wachtwoord instellen voor vty         | `Switch(config-line)# exit`                                        |
| Wachtwoord encryptie instellen        | `Switch(config)# service password-encryption`                      |
| Banner instellen                      | `Switch(config)# banner motd #Unauthorized access is prohibited!#` |
| Alle ongebruikte poorten uitschakelen | `Switch(config)# interface range FastEthernet 0/1 - 24`            |
| Alle ongebruikte poorten uitschakelen | `Switch(config-if-range)# shutdown`                                |
| Verlaat de configuratie modus         | `Switch(config-if-range)# exit`                                    |

### Switch SVI configuratie

| Uitleg van het commando                | Commando                                                   |
| -------------------------------------- | ---------------------------------------------------------- |
| Ga naar de configuratie modus          | `Switch(config)# configure terminal`                       |
| Selecteer VLAN 99 interface            | `Switch(config)# interface vlan 99`                        |
| Stel het IPv4-adres in voor VLAN 99    | `Switch(config-if)# ip address 172.17.99.11 255.255.255.0` |
| Default gateway instellen voor VLAN 99 | `Switch(config-if)# ip default-gateway 172.17.99.0`        |
| Stel het IPv6-adres in voor VLAN 99    | `Switch(config-if)# ipv6 address 2001:db8:acad:99::1/64`   |
| Activeer de interface                  | `Switch(config-if)# no shutdown`                           |
| Verlaat de configuratie modus          | `Switch(config-if)# end`                                   |

### De default gateway instellen

| Uitleg van het commando              | Commando                                         |
| ------------------------------------ | ------------------------------------------------ |
| Ga naar de configuratie modus        | `Switch(config)# configure terminal`             |
| Stel de default gateway in voor IPv4 | `Switch(config)# ip default-gateway 172.17.99.1` |
| Terug naar de privileged EXEC mode   | `Switch(config)# end`                            |

### De switchpoorten configureren op de fysiekelaag

| Uitleg van het commando        | Commando                                     |
| ------------------------------ | -------------------------------------------- |
| Ga naar de configuratie modus  | `Switch(config)# configure terminal`         |
| Selecteer de interface         | `Switch(config)# interface FastEthernet 0/1` |
| Stel de interface in op duplex | `Switch(config-if)# duplex full`             |
| Stel de interface in op speed  | `Switch(config-if)# speed 100`               |
| Verlaat de configuratie modus  | `Switch(config-if)# end`                     |

### De configuratie van de switch verifiëren

| Uitleg van het commando                      | Commando                                   |
| -------------------------------------------- | ------------------------------------------ |
| Bekijk de IP-configuratie van de switch      | `Switch# show ip interface brief`          |
| Bekijk de IPv6-configuratie van de switch    | `Switch# show ipv6 interface brief`        |
| De interface status en configuratie bekijken | `Switch# show interfaces FastEthernet 0/1` |
| De startup-configuratie bekijken             | `Switch# show startup-config`              |
| De running-configuratie bekijken             | `Switch# show running-config`              |
| Informatie over het flashgeheugen bekijken   | `Switch# show flash`                       |
| De versie van de switch bekijken             | `Switch# show version`                     |
| Geschiedenis van de commando's bekijken      | `Switch# show history`                     |
| De MAC-adrestabel bekijken                   | `Switch# show mac address-table`           |
| Etherchannel samenvatting bekijken           | `Switch# show etherchannel summary`        |
| De spanning-tree samenvatting bekijken       | `Switch# show spanning-tree summary`       |


### SSH inschakelen op een switch

| Uitleg van het commando                   | Commando                                                            |
| ----------------------------------------- | ------------------------------------------------------------------- |
| Ga naar de configuratie modus             | `Switch(config)# configure terminal`                                |
| Configureer het domeinnaam systeem        | `Switch(config)# ip domain-name example.com`                        |
| Genereer een RSA-sleutel van 1024 bits    | `Switch(config)# crypto key generate rsa general-keys modulus 1024` |
| Maak een gebruiker aan met een wachtwoord | `Switch(config)# username admin secret cisco`                       |
| Stel de lijn in voor SSH                  | `Switch(config)# line vty 0 15`                                     |
| Stel het transport in op SSH              | `Switch(config-line)# transport input ssh`                          |
| Activeer de lijn                          | `Switch(config-line)# login local`                                  |
| Verlaat de configuratie modus             | `Switch(config-line)# end`                                          |

### VLAN's configureren

| Uitleg van het commando                      | Commando                                                          |
| -------------------------------------------- | ----------------------------------------------------------------- |
| Ga naar de configuratie modus                | `Switch(config)# configure terminal`                              |
| Maak een VLAN aan                            | `Switch(config)# vlan 10`                                         |
| Geef de VLAN een naam                        | `Switch(config-vlan)# name Faculty`                               |
| VLAN een ip-adres geven (enkel op ML switch) | `Switch(config-vlan)# ip address XXX.XXX.XXX.XXX YYY.YYY.YYY.YYY` |
| Verlaat de configuratie modus                | `Switch(config-vlan)# end`                                        |


### VLAN toewijzen aan een poort

| Uitleg van het commando            | Commando                                       |
| ---------------------------------- | ---------------------------------------------- |
| Ga naar de configuratie modus      | `Switch(config)# configure terminal`           |
| Selecteer de interface             | `Switch(config)# interface FastEthernet 0/1`   |
| Wijs de interface toe aan een VLAN | `Switch(config-if)# switchport mode access`    |
| Wijs de interface toe aan een VLAN | `Switch(config-if)# switchport access vlan 10` |
| Verlaat de configuratie modus      | `Switch(config-if)# end`                       |

Meerdere poorten tegelijk toewijzen aan een VLAN
```
Switch(config)# interface range FastEthernet 0/1 - 24
Switch(config-if-range)# switchport mode access
Switch(config-if-range)# switchport access vlan 10
Switch(config-if-range)# end
Switch# copy running-config startup-config
```
### Trunking configureren

| Uitleg van het commando                      | Commando                                                 |
| -------------------------------------------- | -------------------------------------------------------- |
| Ga naar de configuratie modus                | `Switch(config)# configure terminal`                     |
| Selecteer de interface                       | `Switch(config)# interface FastEthernet 0/1`             |
| Wijs de interface toe aan een VLAN           | `Switch(config-if)# switchport mode trunk`               |
| Zet de native VLAN op iets anders dan VLAN1  | `Switch(config-if)# switchport trunk native vlan 99`     |
| Trunk op allowed VLANs zetten (static trunk) | `Switch(config-if)# switchport trunk allowed vlan 10,20` |
| Verlaat de configuratie modus                | `Switch(config-if)# end`                                 |


### STP configureren

| Uitleg van het commando       | Commando                                  |
| ----------------------------- | ----------------------------------------- |
| Ga naar de configuratie modus | `Switch(config)# configure terminal`      |
| STP inschakelen               | `Switch(config)# spanning-tree mode pvst` |
| Verlaat de configuratie modus | `Switch(config)# end`                     |


### Etherchannel configureren

| Uitleg van het commando                       | Commando                                               |
| --------------------------------------------- | ------------------------------------------------------ |
| Ga naar de configuratie modus                 | `Switch(config)# configure terminal`                   |
| Selecteer de interfaces                       | `Switch(config)# interface range FastEthernet 0/1 - 2` |
| Trunking inschakelen                          | `Switch(config-if-range)# switchport mode trunk`       |
| DTP uitschakelen                              | `Switch(config-if-range)# switchport nonegotiate`      |
| Maak een etherchannel aan   (PAgP)            | `Switch(config-if-range)# channel-group 1 mode on`     |
| Maak een etherchannel aan   (LACP)            | `Switch(config-if-range)# channel-group 1 mode active` |
| Maak een etherchannel aan   (Negotiated LACP) | `Switch(config-if-range)# channel-group 1 mode auto`   |
| Verlaat de configuratie modus                 | `Switch(config-if-range)# end`                         |
| Controleer de etherchannel                    | `Switch# show etherchannel summary`                    |


## Router configuratie

### Router basisconfiguratie

| Uitleg van het commando                                   | Commando                                                           |
| --------------------------------------------------------- | ------------------------------------------------------------------ |
| Ga naar de configuratie modus                             | `Router(config)# configure terminal`                               |
| Stel het hostname in                                      | `Router(config)# hostname R1`                                      |
| DNS lookup uitschakelen                                   | `Router(config)# no ip domain-lookup`                              |
| Stel het wachtwoord in voor de console                    | `Router(config-line)# enable secret class`                         |
| Stel het wachtwoord in voor de console                    | `Router(config)# line console 0`                                   |
| Stel het wachtwoord in voor de console                    | `Router(config-line)# password cisco`                              |
| Stel het wachtwoord in voor de console                    | `Router(config-line)# login`                                       |
| Stel het wachtwoord in voor de console                    | `Router(config-line)# exit`                                        |
| Stel het wachtwoord in voor de console                    | `Router(config)# line vty 0 15`                                    |
| Stel het wachtwoord in voor de console                    | `Router(config-line)# password cisco`                              |
| Stel het wachtwoord in voor de console                    | `Router(config-line)# login`                                       |
| Stel het wachtwoord in voor de console                    | `Router(config-line)# exit`                                        |
| Stel het wachtwoord in voor de console                    | `Router(config)# service password-encryption`                      |
| Minimale wachtwoord lengte instellen                      | `Router(config)# security passwords min-length 8`                  |
| Stel het wachtwoord in voor de console                    | `Router(config)# banner motd #Unauthorized access is prohibited!#` |
| Verlaat de configuratie modus                             | `Router(config)# end`                                              |
| Sla de huidige configuratie op als de opstartconfiguratie | `Router# copy running-config startup-config`                       |

### Ipv6 routing inschakelen

| Uitleg van het commando       | Commando                               |
| ----------------------------- | -------------------------------------- |
| Ga naar de configuratie modus | `Router(config)# configure terminal`   |
| IPv6 routing inschakelen      | `Router(config)# ipv6 unicast-routing` |
| Verlaat de configuratie modus | `Router(config)# end`                  |

Default route instellen, dit is de route die de router gebruikt als hij geen route heeft voor een bepaald netwerk.
```bash
Router(config)# ip route ::/0 2001:db8:acad:2::2
```

### Router interface configuratie

| Uitleg van het commando                  | Commando                                                   |
| ---------------------------------------- | ---------------------------------------------------------- |
| Ga naar de interface configuratie modus  | `Router(config)# interface GigabitEthernet 0/0/0`          |
| Stel het IPv4-adres in voor de interface | `Router(config-if)# ip address 192.168.10.1 255.255.255.0` |
| Stel het IPv6-adres in voor de interface | `Router(config-if)# ipv6 address 2001:db8:acad:1::1/64`    |
| Beschrijf de interface                   | `Router(config-if)# description link to LAN1 interface`    |
| Activeer de interface                    | `Router(config-if)# no shutdown`                           |
| Verlaat de interface configuratie modus  | `Router(config-if)# exit`                                  |

### Router sub interface configuratie inter-VLAN routing
| Uitleg van het commando                                        | Commando                                                      |
| -------------------------------------------------------------- | ------------------------------------------------------------- |
| Ga naar de interface configuratie modus                        | `Router(config)# interface GigabitEthernet 0/0/1`             |
| Interface op no shutdown zetten                                | `Router(config-if)# no shutdown`                              |
| Ga naar de interface configuratie modus                        | `Router(config)# interface GigabitEthernet 0/0/1.10`          |
| Stel de encapsulatie in voor de interface (laatste nummer voor |
| wat achter de punt staat)                                      | `Router(config-subif)# encapsulation dot1Q 10`                |
| Stel het IPv4-adres in voor de interface                       | `Router(config-subif)# ip address 192.168.10.1 255.255.255.0` |
| Stel het IPv6-adres in voor de interface                       | `Router(config-subif)# ipv6 address 2001:db8:acad:1::1/64`    |
| Beschrijf de interface                                         | `Router(config-subif)# description link to LAN1 interface`    |
| Activeer de interface                                          | `Router(config-subif)# no shutdown`                           |
| Verlaat de interface configuratie modus                        | `Router(config-subif)# exit`                                  |

### DHCPv4 configuratie

| Uitleg van het commando                                   | Commando                                                             |
| --------------------------------------------------------- | -------------------------------------------------------------------- |
| Ga naar de configuratie modus                             | `Router(config)# configure terminal`                                 |
| Adressen exclusief maken                                 | `Router(config)# ip dhcp excluded-address 192.168.10.1 192.168.10.9` |
| DHCP inschakelen                                          | `Router(config)# ip dhcp pool LAN1`                                  |
| Stel het netwerk in voor de DHCP pool                     | `Router(dhcp-config)# network 192.168.10.0 255.255.255.0`            |
| Stel de standaard gateway in voor de DHCP pool             | `Router(dhcp-config)# default-router 192.168.10.1`                   |
| Stel de DNS-server in voor de DHCP pool                   | `Router(dhcp-config)# dns-server 192.168.11.5`                       |
| Stel de lease time in voor de DHCP pool                   | `Router(dhcp-config)# lease 0 2 0`                                   |
| Verlaat de configuratie modus                             | `Router(dhcp-config)# end`                                           |
| Sla de huidige configuratie op als de opstartconfiguratie | `Router# copy running-config startup-config`                         |

DHCP relay agent, DHCP relay agent is nodig als de DHCP server niet in hetzelfde subnet zit als de clients.

```bash
Router(config)# interface GigabitEthernet 0/0/1
Router(config-if)# ip helper-address 10.1.1.2 # IP van de DHCP server
Router(config-if)# end
```
Adres van router via DHCP van ISP verkrijgen
```bash
Router(config)# interface GigabitEthernet 0/0/0
Router(config-if)# ip address dhcp
Router(config-if)# no shutdown
Router(config-if)# end
```

### DHCPv6 configuratie

Voorbeeld van een stateless DHCPv6 configuratie:

| Uitleg van het commando                                   | Commando                                                               |
| --------------------------------------------------------- | ---------------------------------------------------------------------- |
| Ga naar de configuratie modus                             | `Router(config)# configure terminal`                                   |
| DHCPv6 inschakelen                                        | `Router(config)# ipv6 dhcp pool LAN1`                                  |
| Stel het netwerk in voor de DHCPv6 pool                   | `Router(config-dhcpv6)# address prefix 2001:db8:acad:1::/64`           |
| Stel de standaard gateway in voor de DHCPv6 pool           | `Router(config-dhcpv6)# dns-server 2001:db8:acad:1::1`                 |
| Stel de DNS-server in voor de DHCPv6 pool                 | `Router(config-dhcpv6)# domain-name example.com`                       |
| Stel de lease time in voor de DHCPv6 pool                 | `Router(config-dhcpv6)# prefix-delegation pool LAN1 lifetime 1800 600` |
| Verlaat de configuratie modus                             | `Router(config-dhcpv6)# end`                                           |
| Sla de huidige configuratie op als de opstartconfiguratie | `Router# copy running-config startup-config`                           |

DHCv6 relay agent, DHCPv6 relay agent is nodig als de DHCPv6 server niet in hetzelfde subnet zit als de clients.

```bash
Router(config)# interface GigabitEthernet 0/0/1
Router(config-if)# ipv6 dhcp relay destination 2001:db8:acad:2::2 # IP van de DHCPv6 server
Router(config-if)# end
```

### HSRP configuratie

| Uitleg van het commando       | Commando                                     |
| ----------------------------- | -------------------------------------------- |
| Ga naar de configuratie modus | `Router(config)# configure terminal`         |
| HSRP inschakelen              | `Router(config)# standby 1 ip 192.168.1.254` |
| HSRP inschakelen              | `Router(config)# standby 1 priority 150`     |
| HSRP inschakelen              | `Router(config)# standby 1 preempt`          |

### Static routing - statische routering
Een statische route is een route die handmatig wordt geconfigureerd door de netwerkbeheerder. Statische routes worden meestal gebruikt wanneer een router slechts één of twee routes kent en deze routes niet vaak veranderen. Je kan een statische route ook een administratieve afstand geven, dit is een getal tussen 1 en 255. Hoe lager het getal hoe beter de route.
Opbouw van het commando: 

```bash
ip route [bestemmingsnetwerk] [subnetmasker] [next-hop IP / interface] [administrative distance]
```

| Uitleg van het commando                                                 | Commando                                                           |
| ----------------------------------------------------------------------- | ------------------------------------------------------------------ |
| Ga naar de configuratie modus                                           | `Router(config)# configure terminal`                               |
| Statische route toevoegen                                               | `Router(config)# ip route 0.0.0.0 0.0.0.0 10.10.10.1`              |
| Statische route met administratieve afstand toevoegen (laatste 5 is AD) | `Edge_Router(config)# ip route 0.0.0.0 0.0.0.0 10.10.10.5 5`       |
| Ipv6 statische route toevoegen                                          | `Edge_Router(config)# ipv6 route ::/0 2001:db8:a:1::1`             |
| Ipv6 met administratieve afstand toevoegen                              | `Edge_Router(config)# ipv6 route ::/0 2001:db8:a:1::1 5`           |
| Statische route naar een LAN toevoegen                                  | `ISP1(config)# ip route 192.168.10.16 255.255.255.240 10.10.10.2`  |
| Statische route naar een LAN toevoegen met IPv6                         | `ISP1(config)# ipv6 route 2001:db8:acad:2::/64 2001:db8:acad:1::2` |

| CIDR | Subnetmasker    |
| ---- | --------------- |
| /24  | 255.255.255.0   |
| /25  | 255.255.255.128 |
| /26  | 255.255.255.192 |
| /27  | 255.255.255.224 |
| /28  | 255.255.255.240 |
| /29  | 255.255.255.248 |

## Subnetting
1. Netwerkadres en subnetmasker: voorbeeld IP: 192.168.1.0/24 (subnetmasker: 255.255.255.0)
2. Afvragen hoeveel subnets en hosts nodig zijn.
3. Formule voor aantal subnets: 2^x (x = aantal bits voor subnetting)
4. Formule voor aantal hosts: 2^y - 2 (y = aantal bits voor host)
5. Voorbeeld: Je wil 4 subnets en 64 hosts per subnet
   * 2^2 = 4 subnets
   * 2^6 - 2 = 62 hosts per subnet
6. Nieuw subnetmasker: 24 + 2 (aantal extra nieuwe hostbits) = 26 bits
Subnetverdeling:

| Subnet   | Netwerkadres  | Eerste host   | Laatste host  | Broadcast     |
| -------- | ------------- | ------------- | ------------- | ------------- |
| Subnet 1 | 192.168.1.0   | 192.168.1.1   | 192.168.1.62  | 192.168.1.63  |
| Subnet 2 | 192.168.1.64  | 192.168.1.65  | 192.168.1.126 | 192.168.1.127 |
| Subnet 3 | 192.168.1.128 | 192.168.1.129 | 192.168.1.190 | 192.168.1.191 |
| Subnet 4 | 192.168.1.192 | 192.168.1.193 | 192.168.1.254 | 192.168.1.255 |

## Subnetting met VLSM

1. Voorbeeld: 192.168.1.0/24 (subnetmasker: 255.255.255.0).

### Aantal subnetten en hosts per subnet:

Maak een lijst van de benodigde subnetten en het aantal hosts per subnet (groot naar klein).

Voorbeeld:
- Subnet 1: 50 hosts.
- Subnet 2: 20 hosts.
- Subnet 3: 10 hosts.

Gebruik de formule:

```
2^h - 2 ≥ Aantal hosts
```
Waarbij `h` het aantal hostbits is.

Voorbeeld:

- **Subnet 1 (50 hosts):**
    - `2^6 - 2 = 62` → 6 hostbits nodig → Subnetmasker = /26 (255.255.255.192).
- **Subnet 2 (20 hosts):**
    - `2^5 - 2 = 30` → 5 hostbits nodig → Subnetmasker = /27 (255.255.255.224).
- **Subnet 3 (10 hosts):**
    - `2^4 - 2 = 14` → 4 hostbits nodig → Subnetmasker = /28 (255.255.255.240).

### Subnet Tabel

| Subnet   | Netwerkadres | Subnetmasker          | Aantal Hosts | Hostbereik                   | Broadcast     |
| -------- | ------------ | --------------------- | ------------ | ---------------------------- | ------------- |
| Subnet 1 | 192.168.1.0  | /26 (255.255.255.192) | 62           | 192.168.1.1 - 192.168.1.62   | 192.168.1.63  |
| Subnet 2 | 192.168.1.64 | /27 (255.255.255.224) | 30           | 192.168.1.65 - 192.168.1.94  | 192.168.1.95  |
| Subnet 3 | 192.168.1.96 | /28 (255.255.255.240) | 14           | 192.168.1.97 - 192.168.1.110 | 192.168.1.111 |

### Remote Management
* `int vlan <management vlan>`
  * `ip address x.x.x.x y.y.y.y`
  * `no shutdown`
* `ip default-gateway x.x.x.x`

### Interface and IP Configuration
* `interface <type> <number>` - Enters interface configuration mode (ex. `interface g0/1`)
  * `ip address <ip> <subnet mask>` - Sets IP address and subnet mask on an interface
  * `no shutdown` - Enables the interface
* `show ip interface brief` - Displays IP addresses and status of all interfaces
* `ip default-gateway <ip>` - Sets the default gateway for the device (important for routers in a switched network)


## 2. Switching Concepts

### Displaying and Verifying MAC Address Table
* `show mac address-table` - Displays the MAC address table
* `show mac address-table dynamic` - Shows dynamically learned MAC addresses
* `clear mac address-table dynamic` - Clears dynamic MAC addresses from the MAC address table

### Port Security
* `interface <type> <number>` - Enters the interface configuration mode (e.g., `interface f0/1`)
  * `switchport mode access` - Sets the port to access mode
  * `switchport port-security` - Enables port security on the interface
  * `switchport port-security maximum <number>` - Limits the number of MAC addresses on the port
  * `switchport port-security mac-address sticky` - Enables sticky MAC address learning
  * `switchport port-security violation <protect|restrict|shutdown>` - Configures port violation mode
* `show port-security` - Shows port security status for all interfaces
* `show port-security interface <interface>` - Displays port security details for a specific interface
* `clear port-security sticky` - Clears the sticky MAC addresses

## 3. VLANs


### Access Ports
* `interface <type> <number>` - Enters the interface configuration mode
  * `switchport mode access` - Sets the port to access mode
  * `switchport access vlan <vlan-id>` - Assigns the port to a specific VLAN
  * `mls qos trust cos` - Sets quality of service
  * `switchport voice vlan <voice-vlan-id>` - Sets VOICE vlan

### Trunking
* `interface <type> <number>` - Enters the interface configuration mode
  * `switchport mode trunk` - Configures the port to trunk mode
  * `switchport trunk allowed vlan <vlan-list>` - Specifies VLANs allowed on the trunk
* `show interfaces trunk` - Displays trunk configuration details

### VLAN Management
* `no vlan <vlan-id>` - Deletes the VLAN
* `interface <type> <number>`
  * `no switchport access vlan` - Unassigns a port from VLAN
  * `no switchport trunk allowed vlan` - Removes allowed VLANs from trunk
  * `no switchport trunk native vlan` - Removes native VLAN configuration

### VLAN Verification
* `show vlan` - Displays all VLANs configured on the switch (including active and allowed VLANs)
* `show vlan brief` - Shows a summary of all VLANs on the switch
* `show interfaces vlan <vlan-id>` - Displays the status of a specific VLAN
* `show interfaces <number> switchport` - Shows switchport information of a specific interface

## 4. Inter-VLAN Routing

### Router-on-a-Stick Configuration

1. Create and name the VLANs
```
vlan <vlan-id>
name <vlan-name>
```

2. Create the management interface
```
interface vlan <vlan-id>
ip address <ip> <subnet mask>
no shutdown
```

3. Configure access ports
```
interface <interface-id>
switchport mode access
switchport access vlan <vlan-id>
```

4. Configure trunking ports
```
interface <interface-id>
switchport mode trunk
switchport trunk allowed vlan <vlan-id>,<vlan-id>
```

5. Configure subinterfaces
```
interface <interface>.<subinterface-number>
encapsulation dot1Q <vlan-id> (native)
ip address <ip> <subnet mask>
```

6. Turn the interface on
```
interface <interface>
no shutdown
```

### Layer 3 Switch (SVI) Configuration

#### Switch Configuration
1. Create and name the VLANs
```
vlan <vlan-id>
name <vlan-name>
```

2. Create the SVI VLAN interfaces
```
interface vlan <vlan-id>
ip address <ip> <subnet mask>
no shutdown
```

3. Configure access ports
```
interface <interface-id>
switchport mode access
switchport access vlan <vlan-id>
```

4. Configure trunking ports
```
interface <interface-id>
switchport mode trunk
switchport trunk encapsulation dot1q
(switchport trunk native vlan <vlan-id>)
```

5. Enable IP routing
```
ip routing
```

#### Routing Configuration on Layer 3 Switch
1. Configure the routed port
```
interface <interface-id>
no switchport
ip address <ip> <subnet mask>
no shutdown
```

2. Configure routing (ex. static routing)

### Verification
* `show ip route` - Displays the routing table (to check if VLANs are reachable)
* `ping <ip-address>` - Verifies connectivity between VLANs

## 5. STP Concepts

### STP Steps
1. Determine root bridge (switch with lowest Bridge ID)
   * `spanning-tree vlan [vlan_id] priority [priority_value]`
   * `spanning-tree vlan [vlan_id] root primary`

2. Determine root ports (port with lowest port cost, e.g., 19 for 100 Mbps)
   * `spanning-tree vlan [vlan_id] cost [value]`

3. Determine designated ports

4. Determine alternate (blocked) ports

### Troubleshooting
* `show spanning-tree`
* `show spanning-tree vlan <id>`
* `show spanning-tree interface <id>`
* `show spanning-tree root`

### PortFast and BPDU Guard
* Enable PortFast (only on access ports): `spanning-tree portfast`
* Enable BPDU Guard (only on access ports): `spanning-tree bpduguard enable`

## 6. EtherChannel

### 1. ON Configuration
* ON - ON configuration:
```
interface range <range>
  switchport mode trunk
  shutdown
  channel-group <id> mode on
  no shutdown

interface port-channel <id>
  switchport mode trunk
  switchport trunk allowed vlan <id>,<id>
```

### 2. PAgP (Port Aggregation Protocol)
* DESIRABLE - DESIRABLE or DESIRABLE - AUTO configuration:
```
interface range <range>
  switchport mode trunk
  shutdown
  channel-group <id> mode auto/desirable
  no shutdown

interface port-channel <id>
  switchport mode trunk
  switchport trunk allowed vlan <id>,<id>
```

### 3. LACP (Link Aggregation Control Protocol)
* ACTIVE - ACTIVE or ACTIVE - PASSIVE configuration:
```
interface range <range>
  switchport mode trunk
  shutdown
  channel-group <id> mode active/passive
  no shutdown

interface port-channel <id>
  switchport mode trunk
  switchport trunk allowed vlan <id>,<id>
```

### 4. Troubleshooting
* `show int port-channel`
* `show etherchannel summary`
* `show etherchannel port-channel`
* `show interfaces etherchannel`
* `show run`

## 7. DHCPv4

### Router Configuration
* `ip dhcp excluded-address 192.168.10.1`
* `ip dhcp pool <NAAM>`
  * `network 192.168.10.0 255.255.255.0`
  * `default-router 192.168.10.1`
  * `dns-server 192.168.11.5`
* `ip helper-address 10.0.0.1` (DHCP server in other LAN)

### Router as Client
* `interface <INTERFACE>`
  * `ip address dhcp`
  * `no shutdown`

## 8. SLAAC and DHCPv6

### Important Note
* Default gateway is automatically determined by RA link-local address, NOT BY DHCP

### Process Overview
#### SLAAC
1. Router Solicitation
2. Router Advertisement

### RA Flags
| A   | O   | M   | Mode         |
| --- | --- | --- | ------------ |
| 1   | 0   | 0   | SLAAC Only   |
| 1   | 1   | 0   | SLAAC + DHCP |
| 0   | X   | 1   | DHCP Only    |

### Requirements
1. **GUA**: `ipv6 address 2001:db8:acad:1::1/64`
2. **Link-local**: `ipv6 address fe80::1 link-local`
3. **Multicast groups**: `ipv6 unicast-routing`
   * All-nodes group (FF02::1)
   * All routers multicast group (FF02::2)

### Configuration Types

#### SLAAC Only (1 0 0)
Router Configuration:
```
ipv6 unicast-routing
interface <INTERFACE>
  ipv6 address 2001:db8:acad:1::1/64
  ipv6 enable
  no ipv6 nd other-config-flag
  no ipv6 nd managed-config-flag
  no shutdown
```

#### SLAAC + DHCP (1 1 0)
Router Configuration:
```
ipv6 unicast-routing
interface <INTERFACE>
  ipv6 address 2001:db8:acad:1::1/64
  ipv6 enable
  ipv6 nd other-config-flag
  no ipv6 nd managed-config-flag
  no shutdown
```

DHCP Server Configuration:
```
ipv6 dhcp pool <POOL_NAAM>
  dns-server 2001:db8:2::53
  domain-name example.com
interface <INTERFACE>
  ipv6 dhcp server <POOL_NAAM>
```

Router as Client:
```
ipv6 unicast-routing
interface <INTERFACE>
  ipv6 enable
  ipv6 address autoconfig
  no shutdown
```

#### DHCP Only (0 X 1)
Router Configuration:
```
ipv6 unicast-routing
interface <INTERFACE>
  ipv6 address 2001:db8:acad:1::1/64
  ipv6 enable
  ipv6 nd other-config-flag
  ipv6 nd managed-config-flag
  no shutdown
```

DHCP Server Configuration:
```
ipv6 dhcp pool <POOL_NAAM>
  address prefix 2001:db8:acad:1::/64
  dns-server 2001:db8:2::53
  domain-name example.com
interface <INTERFACE>
  ipv6 dhcp server <POOL_NAAM>
```

Router as Client:
```
ipv6 unicast-routing
interface <INTERFACE>
  ipv6 enable
  ipv6 address dhcp
  no shutdown
```

## 9. FHRP (HSRP)

### Basic Configuration
```
interface <interface-id>
  standby version 2
  ip address <real-ip> <subnet-mask>
  standby <group-number> ip <virtual-ip>
```

### Additional Settings
* Set priority: `standby <group-number> priority <0-150>`
* Enable preemption: `standby <group-number> preempt`

## 14. Routing Concepts

### Route Types in Routing Table
* `L` = Address assigned to router interface
* `C` = Directly connected network
* `S` = Static route
* `O` = Dynamically learned
* `*` = Default route

### Viewing Routing Information
* `show ip route` - Displays the routing table with all learned routes
* `show ip protocols` - Shows routing protocols enabled on the router

### Configuring Router Interfaces
* `interface <type> <number>` - Enters interface configuration mode
  * `ip address <ip> <subnet mask>` - Sets the IP address on the router's interface
  * `no shutdown` - Enables the interface

## 15. IP Static Routing

### Standard Static Route
* `ip route <destination-network> <subnet mask> <next-hop-ip or exit-interface>`
  * Example: `ip route 192.168.1.0 255.255.255.0 10.1.1.2`

### Fully Specified Static Route
* `ip route <destination-network> <subnet mask> <exit-interface> <next-hop-ip>`
  * Example: `ip route 192.168.1.0 255.255.255.0 GigabitEthernet 0/0/1 10.1.1.2`
* Note: If next-hop is IPv6 link-local, use fully specified route

### Default Static Route
* IPv4: `ip route 0.0.0.0 0.0.0.0 <next-hop-ip or exit-interface>`
* IPv6: `::/0`

### Floating Static Route (Backup Path)
* Primary: `ip route 0.0.0.0 0.0.0.0 <next-hop-ip>`
* Backup: `ip route 0.0.0.0 0.0.0.0 <next-hop-ip> 5`

### Static Route Verification
* `show ip route` - Verifies static routes in the routing table
* `show running-config | include ip route` - Displays all static