# frozen_string_literal: true

cask "claude-panes" do
  version "0.3.1"
  sha256 "0ff15545d97c55bffe9b5e372ea370aa614d545603833475705326526c29d12f"

  url "https://github.com/listennn08/homebrew-tap/releases/download/claude-panes-v#{version}/Claude-Panes-#{version}-arm64.zip"
  name "Claude Panes"
  desc "Zellij-style desktop UI for Claude Code sessions"
  homepage "https://github.com/listennn08/homebrew-tap"

  depends_on arch: :arm64

  app "Claude Panes.app"

  # The build is only ad-hoc signed, so Gatekeeper would refuse the downloaded copy; drop the quarantine flag.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Claude Panes.app"],
        writable_paths: ["{{appdir}}/Claude Panes.app"],
        must_succeed:   false
  end

  zap trash: [
    "~/Library/Caches/com.listennn08.claude-panes",
    "~/Library/WebKit/com.listennn08.claude-panes",
  ]

  caveats <<~EOS
    Claude Panes drives the Claude Code CLI: install and log in to `claude` first.
  EOS
end
