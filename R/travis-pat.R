#' Set the GITHUB_PAT variable on Travis
#'
#' Assigns a GitHub PAT to the `GITHUB_PAT` private variable on Travis CI
#' via [travis_set_var()],
#' among others this works around GitHub API rate limitations.
#' By default, the PAT is obtained from [github_create_pat()].
#'
#' @param pat `[string]`\cr
#'   If set, avoids calling `github_create_pat()`
#' @inheritParams travis_repo_info
#' @param repo_id `[string]`\cr
#'   The repo ID, obtained from [travis_repo_id()] by default.
#' @inheritParams github_create_repo
#'
#' @family Travis CI functions
#'
#' @export
travis_set_pat <- function(pat = NULL,
                           repo = github_repo(),
                           token = travis_token(repo),
                           repo_id = travis_repo_id(repo, token),
                           quiet = FALSE) {
  if (is.null(pat)) {
    pat <- github_create_pat(repo = repo)
  }
  travis_set_var(
    "GITHUB_PAT", pat, public = FALSE,
    token = token, repo_id = repo_id, quiet = quiet)
}
