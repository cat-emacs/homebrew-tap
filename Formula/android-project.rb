class AndroidProject < Formula
  desc "Independent Android and Gradle project system"
  homepage "https://github.com/cat-emacs/android-project"
  url "https://github.com/cat-emacs/android-project/releases/download/v0.1.0/android-project-0.1.0.tar.gz"
  sha256 "955aecf723d3b368351cdfa270d85fbb3a16a92371fb60bde1812fdbe1e68f9d"
  license "GPL-3.0-or-later"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    (bin/"android-project").write_env_script libexec/"bin/android-project", Language::Java.overridable_java_home_env("17")
  end

  test do
    result = JSON.parse(shell_output("#{bin}/android-project doctor --json"))
    assert_equal 1, result["schemaVersion"]
    assert_equal "ready", result["status"]
  end
end
