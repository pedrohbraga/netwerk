library(usethis)

# Create a new package -------------------------------------------------
path <- file.path(choose.dir(), "netwerk")

usethis::create_package(path)

proj_activate(path)


# Modify the description ----------------------------------------------
use_mit_license("My Name")

use_package("MASS", "Suggests")


# Set up other files -------------------------------------------------
use_readme_md()

use_news_md()

# Use git ------------------------------------------------------------
use_git()

use_github()
2gh_token_help()


create_github_token()

# Add this script to .Rbuildignore
usethis::use_build_ignore("dev.R")
