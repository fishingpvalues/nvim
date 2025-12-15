package main

import "testing"

func TestAdd(t *testing.T) {
    if 1+1 != 2 {
        t.Error("1+1 should be 2")
    }
}
