dep "quantal apt source" do
  setup {
    @list =  "/etc/apt/sources.list.d/quantal.list"
  }
  met? {
    File.exist? @list
  }
  meet {
    sudo "tee #{@list}", :input => <<-EOF
deb http://archive.ubuntu.com/ubuntu quantal main
deb http://archive.ubuntu.com/ubuntu quantal universe
EOF
  }
  after {
    sudo "aptitude update"
  }
end
