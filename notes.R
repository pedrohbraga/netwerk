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

gh_token_help()

create_github_token()

# Add this script to .Rbuildignore
usethis::use_build_ignore("notes.R")

# Add mit_license to DESCRIPTION
usethis::use_mit_license(copyright_holder = "Pedro Henrique Pereira Braga")

# Make new R script titled matrix_addition
usethis::use_r("dbase_fn")

## Test
use_test("testing_the_dbase_fn")

## Add data

x <- 1
y <- 2

use_data(x, y, overwrite = TRUE)
usethis::use_r("x")
usethis::use_r("y")
## Increment package version

use_version(which = "minor")

## Add an RMarkdown Template

use_rmarkdown_template(
  template_name = "Template Name",
  template_dir = NULL,
  template_description = "A description of the template",
  template_create_dir = FALSE
)

## Check it

use_github_action_check_release(
  save_as = "R-CMD-check.yaml",
  ignore = TRUE,
  open = FALSE
)

usethis::use_github_action_check_standard()

##

roxygen2::roxygenize('.', roclets=c('rd', 'collate', 'namespace'))

##

install.packages("assertthat")

##

usethis::use_package("assertthat")

