# ableton_git

A shell script to commit and checkout Ableton files to/from Git

Commits your `als` file to git by converting to/from `xml`.

DISCLAIMER: only intended for solo use currently; doesn't take advantage of collborative features of Git (`branching` etc.)

Requires `gzip` to be on your machine.

# Usage:

Initialise a git repo in the same directory as your project's `als` file.

Open terminal inside your project folder...

Commit a project

```
./ableton_git.sh commit my-track-name "Added drums"
```

Checkout a project

```
./ableton_git.sh checkout my-track-name
```

# Todo
- [ ] Error handling
- [ ] branching
- [ ] other Git commands: `log`, `rebase`
- [ ] you tell me ;)
