cask "keypace" do
  version "0.3"
  sha256 "97ef9df9bb998e6efb9fc8395a9d49ba0da493b41f11ef9e751a989f7d98c945"

  url "https://github.com/sanvithreddyy/keypace/releases/download/v#{version}/Keypace-#{version}.dmg"
  name "Keypace"
  desc "Menu-bar typing speed tracker"
  homepage "https://github.com/sanvithreddyy/keypace"

  # Keypace updates itself from 0.3 on; brew upgrade leaves it to the app.
  auto_updates true
  depends_on macos: :sequoia

  app "Keypace.app"

  # Not notarized: clear the download quarantine so it opens without Open Anyway.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Keypace.app"],
        writable_paths: ["{{appdir}}/Keypace.app"]
  end
end
