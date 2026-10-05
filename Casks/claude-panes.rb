cask "claude-panes" do
  version "0.2.0"
  sha256 "46b55858949eb96f52956db250afaab0fa2097036deead0f3bee1cb4e46db298"

  url "https://github.com/listennn08/homebrew-tap/releases/download/claude-panes-v#{version}/Claude-Panes-#{version}-arm64.zip"
  name "Claude Panes"
  desc "Zellij-style desktop UI for Claude Code sessions"
  homepage "https://github.com/listennn08/homebrew-tap"

  depends_on arch: :arm64

  app "Claude Panes.app"

  # The build is only ad-hoc signed, so Gatekeeper would refuse the downloaded copy; drop the quarantine flag.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Claude Panes.app"]
  end

  caveats <<~EOS
    Claude Panes drives the Claude Code CLI: install and log in to `claude` first.
  EOS

  zap trash: [
    "~/Library/Caches/com.botrista.claude-panes",
    "~/Library/WebKit/com.botrista.claude-panes",
  ]
end
