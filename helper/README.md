# Helper
Für Linux-Nutzer ein alternatives Simulationskonzept.

## Benötigte Pakete
Für die Simulation von VHDL-Modulen werden folgende Pakete benötigt:
* ghdl
* gtkwave

In Arch-Linux und Manjaro können diese Pakete aus den offiziellen Repos bezogen werden. Für **ghdl** gibt es mehrere Versionen für verschiedene Compiler-Backends. [ghdl-gcc](https://www.archlinux.org/packages/community/x86_64/ghdl-gcc/) funktioniert auf jeden Fall wunderbar.

## Benutzung
Die zu entwickelnden Module müssen nach folgendem Namensschema benannt werden, damit die Skripte ordnungsgemäß funktionieren:
* Modul: modulname.vdh
* Testbench: modulname\_tb.vhd

**verify.sh** überprüft die Syntax und analysiert sämtliche Dateien mit der Endung *.vhd*. **run_simulation.sh** analysiert sämtliche *.vhd*-Dateien, statet die Elaboration und die Simulation der Testbench und zeigt das Ergebnis grafisch via **gtkwave**.
