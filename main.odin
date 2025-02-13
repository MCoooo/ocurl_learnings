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


main :: proc() {

	arguments := os.args[1:]

	url_arg := "https://script.google.com/macros/s/AKfycbyd5AcbAnWi2Yn0xhFRbyzS4qMq1VucMVgVvhul5XqS9HkAyJY/exec?tz=Europe%2FLondon"

	for arg, i in arguments {
		if arg == "--any" {
		}
		if arg == "--help" || arg == "-h" || arg == "/?" {
			display_help()
			return
		}
		if arg == "--url" || arg == "-u" {
			if i + 1 > len(arguments) {
				display_help()
				return
			}
			url_arg = arguments[i + 1]
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

	curl.easy_setopt(curlptr, curl.OPT_URL, url_arg)
	curl.easy_setopt(curlptr, curl.OPT_FOLLOWLOCATION, url_arg)
	res := curl.easy_perform(curlptr)
	curl.easy_cleanup(curlptr)

	if res > 0 {
		buf: [1]byte
		res_str := strconv.itoa(buf[:], int(res))
		epair("Res was ", res_str)
	}


}
