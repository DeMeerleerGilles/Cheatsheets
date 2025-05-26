# Cheat sheet Computer Netwerken III

## Inhoudsopgave

<!-- Aan te vullen -->

## OSPF: Open Shortest Path First

| Commando                 | Betekenis               |
| ------------------------ | ----------------------- |
| `show ip ospf neighbor`  | Toon de OSPF buren      |
| `show ip ospf interface` | Toon de OSPF interfaces |
| `ip ospf cost`           | De kost instellen       |

**<span style="color:red">Belangrijk: OSPF wordt zwaar ondervraagd op het examen.</span>**

Labo's:
2.3.11, 2.4.11

Examenvragen uit het verleden:

1. Op welke waarde staan de hello en dead interval?

OSPF opzetten:

Stappen om OSPF op te zetten:
1. Start OSPF proces met een router ID
2. Definieer de netwerken die OSPF moeten gebruiken
3. Stel de OSPF kost in indien nodig
4. Controleer de OSPF buren en interfaces
5. Controleer de OSPF routing tabel

De wildcard kan je betpalen aan de hand van de subnetten die zijn aangesloten op de router. De wildcard is het omgekeerde van het subnetmasker.

| CIDR (Prefix) | Subnetmasker    | Wildcardmasker (inverse) |
| ------------- | --------------- | ------------------------ |
| /8            | 255.0.0.0       | 0.255.255.255            |
| /16           | 255.255.0.0     | 0.0.255.255              |
| /24           | 255.255.255.0   | 0.0.0.255                |
| /25           | 255.255.255.128 | 0.0.0.127                |
| /26           | 255.255.255.192 | 0.0.0.63                 |
| /27           | 255.255.255.224 | 0.0.0.31                 |
| /28           | 255.255.255.240 | 0.0.0.15                 |
| /29           | 255.255.255.248 | 0.0.0.7                  |
| /30           | 255.255.255.252 | 0.0.0.3                  |
| /31           | 255.255.255.254 | 0.0.0.1                  |
| /32           | 255.255.255.255 | 0.0.0.0                  |


| Commando                                                                               | Betekenis                                                                            |
| -------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| `router ospf 10`                                                                       | Start OSPF proces 10                                                                 |
| `router-id 6.6.6.6`                                                                    | Stel de router ID in                                                                 |
| `network 10.0.0.0 0.0.0.3 area 0 `                                                     | Stel de inverse maskers in voor alle aangesloten subnetten                           |
| `interface GigabitEthernet0/0/0`                                                       | Ga naar de interface configuratie modus voor GigabitEthernet0/0/0                    |
| `ip ospf 10 area 0`                                                                    | Activeer OSPF op de interfaces                                                       |
| `passive-interface GigabitEthernet0/0/0`                                               | Maak interface passief (geen routing updates naar netwerken waar ze niet nodig zijn) |
| `BC-1(config-if)#ip ospf priority 255`                                                 | De prioriteit van een interface instellen  (in dit voorbeeld op het max)             |
| `BC-1(config)#ip route 0.0.0.0 0.0.0.0 Serial0/1/1`                                    | Default route naar de ISP cloud                                                      |
| `BC-1(config)#router ospf 10 BC-1(config-router)#default-information originate`        | Automatisch de default route naar alle routers in het netwerk verdelen               |
| `P2P-1(config)#router ospf 10 P2P-1(config-router)#auto-cost reference-bandwidth 1000` | Automatisch de kost instellen afhankelijk van het type verbinding (Fe of Ge)         |
| `ip ospf cost 50`                                                                      | Kost voor een interface instellen                                                    |
| `ip ospf hello-interval 20`                                                            | Hello op standaard waarde zetten                                                     |
| `ip ospf dead-interval 80`                                                             | Dead op standaard waarde zetten                                                      |

ACLs configureren:
| Commando            | Betekenis                                                 |
| ------------------- | --------------------------------------------------------- |
| `access-list 100 permit tcp 172.22.34.64 0.0.0.31 host 172.22.34.62 eq ftp` |  Toestaan van FTP verkeer van een subnet naar een host |
| `R1(config)# access-list 100 permit icmp 172.22.34.64 0.0.0.31 host 172.22.34.62` | Toestaan van ICMP verkeer van een subnet naar een host |
| `show access-lists` | Toon alle huidige ACLs |

