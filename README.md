
# 📦 Rmoji 🎉

The **Rmoji** package makes it easy to insert emojis 😎 into your R
scripts, R Markdown, Quarto documents and your shiny dashboards and
websites. It’s a fun and expressive way to enhance your code, reports,
and git commits!

# 🚀 Installation

To install the development version from your local folder or GitHub:

``` r

# From local (path in your computer after downloading the devlopment version)

 devtools::install("path/to/Rmoji") 

# From GitHub 

 devtools::install_github("3p1d3m/Rmoji")
```

# ✨ Features

`insert_emoji()` – Inserts emojis with name-based auto completion.

`insert_emoji_addin()` – A GUI addin to select and insert emojis.

`emoji_shortcut()` – Add to RStudio keyboard shortcuts.

`git_emoji("fire")` – Easily add emojis to your Git commit messages.

`emoji_list()` – View the full emoji dictionary.

# 🔧 Example Usage

``` r
library(Rmoji)

insert_emoji("star")
⭐
insert_emoji("cake")
🍰
git_emoji("gift")
🎁

emoji_list() # show all emojies

check           ✅
cross           ❌
warning         ⚠
info            ℹ
question        ❓
stop            🛑
...
```

# ⌨️ Keyboard short

The main advantage of this package is to visually insert the emoji using
the keyboard shortcut. To custom create a short cut, go to your
`Rstudio-->Tools-->Modify keyboard shortcuts`, then search for
`Emoji shortcut addin` and hit the short cut you want to assign in your
keyboard. Mine is `Cmd + E`. Assign yours as you feel comfortable. Once
the keyboard shortcut is assigned, a popup screen for input will be
displayed on each encounter, and the Emoji name can be provided in the
query. On clicking enter in your keyboard, it will insert the Emoji,
without any code in the cursor line.

![](images/clipboard-162067144.png)

# 💻🔧Adding the Emoji to Your Commit Message

Now, you can include the emoji in your Git commit message. Here’s an
example of how to make a commit in Git, using the system() function to
execute Git commands directly from R console:

``` r
system("git status") # to check the git status 

system("git add {file}")  # Replace with your file name

system("git add -a") # To push all changes at once, less recommende

bug_emoji <- git_emoji("bug") # create the emojy you wanted to push

commit_message <- paste("Fixed the issue with user authentication", bug_emoji)

system(paste("git commit -m", shQuote(commit_message)))
```

## Pushing the Commit to GitHub

If you want to push the commit to your GitHub repository, you can do so
by executing the following command from R:

``` r
# Push the commit to the remote repository

system("git push origin main")  # Replace "main" with your branch if different
```

If you wanted tu put them all togther as well

``` r
system("git add {Path/..} && git commit -m 'update' && git push") # replace the path with yours
```

# 🧠 About

This package is developed by **Berhe Etsay Tesfay** with the inspiration
of the 🤰 moment. Stress, Smile, Hope, Pain, celebration etc all are the
shuffles during 🤰.
