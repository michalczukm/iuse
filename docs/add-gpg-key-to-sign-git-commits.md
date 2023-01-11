# Add GPG key to sign git commits

## Problem

While trying to merge your PR (assuming that you require signing commits), you might spot

```md
The base branch requires all commits to be signed
```

**if** you’re not using GPG signatures for your commits.

## How to sign our commits with GPG

1. Install gnupg
   - from [https://www.gnupg.org/download/](https://www.gnupg.org/download/)
   - or via brew `brew install gnupg` ([https://formulae.brew.sh/formula/gnupg](https://formulae.brew.sh/formula/gnupg))
2. Check if you have existing GRG keys with `gpg --list-secret-keys --keyid-format=long`, you probably **don’t have**. So continue to next step 🙂
   - more details on [https://docs.github.com/en/authentication/managing-commit-signature-verification/checking-for-existing-gpg-keys](https://docs.github.com/en/authentication/managing-commit-signature-verification/checking-for-existing-gpg-keys)
3. Generate GPG key with and export it
   - Generate key by `gpg --full-generate-key`
   - Get list of keys by `gpg --list-secret-keys --keyid-format=long``
   - Export it with `gpg --armor --export <KEY_ID>`
   - more details on [https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)
4. Add GPG key to your GitHub account as described in [https://docs.github.com/en/authentication/managing-commit-signature-verification/adding-a-gpg-key-to-your-github-account](https://docs.github.com/en/authentication/managing-commit-signature-verification/adding-a-gpg-key-to-your-github-account)
5. Set your GPG sign to your local git
   - Run `git config --global user.signingkey <KEY_ID>`
   - more details on [https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key](https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key)

<aside>
💡 Remember that to sign a commit you should commit with `-S` flag ex: `$ git commit -S -m *"your commit message"`*

Or, you can make it permanent with `git config --global commit.gpgsign true`

</aside>

<aside>
💡 You might need to set env var (I had to do it after restart of terminal)
`export GPG_TTY=$(tty)`
[https://stackoverflow.com/a/42265848/2029818](https://stackoverflow.com/a/42265848/2029818)

</aside>

### Extras

If you’d like to have multiple `UID`s for multiple email addresses but for the same gpg key, you have to add new `UID`

```jsx
$ gpg --edit-key <keyID>
```

Then add new one, and quit with saving

Then verify if you have all `UIDs` added with `gpg --list-secret-keys --keyid-format=long`

In my example the result is

```jsx
➜  gpg --list-secret-keys --keyid-format=long
/Users/michalczukm/.gnupg/pubring.kbx
-------------------------------------
sec   ed25519/<MY-KEY-ID> 2022-08-17 [SC]
      <SIGNATURE>
uid                 [ultimate] Michał Michalczuk <michal.michalczuk@tektitconsulting.com>
uid                 [ultimate] Michał Michalczuk <michalczukm@gmail.com>
ssb   cv25519/<SIG> 2022-08-17 [E]
```
