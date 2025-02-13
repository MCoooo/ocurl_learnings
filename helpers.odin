package main

import color "./odin-color"
import "core:fmt"

opair :: proc(key: string, value: string) {
	fmt.printfln("%v: %v", color.green(key), color.yellow(value))
}

epair :: proc(key: string, value: string) {
	fmt.printfln("%v: %v", color.green(key), color.bright_red(value))
}

oblue :: proc(key: string) {
	fmt.printfln("%v", color.blue(key))
}


display_help :: proc() {
	oblue("")
	oblue("Usage: ip.exe [options]")
	oblue("Options:")
	oblue("  --url         Display all available adapters.")
	oblue("Example:")
	oblue("  ocurl.exe --url https://example.com")
	oblue("")
}
