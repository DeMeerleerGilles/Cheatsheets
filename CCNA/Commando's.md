# Cheatsheet van commando's van computer netwerken
- **puTTY** 
- `devmgmt.msc`

## Startup-config (alles wipen)
 - delete vlan.dat
 - erase startup-config
 - reload

# OSPF
    network network-address wildcard-mask area area-id
    network 192.168.20.1 0.0.0.0 area 0

    interface GigabitEthernet0/0/0
    ip ospf 10 area 0
## Router ID
    router ospf 10
    router-id 1.1.1.1
    auto-cost reference-bandwidth 1000
## passive-interface 
    router ospf 10
    passive-interface GigabitEthernet0/0/0
## interface 
    interface g0/0
    ip ospf priority 200 (max 255)
    ip ospf hello-interval 15 (default 10)
    ip ospf dead-interval 60 (default 40)
    ip ospf cost 50
## Propogate
    ip route 0.0.0.0 0.0.0.0 Serial0/1/0
    router ospf 1
    default-information originate    
## log
    show ip ospf interface
    show ip ospf neighbor
    ip ospf priority value
    show ip ospf
    show ip ospf database
    show ip ospf neighbor
    show ip protocol 
    show ip route | begin gateway
## Ipv6
    ipv6 unicast-routing
    ipv6 router ospf 10 
    interface GigabitEthernet0/0/0
    ipv6 ospf 10 area 0
    auto-cost reference-bandwidth 1000
    clear ipv6 ospf process
## 


# ACL
## standalone ACL 
    access-list 1 deny 192.168.11.0 0.0.0.255
    acces-list 1 permit any
    acces-list 1 deny any
    
    ip access-list standard File_Server_Restrictions
    permit host 192.168.20.4
    deny any

    int g0/0/0
    ip acces-group 1 out
## Extended ACL
    access-list 110 permit tcp 192.168.10.0 0.0.0.255 any eq www (443) 
    
    interface g0/0/0
    ip access-group 110 in

## Log
    show access-lists
    

# Nat
## Static Nat
    ip nat inside source static 192.168.10.254 209.165.201.5

    interface serial 0/1/0
    ip nat inside

    interface g0/0
    ip nat outside
## Dynamic Nat
    access-list 1 permit 192.168.0.0 0.0.255.255 (ACL)
    ip nat pool NAT-POOL1 209.165.200.226 209.165.200.240 netmask 255.255.255.224
    ip nat inside source list 1 pool NAT-POOL1

    interface serial 0/1/0
    ip nat inside

    interface g0/0
    ip nat outside
    ip access-list standard R2NAT
      permit 192.168.10.0 0.0.0.255
      permit 192.168.20.0 0.0.0.255
## Pat
    ip nat inside source list 2 interface s0/1/1 overload (Pat with pool)
    ip nat inside source list 1 pool ANY_POOL_NAME overload (Pat Interface)
## log
    show ip nat translation
    show run | include nat
    show ip nat statistics



# Vlan opzetten 
 ## Naam opzetten
    vlan x
    name x
 ## Bebruikers op een vlan zetten (access)
    interface F0/1
    switchport mode access
    switchport access vlan 10
 ## Trunk poorten instellen
    interface G0/1
    switchport mode trunk
    switchport trunk allowed vlan 10,... (voor extra vlans)
 ## Administrator vlan instellen
    (Switch 1 & 2 instellen als admin vlan) 
    ip instellen van op de vlan admin
    no shutdown
    (belangerijk om de default-gateway in te stellen)
 ## Testing
    do show vlan brief
    do show interfaces trunk
    show ip interface brief 
**Router**
 ## Subinterface 
    interface g0/0.10
    encapsulation dot1Q (native) 10
    ip address * *
 ## Interface enable
    interface g0/0
    no shutdown
 ## Trunk poorten instellen
    interface G0/1
    switchport mode trunk
    switchport trunk allowed vlan 10,... (voor extra vlans)
 ## Layer 3 switch
    interface vlan 10
    ip address 192.168.10.1 255.255.255.0
    no shutdown
    exit
    (Repeat)
    ip routing
    (no switchport voor als je geen vlans wilt gebuiken)
   **Geen trunk**
    interface GigabitEthernet1/0/6
    switchport mode access
    switchport access vlan 10
    exit
   **Trunk**
    interface G0/1
    switchport mode trunk
    switchport trunk allowed vlan 10,... (voor extra vlans)
   ## Ospf 
    router ospf 10
    network 192.168.10.0 0.0.0.255 area 0
    network 192.168.20.0 0.0.0.255 area 0
    network 10.10.10.0 0.0.0.3 area 0
    ^Z

# Port-Channel
 ## Port-Channel instellen (Router - Switch)
  ### Switch
    interface range f0/1 - 2
    channel-group 1 mode active
    exit
    interface port-channel 1
    switchport mode trunk
    switchport trunk allow vlan 1,2,20
  ### Router
    interface range GigabitEthernet0/0/0 - 1
    channel-group 1
    exit
    interface port-channel 1
    interface Port-channel 1.10
    encapsulation dot1Q 10     
    ip address 192.168.10.1 255.255.255.0
# HSRP
   ## HSRP op interface G0/0/1 op router R1 (active):
    interface g0/0/1
    ip address 172.16.10.1
    standby version 2
    standby 1 ip 172.16.10.1
    standby 1 priority 150
    standby 1 preempt
   ## HSPR bij Vlan
    (active) instellen op elke vlan bij de router
    (standby) vlan instellen op de standby router met de ips (andere ip dan van active)
    (switch) trunk instellen naar de standby router
    interface g0/0.10
    encapsulation dot1Q (native) 10
    ip address * *
    standby version 2
    standby 1 ip 172.16.10.1
    standby 1 priority 150
    standby 1 preempt
# Routes
   ## Static routes
    ip route 'destination(network)' 255.255.255.0 'network(destination)'
    ip route 'destination' 255.255.255.0 s0/1/0
    ipv6 route 'destination'  'network'

    show ip route static
    show ip route network
    show running-config |section ip route
   ## Floating static routes  (alternatief van static)
    ip route 0.0.0.0 0.0.0.0 'network' 5
    ipv6 route ::/0  'network' 5
   ## Default static routes (weg uit het netwerk)
    ip route 0.0.0.0 0.0.0.0 'network'
    ipv6 route ::/0  'network'
   ## static Host routes (naar 1 ip)
   ip route 209.165.200.238 255.255.255.255 198.51.100.2
# DHCP
  ## Instellen
     no service dhcp
     service dhcp
  ## IPv4
   ### DHCP instellen op router
    ip dhcp excluded-address 192.168.10.1 192.168.10.9
    ip dhcp excluded-address 192.168.10.254
    ip dhcp pool LAN-POOL-1
    network 192.168.10.0 255.255.255.0
    default-router 192.168.10.1
    dns-server 192.168.11.5
    domain-name example.com
    end

    interface g?
    ip address dhcp
    no shutdown
  ### Ip helper
    interface G0/0?
    ip helper-address IP
    exit
 ## IPv6
 ### DHCP SLAAC
    ipv6 unicast-routing
    show ipv6 interface G0/0/1 | section Joined
 ### Stateless DHCPv6
    ipv6 nd other-config-flag
    end
    show ipv6 interface g0/0/1 | begin ND
 ### Stateful DHCPv6
    int g0/0/1
    ipv6 nd managed-config-flag
    ipv6 nd prefix default no-autoconfig
    end
    show ipv6 interface g0/0/1 | begin ND
 ## IPv6 DHCP Server
 ### Stateless DHCPv6 Server
 **Server**

    ipv6 unicast-routing
    ipv6 dhcp pool IPV6-STATELESS
    dns-server 2001:db8:acad:1::254
    domain-name example.com
    exit
    interface GigabitEthernet0/0/1
    description Link to LAN
    ipv6 address fe80::1 link-local
    ipv6 address 2001:db8:acad:1::1/64
    ipv6 nd other-config-flag
    ipv6 dhcp server IPV6-STATELESS
    no shut
    end
    pc : ipconfig /all
**Client**

    ipv6 unicast-routing
    interface g0/0/1
    ipv6 enable
    ipv6 address autoconfig
    end
    show ipv6 interface brief
    show ipv6 dhcp interface g0/0/1
   ### Stateful DHCPv6 Server
**Server**

    ipv6 unicast-routing
    ipv6 dhcp pool IPV6-STATEFUL
    address prefix 2001:db8:acad:1::/64
    dns-server 2001:4860:4860::8888
    domain-name example.com
    exit
    interface GigabitEthernet0/0/1
    description Link to LAN
    ipv6 address fe80::1 link-local
    ipv6 address 2001:db8:acad:1::1/64
    ipv6 nd managed-config-flag
    ipv6 nd prefix default no-autoconfig
    ipv6 dhcp server IPV6-STATEFUL
    no shut
    end
**Client**

    ipv6 unicast-routing
    interface g0/0/1
    ipv6 enable
    ipv6 address dhcp
    end
    show ipv6 interface brief
    show ipv6 dhcp interface g0/0/1

# Switch Configuren
## Basic
    banner motd %welkom "gebruiker"%
    banner motd %Toegang enkel voor bevoegden!%
    hostname x
    description x
    no ip domain lookup
    ip domain-name ccna-lab.com
    ipv6 unicast-routing

## Data opslaan van config
    copy run start
    reset
    reload 

## BEVEILIGING
**Passwoord instellen**
    line console 0
    password pw123
    login
    service password-encrytion
**Passwoord op enable**
    enable secret 123pw
**Passwoord op VTY**
    line vty 0 4 
    password cisco 
    login
## Ip instellen
    interface FastEthernet 0/1 (met ? bekomen)
    ip address 10.0.5.1 255.255.255.0
    ipv6 address 2001:db8:acad:5::1/64
    ipv6 address fe80::2:b link-local
    no shutdown (! = no)
    ipv6 unicast-routing 
## Loopback instellen 
   interface lo1
   ip address 10.1.0.1 255.255.255.0
   ipv6 address fe80::1 link-local
   ipv6 address 2001:db8:acad:10::1/64
   no shutdown
## SSH configurene
    show ip interface brief (Vlanl open zetten)
    interface Vlan 1
    ip adress 192.168.10.5 255.255.255.0
    no shutdown
    line vty 0 4
    login local
    transport input ssh
    username selabs.local password <passwoord>
    ip domain-name selabs.local 
    crypto key generator rsa
# Troubleshoot
    show ipv6 interface brief
    show ipv6 dhcp interface g0/0/1
    do show vlan brief
    do show interfaces trunk
    show ip interface brief 
    show ip route static
    show ip route network
    show running-config |section ip route
    show interface port-channel
    show etherchannel summary
    show etherchannel port-channel
    show interface etherchannel

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
### STP
    spanning-tree mode [pvst ;rapid-pvst ; mst]
    spanning-tree vlan [VLAN_ID]
    priority [PRIORITY]
    spanning-tree bpduguard enable
    spanning-tree portfast 
    spanning-tree portfast default 











