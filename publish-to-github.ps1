param(
  [string]$RepoName = "seedance-storyboard-generator",
  [ValidateSet("public", "private", "internal")]
  [string]$Visibility = "public"
)

$ErrorActionPreference = "Stop"

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
  throw "GitHub CLI is not installed. Install it first: winget install --id GitHub.cli"
}

gh auth status | Out-Null

$remote = git remote get-url origin 2>$null
if (-not $remote) {
  gh repo create $RepoName --source . --$Visibility --push
} else {
  git push -u origin main
}
