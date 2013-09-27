#openscad -o output/bushing.stl bushing.scad
MODELS = $(filter-out lib.scad, $(wildcard *.scad))

STL_FILES = $(MODELS:%.scad=stl/%.stl)
GCODE_FILES = $(MODELS:%.scad=gcode/%.gcode)

all: $(STL_FILES) $(GCODE_FILES) gcode stl

stl:
	mkdir stl
gcode:
	mkdir gcode

gcode/%.gcode: stl/%.stl gcode slic3r_config.ini
	slic3r --load slic3r_config.ini -o $@ $< 

stl/%.stl: %.scad lib.scad stl
	openscad -o $@ $<

clean:
	rm stl/*.stl
