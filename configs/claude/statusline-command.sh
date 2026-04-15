#!/usr/bin/env bash
input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
model=$(echo "$input" | jq -r '.model.display_name // empty')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Shorten cwd: replace $HOME with ~
home_dir="$HOME"
short_dir="${cwd/#$home_dir/\~}"
# Show only the last component (like \W in robbyrussell)
dir_name=$(basename "$short_dir")
[ "$short_dir" = "~" ] && dir_name="~"

# Git branch (skip optional lock)
branch=""
if git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
  branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null)
fi

# Build output with ANSI colors (robbyrussell palette, dimmed-friendly)
output=""

# Arrow (cyan)
output+="\033[36m➜\033[0m  "

# Directory (green)
output+="\033[32m${dir_name}\033[0m"

# Git branch (red/yellow)
if [ -n "$branch" ]; then
  output+=" \033[33mgit:(\033[31m${branch}\033[33m)\033[0m"
fi

# Model (dim blue)
if [ -n "$model" ]; then
  output+="  \033[34m${model}\033[0m"
fi

# Context usage
if [ -n "$used" ]; then
  printf_used=$(printf "%.0f" "$used")
  output+=" \033[90mctx:${printf_used}%%\033[0m"
fi

# Caveman plugin badge (empty when plugin is inactive)
caveman_badge=$(bash /Users/michalczukm/.claude/plugins/marketplaces/caveman/hooks/caveman-statusline.sh 2>/dev/null)
if [ -n "$caveman_badge" ]; then
  output+="  ${caveman_badge}"
fi

printf "%b" "$output"
