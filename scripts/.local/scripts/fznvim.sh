#!/usr/bin/env bash

find -maxdepth 5 -type f ! -path "*/.vscode*/*" ! -path "*/.dotnet/*" ! -path "*/node_modules/*" ! -path "*/.git/*" ! -path "*/.npm/*" | fzf --preview "cat {}" --bind "enter:become(nvim {})"

