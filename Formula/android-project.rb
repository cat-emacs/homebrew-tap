class AndroidProject < Formula
  desc "Independent Android and Gradle project system"
  homepage "https://github.com/cat-emacs/android-project"
  url "https://github.com/cat-emacs/android-project/releases/download/v0.1.1/android-project-0.1.1.tar.gz"
  sha256 "1756fcc26e09f8f9fbd6b135edb17a503dea7795e5444392ec3457fb5766e711"
  license "GPL-3.0-or-later"

  depends_on "openjdk"

  def install
    libexec.install Dir["*"]
    (bin/"android-project").write_env_script libexec/"bin/android-project", Language::Java.overridable_java_home_env
  end

  test do
    result = JSON.parse(shell_output("#{bin}/android-project doctor --json"))
    assert_equal 1, result["schemaVersion"]
    assert_equal "ready", result["status"]
  end
end
