MAKEFLAGS=--warn-undefined-variables
 
.PHONY=help clean-results
 
.DEFAULT_GOAL := help
 
SCRIPT_AUTHOR=Andy Chow
 
BLUE=\033[36m
NO_COLOUR=\033[0m
 
define command_description
	@printf "${BLUE}  %-30s${NO_COLOUR} %s\n" $(1) $(2)
endef
 
#prereq:
#	mkdir results || true

#run: prereq log
#	touch results/results.md
 
#log:
#	$(ls)
 
clean-results:
	git clean -dfx

final: ./code/hello_world.o
	$(shell gcc -o hello_world ./code/hello_world.o -nostdlib -static)

hello_world.o: ./code/hello_world.s
	$(shell as ./code/hello_world.s -o ./code/hello_world.o)

help:
	@echo -e "Usage: make [target] ...\n"
	
	$(call command_description, "final", "Builds the project")
	$(call command_description, "clean-results", "Remove the results directory.")
	
	@echo -e "\nScript prepared by $(SCRIPT_AUTHOR)"

