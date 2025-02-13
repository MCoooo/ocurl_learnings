package main

import "core:fmt"
import "core:os"
import "core:strconv"
import "core:strings"
import "core:sys/windows"

import "./curl"
import color "./odin-color"


bool_to_string :: proc(bool: bool) -> string {
	result := bool == true ? "true" : "false"
	return result
}

display_help :: proc() {
	oblue("")
	oblue("Usage: ip.exe [options]")
	oblue("Options:")
	oblue("  --any          Display all available adapters.")
	oblue("Example:")
	oblue("  ip.exe --any")
	oblue("")
}

main :: proc() {

	arguments := os.args[1:]

	for arg in arguments {
		if arg == "--any" {
		}
		if arg == "--help" || arg == "-h" || arg == "/?" {
			display_help()
			return
		}
	}

	if len(arguments) > 5 {
		display_help()
		return
	}

	curlptr := curl.easy_init()
	if curlptr == nil {
		os.exit(1)
	}

	curl.easy_setopt(curlptr, curl.OPT_URL, "https://example.com")
	res := curl.easy_perform(curlptr)
	curl.easy_cleanup(curlptr)
	fmt.println("Res was ", res)


}
