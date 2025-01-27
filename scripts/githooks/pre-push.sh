#!/bin/bash

# Block force push, and use force-with-lease instead
# Remember to make it executable: `chmod +x ./pre-push`

# Acknowledge this is a git hook
echo "== Git Hook: Pre-Push =="

# Check arguments for '--force'
for arg in "$@"; do
  if [[ "$arg" == "--force" ]]; then
    echo "========================================"
    echo "🚫 Using 'git push --force' is blocked!"
    echo "🌱 Please use the safer option instead:"
    echo "   git push --force-with-lease"
    echo
    echo "📚 Documentation:"
    echo "- 'git push --force': forcefully overwrites the remote branch."
    echo "- '--force-with-lease': ensures the branch has not been updated remotely by others since your last fetch or pull."
    echo
    echo "Pro Tip: Use the following command for safe force pushing:"
    echo "       git fetch && git push --force-with-lease"
    echo
    echo "☝️ Reminder: Your push attempt has been blocked."
    echo "========================================"
    exit 1
  fi
done

# If '--force' is not found, allow the push to proceed
exit 0