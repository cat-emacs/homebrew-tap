class ComposePreview < Formula
  desc "Compose Preview rendering with the standalone layoutlib renderer"
  homepage "https://github.com/cat-emacs/compose-preview"
  url "https://github.com/cat-emacs/compose-preview/releases/download/v0.1.4/compose-preview-0.1.4.tar.gz"
  sha256 "12da7c65abee64372e54386bbe1f9ed3dacca2c06354f572cfd3a2fe5eef426b"
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
