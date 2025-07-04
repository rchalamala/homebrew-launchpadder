cask "launchpadder" do
  version "1.4"
  sha256 "e6f22aec28546b3ab418cb06c9a26c696126c4ec4daeeaebd1a427a8c8b86390"

  url "https://github.com/Molay/LaunchPadder/releases/download/v#{version}/LaunchPadder-v#{version}.zip",
      verified: "github.com/Molay/LaunchPadder/"

  name "LaunchPadder"
  desc "macOS LaunchPad tool that organizes and sorts apps and folders on LaunchPad according to certain rules"
  homepage "https://github.com/Molay/LaunchPadder"

  app "LaunchPadder.app"

  postflight do
    plist = "#{appdir}/LaunchPadder.app/Contents/Info.plist"
    system_command "/usr/libexec/PlistBuddy",
                   args: ["-c", "Add :LSUIElement bool true", plist],
                   sudo: false
    system_command "/usr/bin/codesign",
                   args: ["--force", "--deep", "--sign", "-", "#{appdir}/LaunchPadder.app"],
                   sudo: false
  end
end