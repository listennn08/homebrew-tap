# frozen_string_literal: true

cask "rustle" do
  version "0.4.0"
  sha256 "d3d9f47e74b7788615866a0231606cb01dc025afcfe2429de9fa174de8fb53b5"

  url "https://github.com/listennn08/homebrew-tap/releases/download/rustle-v#{version}/Rustle-#{version}-arm64.zip"
  name "Rustle"
  desc "Lightweight MongoDB GUI with shell and SQL queries"
  homepage "https://github.com/listennn08/homebrew-tap"

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Rustle.app"

  # Not notarized (no Developer ID), so Gatekeeper would refuse the downloaded copy; drop the quarantine flag.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Rustle.app"],
        writable_paths: ["{{appdir}}/Rustle.app"],
        must_succeed:   false
  end

  # Saved connections live in the Keychain (service "rustle"); remove them in Keychain Access.
  zap trash: "~/Library/Application Support/rustle"
end
