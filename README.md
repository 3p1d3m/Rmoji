
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
keyboard. Mine is `Cmd + E`. Assign yours as you feel comfortable.

# 🧠 About

This package is developed by **Berhe Etsay Tesfay** with the inspiration
of the 🤰 moment. Stress, Smile, Hope, Pain, celebration etc all are the
shuffles during 🤰.
