#!/usr/bin/env bash

  fzf --preview "cat {}" --bind "enter:become(nvim {})"

