package main

import (
	"flag"
	"fmt"
	"log"
	"bufio"
	"os"
	"net/url"
)

func check(e error) {
	if e != nil {
		panic(e)
	}
}

func main() {

	flag.Parse()
	// var data []byte
	var data string
	
	var err error
	switch flag.NArg() {

	case 0:
		// data, err = ioutil.ReadAll(os.Stdin)
		// check(err)
		// fmt.Printf("stdin data: %v\n", string(data))
		scanner := bufio.NewScanner(os.Stdin)
		for scanner.Scan() {
			 data = scanner.Text()
		}

		if err := scanner.Err(); err != nil {
			log.Println(err)
		}
		break
	case 1:
		data = flag.Arg(0)
		check(err)
		// fmt.Printf("file data: %v\n", string(data))
		break
	default:
		if (flag.NArg() > 1) {
			fmt.Printf("too many cli arguments provided, only 1 is supported\n")
		} else {
			fmt.Printf("waiting ...\n")
		}
		os.Exit(1)
	}

    decodedValue, err := url.QueryUnescape(data)
	check(err)
	fmt.Println(decodedValue)
}
