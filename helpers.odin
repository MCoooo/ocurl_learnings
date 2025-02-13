package main

import color "./odin-color"
import "core:fmt"

opair :: proc(key: string, value: string) {
	fmt.printfln("%v: %v", color.green(key), color.yellow(value))
}

oblue :: proc(key: string) {
	fmt.printfln("%v", color.blue(key))
}
