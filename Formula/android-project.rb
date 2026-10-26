class AndroidProject < Formula
  desc "Independent Android and Gradle project system"
  homepage "https://github.com/cat-emacs/android-project"
  url "https://github.com/cat-emacs/android-project/releases/download/v0.1.4/android-project-0.1.4.tar.gz"
  sha256 "74605517cde27693e78b16975b9cb2b176ce317e2d9bc964895724e8acbd8833"
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
