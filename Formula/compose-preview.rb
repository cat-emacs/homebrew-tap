class ComposePreview < Formula
  desc "Compose Preview rendering with the standalone layoutlib renderer"
  homepage "https://github.com/cat-emacs/compose-preview"
  url "https://github.com/cat-emacs/compose-preview/releases/download/v0.1.2/compose-preview-0.1.2.tar.gz"
  sha256 "d36c62888634c5b72e1c9e16abb96f7f8ee28c7b847bb82394cfe036c2668a41"
  license "GPL-3.0-or-later"

  depends_on "openjdk"

  def install
    libexec.install Dir["*"]
    (bin/"compose-preview").write_env_script libexec/"bin/compose-preview", Language::Java.overridable_java_home_env
  end

  test do
    result = JSON.parse(shell_output("#{bin}/compose-preview doctor --json"))
    assert_equal 1, result["schemaVersion"]
    assert_equal "ready", result["status"]
  end
end
