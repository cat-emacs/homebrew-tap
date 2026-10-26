class ComposePreview < Formula
  desc "Compose Preview rendering with the standalone layoutlib renderer"
  homepage "https://github.com/cat-emacs/compose-preview"
  url "https://github.com/cat-emacs/compose-preview/releases/download/v0.1.3/compose-preview-0.1.3.tar.gz"
  sha256 "31e4bf8a825b3b9e6b87b898ca8728e8b225ba4fe1070a56936eb0af14889537"
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
