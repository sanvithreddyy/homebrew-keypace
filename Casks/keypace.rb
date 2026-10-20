cask "keypace" do
  version "0.2"
  sha256 "3eccc31e9bdc9e917afca6157eab983a27c3c4b897965485f0f62d092c036571"

  url "https://github.com/sanvithreddyy/keypace/releases/download/v#{version}/Keypace-#{version}.dmg"
  name "Keypace"
  desc "Menu-bar typing speed tracker"
  homepage "https://github.com/sanvithreddyy/keypace"

  depends_on macos: :sequoia

  app "Keypace.app"

  # Not notarized: clear the download quarantine so it opens without Open Anyway.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Keypace.app"],
        writable_paths: ["{{appdir}}/Keypace.app"]
  end
end
