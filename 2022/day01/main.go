package main

import (
	_ "embed"
	"flag"
	"fmt"
	"strings"

	"github.com/stillmatic/advent/2022/ds"
	"github.com/stillmatic/advent/2022/util"
)

//go:embed input.txt
var input string

func init() {
	// do this in init (not main) so test file has same input
	input = strings.TrimRight(input, "\n")
	if len(input) == 0 {
		panic("empty input.txt file")
	}
}

func main() {
	var part int
	flag.IntVar(&part, "part", 1, "part 1 or 2")
	flag.Parse()
	fmt.Println("Running part", part)

	if part == 1 {
		ans := part1(input)
		util.CopyToClipboard(fmt.Sprintf("%v", ans))
		fmt.Println("Output:", ans)
	} else {
		ans := part2(input)
		util.CopyToClipboard(fmt.Sprintf("%v", ans))
		fmt.Println("Output:", ans)
	}
}

func part1(input string) int {
	parsed := parseInput(input)
	max_cnt := 0
	for _, a := range parsed {
		if a > max_cnt {
			max_cnt = a
		}
	}

	return max_cnt
}

func part2(input string) int {
	parsed := parseInput(input)
	hp := ds.NewHeap(func(a int, b int) bool { return a < b })
	for _, a := range parsed {
		hp.Push(-a) // minheap
	}

	return -1 * (hp.Pop() + hp.Pop() + hp.Pop())
}

func parseInput(input string) (ans []int) {
	buff := 0
	for _, line := range strings.Split(input, "\n") {
		if line == "" {
			ans = append(ans, buff)
			buff = 0
		} else {
			buff += util.ToInt(line)
		}
	}
	return ans
}
