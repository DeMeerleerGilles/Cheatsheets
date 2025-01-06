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

### De switchpoorten configureren op de fyysiekelaag

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

| Uitleg van het commando       | Commando                             |
| ----------------------------- | ------------------------------------ |
| Ga naar de configuratie modus | `Switch(config)# configure terminal` |
| Maak een VLAN aan             | `Switch(config)# vlan 10`            |
| Geef de VLAN een naam         | `Switch(config-vlan)# name Faculty`  |
| Verlaat de configuratie modus | `Switch(config-vlan)# end`           |

### VLAN toewijzen aan een poort

| Uitleg van het commando            | Commando                                       |
| ---------------------------------- | ---------------------------------------------- |
| Ga naar de configuratie modus      | `Switch(config)# configure terminal`           |
| Selecteer de interface             | `Switch(config)# interface FastEthernet 0/1`   |
| Wijs de interface toe aan een VLAN | `Switch(config-if)# switchport mode access`    |
| Wijs de interface toe aan een VLAN | `Switch(config-if)# switchport access vlan 10` |
| Verlaat de configuratie modus      | `Switch(config-if)# end`                       |

Meerdere poorte tegelijk toewijzen aan een VLAN
```
Switch(config)# interface range FastEthernet 0/1 - 24
Switch(config-if-range)# switchport mode access
Switch(config-if-range)# switchport access vlan 10
Switch(config-if-range)# end
Switch# copy running-config startup-config
```
### Trunking configureren

| Uitleg van het commando                     | Commando                                                 |
| ------------------------------------------- | -------------------------------------------------------- |
| Ga naar de configuratie modus               | `Switch(config)# configure terminal`                     |
| Selecteer de interface                      | `Switch(config)# interface FastEthernet 0/1`             |
| Wijs de interface toe aan een VLAN          | `Switch(config-if)# switchport mode trunk`               |
| Zet de native VLAN op iets anders dan VLAN1 | `Switch(config-if)# switchport trunk native vlan 99`     |
| Trunk op allowed VLANs zetten               | `Switch(config-if)# switchport trunk allowed vlan 10,20` |
| Verlaat de configuratie modus               | `Switch(config-if)# end`                                 |

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
| Stel het wachtwoord in voor de console                    | `Router(config)# line vty 0 15`                                     |
| Stel het wachtwoord in voor de console                    | `Router(config-line)# password cisco`                              |
| Stel het wachtwoord in voor de console                    | `Router(config-line)# login`                                       |
| Stel het wachtwoord in voor de console                    | `Router(config-line)# exit`                                        |
| Stel het wachtwoord in voor de console                    | `Router(config)# service password-encryption`                      |
| Stel het wachtwoord in voor de console                    | `Router(config)# banner motd #Unauthorized access is prohibited!#` |
| Verlaat de configuratie modus                             | `Router(config)# end`                                              |
| Sla de huidige configuratie op als de opstartconfiguratie | `Router# copy running-config startup-config`                       |

### Ipv6 routing inschakelen

| Uitleg van het commando | Commando                           |
| ----------------------- | ---------------------------------- |
| Ga naar de configuratie modus | `Router(config)# configure terminal` |
| IPv6 routing inschakelen | `Router(config)# ipv6 unicast-routing` |
| Verlaat de configuratie modus | `Router(config)# end` |

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
| Addressen exclusief maken                                 | `Router(config)# ip dhcp excluded-address 192.168.10.1 192.168.10.9` |
| DHCP inschakelen                                          | `Router(config)# ip dhcp pool LAN1`                                  |
| Stel het netwerk in voor de DHCP pool                     | `Router(dhcp-config)# network 192.168.10.0 255.255.255.0`            |
| Stel de standaardgateway in voor de DHCP pool             | `Router(dhcp-config)# default-router 192.168.10.1`                   |
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

| Uitleg van het commando                                   | Commando                                                             |
| --------------------------------------------------------- | -------------------------------------------------------------------- |
| Ga naar de configuratie modus                             | `Router(config)# configure terminal`                                 |
| DHCPv6 inschakelen                                        | `Router(config)# ipv6 dhcp pool LAN1`                                |
| Stel het netwerk in voor de DHCPv6 pool                   | `Router(config-dhcpv6)# address prefix 2001:db8:acad:1::/64`         |
| Stel de standaardgateway in voor de DHCPv6 pool           | `Router(config-dhcpv6)# dns-server 2001:db8:acad:1::1`               |
| Stel de DNS-server in voor de DHCPv6 pool                 | `Router(config-dhcpv6)# domain-name example.com`                     |
| Stel de lease time in voor de DHCPv6 pool                 | `Router(config-dhcpv6)# prefix-delegation pool LAN1 lifetime 1800 600`|
| Verlaat de configuratie modus                             | `Router(config-dhcpv6)# end`                                         |
| Sla de huidige configuratie op als de opstartconfiguratie | `Router# copy running-config startup-config`                         |

DHCv6 relay agent, DHCPv6 relay agent is nodig als de DHCPv6 server niet in hetzelfde subnet zit als de clients.

```bash
Router(config)# interface GigabitEthernet 0/0/1
Router(config-if)# ipv6 dhcp relay destination 2001:db8:acad:2::2 # IP van de DHCPv6 server
Router(config-if)# end
```

### HSRP configuratie

| Uitleg van het commando       | Commando                                  |
| ----------------------------- | ----------------------------------------- |
| Ga naar de configuratie modus | `Router(config)# configure terminal`      |
| HSRP inschakelen               | `Router(config)# standby 1 ip 192.168.1.254` |
| HSRP inschakelen               | `Router(config)# standby 1 priority 150` |
| HSRP inschakelen               | `Router(config)# standby 1 preempt` |
