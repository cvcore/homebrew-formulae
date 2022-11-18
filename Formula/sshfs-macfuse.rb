class SshfsMacfuse < Formula
  desc "File system client based on SSH File Transfer Protocol"
  homepage "https://github.com/osxfuse/sshfs"
  url "https://github.com/osxfuse/sshfs/archive/osxfuse-sshfs-2.5.0.tar.gz"
  sha256 "8ea4d3d5bc0f343998009d7eb138e3804490f6a22e890c6de4eadc6fd2414ae0"
  license any_of: ["LGPL-2.1-only", "GPL-2.0-only"]
  revision 1

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  # depends_on "libtool" => :build
  # depends_on "pkg-config" => :build
  depends_on "glib"
  depends_on :macos


  patch :DATA

  def install
    ENV.deparallelize  # if your formula fails when building in parallel

    system "autoreconf", "-i"
    system "./configure", *std_configure_args
    system "/usr/bin/make"
    system "/usr/bin/make", "install"
  end

  test do
    system "#{bin}/sshfs", "--version"
  end
end
__END__
diff --git a/sshfs.c b/sshfs.c
index b09484c..e90382e 100644
--- a/sshfs.c
+++ b/sshfs.c
@@ -13,7 +13,7 @@
 #include <fuse_opt.h>
 #include <fuse_lowlevel.h>
 #ifdef __APPLE__
-#  include <fuse_darwin.h>
+//#  include <fuse_darwin.h>
 #endif
 #include <assert.h>
 #include <stdio.h>
