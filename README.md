# Field Programming Gate Arrays(FPGA) in Verilog

Designed a configurable fabric that can be used as any combinational/
sequential digital circuit configured by a single memory file. It is designed using
multiple instances of Logic tiles as LookUp tables and Switch boxes to connect
input wires to any of the output wires.

By using the combination of Logic tiles and Switch boxes, a configurable Fabric is
designed which can serve purposes just by giving different configuration files as
input.

## Circuits Implemented
- 8 to 1 Multiplexer
- BCD Adder
- Shift Register

## Configuration Files
Some of the configuration files are:
![image](https://user-images.githubusercontent.com/58677568/119256398-2f8f8200-bbde-11eb-9bd2-ef270d8e36f4.png)

## Results
Using different instances of memory file and different input configurations, the
designed configurable fabric could be used as any of the three circuits which include
combinational as well as sequential ones.
