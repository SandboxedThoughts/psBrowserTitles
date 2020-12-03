$Browsers = "firefox", "edge", "chrome"


Function GetBrowsers {
  ForEach ($browser in $Browsers) {
    if (get-process $browser -ErrorAction SilentlyContinue) {
      "$browser"
    }
  }
}

function GetActive {
  ForEach ($browser in $Browsers) {
    if (get-process $browser -ErrorAction SilentlyContinue) {
      $title = get-process $browser | select-object mainwindowtitle | convertto-HTML | Select-String -Pattern "(?!</td>)([a-zA-Z0-9\~\!\@\#\$\%\^\&\*\(\)_\-\=\+\\\/\?\.\:\;\'\,\s\—]*)</td>(?!</td>)" 
      $url = $title
      "$env:UserName -- $browser -- $url"
    }
  }
}
