# Cheat sheet Computer Netwerken II

Gekomen tot module 3

## Switch configuratie

### Switch SVI configuratie

| Uitleg van het commando                                   | Commando                                                   |
| --------------------------------------------------------- | ---------------------------------------------------------- |
| Ga naar de configuratie modus                             | `Switch(config)# configure terminal`                       |
| Selecteer VLAN 99 interface                               | `Switch(config)# interface vlan 99`                        |
| Stel het IPv4-adres in voor VLAN 99                       | `Switch(config-if)# ip address 172.17.99.11 255.255.255.0` |
| Stel het IPv6-adres in voor VLAN 99                       | `Switch(config-if)# ipv6 address 2001:db8:acad:99::1/64`   |
| Activeer de interface                                     | `Switch(config-if)# no shutdown`                           |
| Verlaat de configuratie modus                             | `Switch(config-if)# end`                                   |
| Sla de huidige configuratie op als de opstartconfiguratie | `Switch# copy running-config startup-config`               |

### De default gateway instellen

| Uitleg van het commando                                   | Commando                                         |
| --------------------------------------------------------- | ------------------------------------------------ |
| Ga naar de configuratie modus                             | `Switch(config)# configure terminal`             |
| Stel de default gateway in voor IPv4                      | `Switch(config)# ip default-gateway 172.17.99.1` |
| Terug naar de privileged EXEC mode                        | `Switch(config)# end`                            |
| Sla de huidige configuratie op als de opstartconfiguratie | `Switch# copy running-config startup-config`     |


### De switchpoorten configureren op de fyysiekelaag

| Uitleg van het commando                                   | Commando                                     |
| --------------------------------------------------------- | -------------------------------------------- |
| Ga naar de configuratie modus                             | `Switch(config)# configure terminal`         |
| Selecteer de interface                                    | `Switch(config)# interface FastEthernet 0/1` |
| Stel de interface in op duplex                            | `Switch(config-if)# duplex full`             |
| Stel de interface in op speed                             | `Switch(config-if)# speed 100`               |
| Verlaat de configuratie modus                             | `Switch(config-if)# end`                     |
| Sla de huidige configuratie op als de opstartconfiguratie | `Switch# copy running-config startup-config` |

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

| Uitleg van het commando                                   | Commando                                                            |
| --------------------------------------------------------- | ------------------------------------------------------------------- |
| Ga naar de configuratie modus                             | `Switch(config)# configure terminal`                                |
| Configureer het domeinnaam systeem                        | `Switch(config)# ip domain-name example.com`                        |
| Genereer een RSA-sleutel van 1024 bits                    | `Switch(config)# crypto key generate rsa general-keys modulus 1024` |
| Maak een gebruiker aan met een wachtwoord                 | `Switch(config)# username admin secret cisco`                       |
| Stel de lijn in voor SSH                                  | `Switch(config)# line vty 0 15`                                     |
| Stel het transport in op SSH                              | `Switch(config-line)# transport input ssh`                          |
| Activeer de lijn                                          | `Switch(config-line)# login local`                                  |
| Verlaat de configuratie modus                             | `Switch(config-line)# end`                                          |
| Sla de huidige configuratie op als de opstartconfiguratie | `Switch# copy running-config startup-config`                        |

### VLAN's configureren

| Uitleg van het commando                                   | Commando                                     |
| --------------------------------------------------------- | -------------------------------------------- |
| Ga naar de configuratie modus                             | `Switch(config)# configure terminal`         |
| Maak een VLAN aan                                         | `Switch(config)# vlan 10`                    |
| Geef de VLAN een naam                                     | `Switch(config-vlan)# name Faculty`          |
| Verlaat de configuratie modus                             | `Switch(config-vlan)# end`                   |
| Sla de huidige configuratie op als de opstartconfiguratie | `Switch# copy running-config startup-config` |

### VLAN toewijzen aan een poort

| Uitleg van het commando                                   | Commando                                       |
| --------------------------------------------------------- | ---------------------------------------------- |
| Ga naar de configuratie modus                             | `Switch(config)# configure terminal`           |
| Selecteer de interface                                    | `Switch(config)# interface FastEthernet 0/1`   |
| Wijs de interface toe aan een VLAN                        | `Switch(config-if)# switchport mode access`    |
| Wijs de interface toe aan een VLAN                        | `Switch(config-if)# switchport access vlan 10` |
| Verlaat de configuratie modus                             | `Switch(config-if)# end`                       |
| Sla de huidige configuratie op als de opstartconfiguratie | `Switch# copy running-config startup-config`   |

### Trunking configureren

| Uitleg van het commando                                   | Commando                                       |
| --------------------------------------------------------- | ---------------------------------------------- |
| Ga naar de configuratie modus                             | `Switch(config)# configure terminal`           |
| Selecteer de interface                                    | `Switch(config)# interface FastEthernet 0/1`   |
| Wijs de interface toe aan een VLAN                        | `Switch(config-if)# switchport mode trunk`     |
| Zet de native VLAN op iets anders dan VLAN1                     | `Switch(config-if)# switchport trunk native vlan 99` |
| Trunk op allowed VLANs zetten                            | `Switch(config-if)# switchport trunk allowed vlan 10,20` |
| Verlaat de configuratie modus                             | `Switch(config-if)# end`                       |


## Router configuratie

### Router basisconfiguratie

| Uitleg van het commando                                   | Commando                                                           |
| --------------------------------------------------------- | ------------------------------------------------------------------ |
| Ga naar de configuratie modus                             | `Router(config)# configure terminal`                               |
| Stel het hostname in                                      | `Router(config)# hostname R1`                                      |
| Stel het wachtwoord in voor de console                    | `Router(config-line)# enable secret class`                         |
| Stel het wachtwoord in voor de console                    | `Router(config)# line console 0`                                   |
| Stel het wachtwoord in voor de console                    | `Router(config-line)# password cisco`                              |
| Stel het wachtwoord in voor de console                    | `Router(config-line)# login`                                       |
| Stel het wachtwoord in voor de console                    | `Router(config-line)# exit`                                        |
| Stel het wachtwoord in voor de console                    | `Router(config)# line vty 0 4`                                     |
| Stel het wachtwoord in voor de console                    | `Router(config-line)# password cisco`                              |
| Stel het wachtwoord in voor de console                    | `Router(config-line)# login`                                       |
| Stel het wachtwoord in voor de console                    | `Router(config-line)# exit`                                        |
| Stel het wachtwoord in voor de console                    | `Router(config)# service password-encryption`                      |
| Stel het wachtwoord in voor de console                    | `Router(config)# banner motd #Unauthorized access is prohibited!#` |
| Verlaat de configuratie modus                             | `Router(config)# end`                                              |
| Sla de huidige configuratie op als de opstartconfiguratie | `Router# copy running-config startup-config`                       |

### Router interface configuratie

| Uitleg van het commando                  | Commando                                                   |
| ---------------------------------------- | ---------------------------------------------------------- |
| Ga naar de interface configuratie modus  | `Router(config)# interface GigabitEthernet 0/0/0`          |
| Stel het IPv4-adres in voor de interface | `Router(config-if)# ip address 192.168.10.1 255.255.255.0` |
| Stel het IPv6-adres in voor de interface | `Router(config-if)# ipv6 address 2001:db8:acad:1::1/64`    |
| Beschrijf de interface                   | `Router(config-if)# description link to LAN1 interface`    |
| Activeer de interface                    | `Router(config-if)# no shutdown`                           |
| Verlaat de interface configuratie modus  | `Router(config-if)# exit`                                  |

