@echo off
netsh advfirewall set DomainProfile state off
netsh advfirewall firewall set rule group="network discovery" new enable=yes

